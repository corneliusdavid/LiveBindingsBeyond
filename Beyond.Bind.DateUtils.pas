unit Beyond.Bind.DateUtils;
(*
 * Beyond standard LiveBindings - Date Utils
 *)

interface

implementation

uses
  System.Bindings.Methods, System.Bindings.EvalProtocol,
  System.Bindings.Consts, System.TypInfo,
  System.Rtti, System.SysUtils, System.Math,
  System.TimeSpan;

/// <summary>
///   Now()
/// </summary>
/// <returns>
///   TDateTime
/// </returns>
function MakeNowMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      begin
        Result := TValueWrapper.Create(Now);
      end);
end;

/// <summary>
///   Used in several local MakeXXX functions to ensure there's only
///   one argument and that it's a date
/// </summary>
procedure CheckArgs(Args: TArray<IValue>; var ADateTime: TDateTime; var DecimalDigits: Integer);
var
  v1, v2: IValue;
begin
  // Ensure two argument is received.
  if Length(Args) <> 2 then
    raise EEvaluatorError.Create(Format(sUnexpectedArgCount, [2, Length(Args)]));

  // verify first one is a date (float)
  v1 := Args[0];
  if not (v1.GetType.Kind in [tkFloat]) then
    raise EEvaluatorError.Create('First argument must be TDateTime')
  else
    ADateTime := v1.GetValue.AsExtended;

  v2 := Args[1];
  if not (v2.GetType.Kind in [tkInteger, tkInt64]) then
    raise EEvaluatorError.Create('Second argument must be Integer')
  else
    DecimalDigits := v2.GetValue.AsInteger;
end;

/// <summary>
///   YearsSince(TDateTime)
/// </summary>
/// <returns>
///   Integer
/// </returns>
function MakeYearsSinceMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        InputDate: TDateTime;
        RoundDigits: Integer;
        YearsSince: Double;
      begin
        CheckArgs(Args, InputDate, RoundDigits);
        YearsSince := RoundTo(TTimeSpan.Subtract(Now, InputDate).TotalDays / 365.25, RoundDigits);

        Result := TValueWrapper.Create(YearsSince);
      end);
end;

/// <summary>
///   MonthsSince(TDateTime)
/// </summary>
/// <returns>
///   Integer
/// </returns>
function MakeMonthsSinceMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        InputDate: TDateTime;
        RoundDigits: Integer;
        MonthsSince: Double;
      begin
        CheckArgs(Args, InputDate, RoundDigits);
        MonthsSince := RoundTo(TTimeSpan.Subtract(Now, InputDate).TotalDays / 12.0, RoundDigits);

        Result := TValueWrapper.Create(MonthsSince);
      end);
end;

/// <summary>
///   DaysSince(TDateTime)
/// </summary>
/// <returns>
///   Integer
/// </returns>
function MakeDaysSinceMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        InputDate: TDateTime;
        RoundDigits: Integer;
        DaysSince: Double;
      begin
        CheckArgs(Args, InputDate, RoundDigits);
        DaysSince := RoundTo(TTimeSpan.Subtract(Now, InputDate).TotalDays, RoundDigits);

        Result := TValueWrapper.Create(DaysSince);
      end);
end;

/// <summary>
///   MinutesSince(TDateTime)
/// </summary>
/// <returns>
///   Integer
/// </returns>
function MakeMinutesSinceMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        InputDate: TDateTime;
        RoundDigits: Integer;
        MinutesSince: Double;
      begin
        CheckArgs(Args, InputDate, RoundDigits);
        MinutesSince := RoundTo(TTimeSpan.Subtract(Now, InputDate).TotalMinutes, RoundDigits);

        Result := TValueWrapper.Create(MinutesSince);
      end);
end;

/// <summary>
///   HoursSince(TDateTime)
/// </summary>
/// <returns>
///   Integer
/// </returns>
function MakeHoursSinceMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        InputDate: TDateTime;
        RoundDigits: Integer;
        HoursSince: Double;
      begin
        CheckArgs(Args, InputDate, RoundDigits);
        HoursSince := RoundTo(TTimeSpan.Subtract(Now, InputDate).TotalHours, RoundDigits);

        Result := TValueWrapper.Create(HoursSince);
      end);
end;

/// <summary>
///   SecondsSince(TDateTime)
/// </summary>
/// <returns>
///   Integer
/// </returns>
function MakeSecondsSinceMethod: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
      var
        InputDate: TDateTime;
        RoundDigits: Integer;
        SecondsSince: Double;
      begin
        CheckArgs(Args, InputDate, RoundDigits);
        SecondsSince := RoundTo(TTimeSpan.Subtract(Now, InputDate).TotalSeconds, RoundDigits);

        Result := TValueWrapper.Create(SecondsSince);
      end);
end;

const
  sUnitName = 'Beyond.Bind.DateUtils';
  sNowName = 'Now';
  sYearsSinceName  = 'YearsSince';
  sMonthsSinceName = 'MonthsSince';
  sDaysSinceName   = 'DaysSince';
  sHoursSinceName   = 'HoursSince';
  sMinutesSinceName = 'MinutesSince';
  sSecondsSinceName = 'SecondsSince';

procedure RegisterMethods;
begin
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(MakeNowMethod,
      sNowName, sNowName, sUnitName, True,
      'Returns the current date/time', nil));
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(MakeYearsSinceMethod,
      sYearsSinceName, sYearsSinceName, sUnitName, True,
      'Returns the number of years since the given date/time', nil));
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(MakeMonthsSinceMethod,
      sMonthsSinceName, sMonthsSinceName, sUnitName, True,
      'Returns the number of months since the given date/time', nil));
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(MakeDaysSinceMethod,
      sDaysSinceName, sDaysSinceName, sUnitName, True,
      'Returns the number of days since the given date/time', nil));
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(MakeHoursSinceMethod,
      sHoursSinceName, sHoursSinceName, sUnitName, True,
      'Returns the number of hours since the given date/time', nil));
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(MakeMinutesSinceMethod,
      sMinutesSinceName, sMinutesSinceName, sUnitName, True,
      'Returns the number of minutes since the given date/time', nil));
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(MakeSecondsSinceMethod,
      sSecondsSinceName, sSecondsSinceName, sUnitName, True,
      'Returns the number of seconds since the given date/time', nil));
end;

procedure UnregisterMethods;
begin
  TBindingMethodsFactory.UnRegisterMethod(sNowName);
  TBindingMethodsFactory.UnRegisterMethod(sYearsSinceName);
  TBindingMethodsFactory.UnRegisterMethod(sMonthsSinceName);
  TBindingMethodsFactory.UnRegisterMethod(sDaysSinceName);
  TBindingMethodsFactory.UnRegisterMethod(sHoursSinceName);
  TBindingMethodsFactory.UnRegisterMethod(sMinutesSinceName);
  TBindingMethodsFactory.UnRegisterMethod(sSecondsSinceName);
end;

initialization
  RegisterMethods;
finalization
  UnregisterMethods;
end.

