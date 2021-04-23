unit Beyond.Bind.StrUtils;
(*
 * Beyond standard LiveBindings - String Utils
 *)

interface

implementation

uses
  System.SysUtils, System.TypInfo, System.StrUtils,
  System.Bindings.Methods, System.Bindings.EvalProtocol,
  System.Bindings.Consts, System.Rtti;

/// <summary>
///   StrLen(String)
/// </summary>
/// <remarks>
///   Returns the current date/time
/// </remarks>
/// <returns>
///   Integer
/// </returns>
function MakeStrLenMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        v1: IValue;
        vLen: Integer;
      begin
        // Ensure exacty 1 argument
        if Length(Args) <> 1 then
          raise EEvaluatorError.Create(Format(sUnexpectedArgCount, [1, Length(Args)]));

        // verify it's a string
        v1 := Args[0];
        if not (v1.GetType.Kind in [tkString, tkUString, tkWString]) then begin
          var v1Kind: string := TRttiEnumerationType.GetName(v1.GetType.Kind);
          raise EEvaluatorError.Create('The arguement to StrLen must be string; instead, got ' + v1Kind);
        end;

        // return the length
        vLen := Length(v1.GetValue.AsString);
        Result := TValueWrapper.Create(vLen);
      end);
end;

/// <summary>
///   DoubleAmp(String)
/// </summary>
/// <remarks>
///   Doubles ampersand signs so that the accelerator chars aren't shown.
///   However, a TLabel's ShowAccelChar property can be set False, so
///   this method is probably not needed.
/// </remarks>
/// <returns>
///   String
/// </returns>
function MakeDoubleAmpMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        v1: IValue;
        InputStr: string;
      begin
        // Ensure exacty 1 argument
        if Length(Args) <> 1 then
          raise EEvaluatorError.Create(Format(sUnexpectedArgCount, [1, Length(Args)]));

        // verify it's a string
        v1 := Args[0];
        if not (v1.GetType.Kind in [tkString, tkUString, tkWString]) then begin
          var v1Kind: string := TRttiEnumerationType.GetName(v1.GetType.Kind);
          raise EEvaluatorError.Create('Arguement to DoubleAmp must be string; instead, got ' + v1Kind);
        end;

        // double the ampersands
        InputStr := v1.GetValue.AsString;
        Result := TValueWrapper.Create(ReplaceStr(InputStr, '&', '&&'));
      end);
end;


const
  sUnitName = 'Beyond.Bind.StrUtils';
  sStrLenName = 'StrLen';
  sDoubleAmpName = 'DoubleAmp';

procedure RegisterMethods;
begin
  TBindingMethodsFactory.RegisterMethod(
      TMethodDescription.Create(MakeStrLenMethod,
         sStrLenName, sStrLenName, sUnitName, True,
         'Returns the length of the given string', nil));
  TBindingMethodsFactory.RegisterMethod(
     TMethodDescription.Create(MakeDoubleAmpMethod,
         sDoubleAmpName, sDoubleAmpName, sUnitName, True,
         'Returns a string with ampersands duplicated to prevent conversion to hotkey indicators', nil));
end;

procedure UnregisterMethods;
begin
  TBindingMethodsFactory.UnRegisterMethod(sStrLenName);
  TBindingMethodsFactory.UnRegisterMethod(sDoubleAmpName);
end;

initialization
  RegisterMethods;
finalization
  UnregisterMethods;
end.
