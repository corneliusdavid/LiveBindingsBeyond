unit Beyond.Bind.DateUtils;
(*
 * Beyond standard LiveBindings - Date Utils
 *)

interface

implementation

uses
  System.SysUtils,
  System.Bindings.Methods, System.Bindings.EvalProtocol,
  System.Bindings.Consts, System.TypInfo,
  System.TimeSpan;

/// <summary>
///   Now()
/// </summary>
/// <returns>
///   Date/Time
/// </returns>
function MakeNowMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      begin
        Result := TValueWrapper.Create(Now);
      end);
end;

/// <summary>
///   YearsSince(Date)
/// </summary>
/// <returns>
///   Integer
/// </returns>
function MakeYearsSinceMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        v1: IValue;
        InputDate: TDate;
        YearsSince: Double;
      begin
        // Ensure only one argument is received.
        if Length(Args) <> 1 then
          raise EEvaluatorError.Create(Format(sUnexpectedArgCount, [1, Length(Args)]));

        // verify it's a date (float)
        v1 := Args[0];
        if not (v1.GetType.Kind in [tkFloat]) then
          raise EEvaluatorError.Create('Argument to YearsSince must be TDate');

        // calc result
        InputDate := v1.GetValue.AsExtended;
        YearsSince := TTimeSpan.Subtract(Now, InputDate).TotalDays / 365.25;

        Result := TValueWrapper.Create(YearsSince);
      end);
end;


const
  sUnitName = 'Beyond.Bind.DateUtils';
  sNowName = 'Now';
  sYearsSinceName = 'YearsSince';

procedure RegisterMethods;
begin
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(MakeNowMethod,
      sNowName, sNowName, sUnitName, True,
      'Returns the current date/time', nil));
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(MakeYearsSinceMethod,
      sYearsSinceName, sYearsSinceName, sUnitName, True,
      'Returns the number of years since the given date', nil));
end;

procedure UnregisterMethods;
begin
  TBindingMethodsFactory.UnRegisterMethod(sNowName);
  TBindingMethodsFactory.UnRegisterMethod(sYearsSinceName);
end;

initialization
  RegisterMethods;
finalization
  UnregisterMethods;
end.

