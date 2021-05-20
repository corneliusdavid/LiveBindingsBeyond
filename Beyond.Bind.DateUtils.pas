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
function GetSingleDateArg(Args: TArray<IValue>): TDateTime;
var
  v1: IValue;
begin
  // Ensure only one argument is received.
  if Length(Args) <> 1 then
    raise EEvaluatorError.Create(Format(sUnexpectedArgCount, [1, Length(Args)]));

  // verify it's a date (float)
  v1 := Args[0];
  if not (v1.GetType.Kind in [tkFloat]) then
    raise EEvaluatorError.Create('Argument must be TDate');

  Result := v1.GetValue.AsExtended;
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
        InputDate: TDate;
        YearsSince: Double;
      begin
        InputDate := GetSingleDateArg(Args);
        YearsSince := TTimeSpan.Subtract(Now, InputDate).TotalDays / 365.25;

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
        InputDate: TDate;
        MonthsSince: Double;
      begin
        InputDate := GetSingleDateArg(Args);
        MonthsSince := TTimeSpan.Subtract(Now, InputDate).TotalDays / 12.0;

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
        InputDate: TDate;
        DaysSince: Double;
      begin
        InputDate := GetSingleDateArg(Args);
        DaysSince := TTimeSpan.Subtract(Now, InputDate).TotalDays;

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
        InputDate: TDate;
        MinutesSince: Double;
      begin
        InputDate := GetSingleDateArg(Args);
        MinutesSince := TTimeSpan.Subtract(Now, InputDate).TotalMinutes;

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
        InputDate: TDate;
        HoursSince: Double;
      begin
        InputDate := GetSingleDateArg(Args);
        HoursSince := TTimeSpan.Subtract(Now, InputDate).TotalHours;

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
        InputDate: TDate;
        SecondsSince: Double;
      begin
        InputDate := GetSingleDateArg(Args);
        SecondsSince := TTimeSpan.Subtract(Now, InputDate).TotalSeconds;

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
end;

initialization
  RegisterMethods;
finalization
  UnregisterMethods;
end.

