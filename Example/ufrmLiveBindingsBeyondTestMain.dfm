object frmLiveBindingsBeyondTestMain: TfrmLiveBindingsBeyondTestMain
  Left = 0
  Top = 0
  Caption = 'LiveBindings and Beyond Exmplaes'
  ClientHeight = 340
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object pgLBCategories: TRzPageControl
    Left = 0
    Top = 0
    Width = 612
    Height = 340
    Hint = ''
    ActivePage = shtDateTime
    ActivePageDefault = shtDateTime
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 22
    object shtDateTime: TRzTabSheet
      Caption = 'Date/Time'
      ExplicitLeft = 2
      ExplicitTop = 24
      object Label1: TLabel
        Left = 40
        Top = 29
        Width = 220
        Height = 16
        Caption = 'Random Time: Nov 01, 2021 00:58:00'
      end
      object lblYearsSince: TLabel
        Left = 56
        Top = 62
        Width = 195
        Height = 16
        Caption = 'Years since: -0.451976024507567'
      end
      object lblMonthsSince: TLabel
        Left = 56
        Top = 84
        Width = 197
        Height = 16
        Caption = 'Months since: -13.7570202459491'
      end
      object lblDaysSince: TLabel
        Left = 56
        Top = 106
        Width = 177
        Height = 16
        Caption = 'Day since: -165.084242951389'
      end
      object lblMinutesSince: TLabel
        Left = 56
        Top = 150
        Width = 172
        Height = 16
        Caption = 'Minutes since: -237721.30985'
      end
      object lblSecondsSince: TLabel
        Left = 56
        Top = 172
        Width = 180
        Height = 16
        Caption = 'Seconds  since: -14263278.591'
      end
      object lblHoursSince: TLabel
        Left = 56
        Top = 128
        Width = 195
        Height = 16
        Caption = 'Hours sincxe: -3962.02183083333'
      end
    end
  end
  object NavigatorPrototypeBindSrc: TBindNavigator
    Left = 297
    Top = 45
    Width = 40
    Height = 31
    DataSource = PrototypeBindSrc
    VisibleButtons = [nbNext]
    Orientation = orHorizontal
    TabOrder = 1
  end
  object PrototypeBindSrc: TPrototypeBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <
      item
        Name = 'DateTime'
        FieldType = ftDateTime
        Generator = 'DateTime'
        ReadOnly = False
      end>
    ScopeMappings = <>
    Left = 184
    Top = 224
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 92
    Top = 261
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrc
      FieldName = 'DateTime'
      Component = lblYearsSince
      CustomFormat = #39'Years since: '#39' + YearsSince(%s)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption4: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrc
      FieldName = 'DateTime'
      Component = lblMonthsSince
      CustomFormat = #39'Months since: '#39' + MonthsSince(%s)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption5: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrc
      FieldName = 'DateTime'
      Component = lblMinutesSince
      CustomFormat = #39'Minutes since: '#39' + MinutesSince(%s)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrc
      FieldName = 'DateTime'
      Component = lblDaysSince
      CustomFormat = #39'Day since: '#39' + DaysSince(%s)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrc
      FieldName = 'DateTime'
      Component = lblSecondsSince
      CustomFormat = #39'Seconds  since: '#39' + SecondsSince(%s)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption6: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrc
      FieldName = 'DateTime'
      Component = Label1
      CustomFormat = #39'Random Time: '#39' + FormatDateTime('#39'mmm dd, yyyy hh:nn:ss'#39', %s)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption7: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrc
      FieldName = 'DateTime'
      Component = lblHoursSince
      CustomFormat = #39'Hours sincxe: '#39' + HoursSince(%s)'
      ComponentProperty = 'Caption'
    end
  end
end
