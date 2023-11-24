unit Beyond.Bind.Json;
(*
 * Beyond standard LiveBindings - JSON Parsing Utils
 *)

interface

implementation

uses
  System.Bindings.Methods, System.Bindings.EvalProtocol,
  System.Bindings.Consts, System.TypInfo,
  System.Rtti,
  System.SysUtils, System.StrUtils,
  JSON;

/// <summary>
///   JsonValue(JsonString)
/// </summary>
/// <remarks>
///   Example: example: JsonValue('{Id:1, Name:"John"}', 'Name') => 'John'
/// </remarks>
/// <returns>
///   string
/// </returns>
function MakeJsonValueMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        v1: IValue;
        v2: IValue;
        JsonStr: string;
        NameStr: string;
      begin
        // Ensure exacty 2 arguments
        if Length(Args) <> 2 then
          raise EEvaluatorError.Create(Format(sUnexpectedArgCount, [2, Length(Args)]));

        // verify both arguments are strings
        v1 := Args[0];
        v2 := Args[1];
        if (not (v1.GetType.Kind in [tkString, tkUString, tkWString])) or
           (not (v2.GetType.Kind in [tkString, tkUString, tkWString])) then
          raise EEvaluatorError.Create('Both arguments to JsonValue must be String');

        JsonStr := v1.GetValue.AsString;
        NameStr := v2.GetValue.AsString;
        try
          var JsonVal: TJSONValue := TJSONObject.ParseJSONValue(JsonStr);
          try
            var s: string;
            if JSONVal.TryGetValue<string>(NameStr, s) then
              Result := TValueWrapper.Create(s)
            else
              Result := TValueWrapper.Create(EmptyStr);
          finally
            JSONVal.Free;
          end;
        except
          on e:Exception do
            raise EEvaluatorError.Create('Invalid JSON format in JsonValue: ' + JsonStr);
        end;
      end);
end;

/// <summary>
///   JsonArrayValToCSV(JsonString, FieldName)
/// </summary>
/// <remarks>
///   Example: example: JsonArrayValToCSV('[{"Id":1,"Name":"John"},{"Id":2,"Name":"Sue"}]', 'Name') => 'John, Sue'
/// </remarks>
/// <returns>
///   string
/// </returns>
function MakeJsonArrayValToCSVMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        v1, v2: IValue;
        JsonStr: string;
        NameStr: string;
        ResultStr: string;
      begin
        // Ensure exacty 2 arguments
        if Length(Args) <> 2 then
          raise EEvaluatorError.Create(Format(sUnexpectedArgCount, [2, Length(Args)]));

        // verify both arguments are strings
        v1 := Args[0];
        v2 := Args[1];
        if (not (v1.GetType.Kind in [tkString, tkUString, tkWString])) or
           (not (v2.GetType.Kind in [tkString, tkUString, tkWString])) then begin
          var v1Kind: string := TRttiEnumerationType.GetName(v1.GetType.Kind);
          raise EEvaluatorError.Create('The arguement to StrLen must be string; instead, got ' + v1Kind);
        end;

        // go through the array, looking for v2 values, return CSV result+
        JsonStr := v1.GetValue.AsString;
        NameStr := v2.GetValue.AsString;
        try
          ResultStr := EmptyStr;
          var Item: string;
          if JsonStr.Length > 0 then begin
            var JsonVal: TJSONValue := TJSONObject.ParseJSONValue(JsonStr);
            if JsonVal is TJSONArray then begin
              for var i := 0 to TJSONArray(JsonVal).Count - 1 do begin
                Item := TJSONArray(JsonVal)[i].P[NameStr].Value;
                if Item.Length > 0 then begin
                  if ResultStr.Length > 0 then
                    ResultStr := ResultStr + ', ';
                  ResultStr := ResultStr + Item;
                end;
              end;

              if ResultStr.Length = 0 then
                ResultStr := JsonStr;
            end;
          end;

          Result := TValueWrapper.Create(ResultStr);
        except
          Result := TValueWrapper.Create(JsonStr);
        end;
      end);
end;


const
  sUnitName = 'Beyond.Bind.Json';
  sJsonValueName = 'JsonValue';
  sJsonArrayValToCSVName = 'JsonArrayValToCSV';

procedure RegisterMethods;
begin
  TBindingMethodsFactory.RegisterMethod(
      TMethodDescription.Create(MakeJsonValueMethod,
         sJsonValueName, sJsonValueName, sUnitName, True,
         'Get a JSON Value from the given Name', nil));
  TBindingMethodsFactory.RegisterMethod(
      TMethodDescription.Create(MakeJsonArrayValToCSVMethod,
         sJsonArrayValToCSVName, sJsonArrayValToCSVName, sUnitName, True,
         'Convert a JSON array to CSV of the named field', nil));
end;

procedure UnregisterMethods;
begin
  TBindingMethodsFactory.UnRegisterMethod(sJsonValueName);
  TBindingMethodsFactory.UnRegisterMethod(sJsonArrayValToCSVName);
end;

initialization
  RegisterMethods;
finalization
  UnregisterMethods;
end.
