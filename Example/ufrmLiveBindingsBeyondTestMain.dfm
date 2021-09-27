object frmLiveBindingsBeyondTestMain: TfrmLiveBindingsBeyondTestMain
  Left = 0
  Top = 0
  Caption = 'LiveBindings and Beyond Exmplaes'
  ClientHeight = 448
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 16
  object pgcLiveBindTests: TPageControl
    Left = 0
    Top = 0
    Width = 552
    Height = 448
    ActivePage = shtLiveBindDateTime
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object shtLiveBindDateTime: TTabSheet
      Caption = 'Date/Time'
      object Label1: TLabel
        Left = 40
        Top = 29
        Width = 220
        Height = 16
        Caption = 'Random Time: Nov 01, 2021 00:58:00'
      end
      object Label2: TLabel
        Left = 359
        Top = 29
        Width = 121
        Height = 16
        Caption = 'another random date'
      end
      object Label3: TLabel
        Left = 40
        Top = 205
        Width = 213
        Height = 16
        Caption = 'Current time: Sep 26, 2021 21:49:09'
      end
      object lblDaysSince: TLabel
        Left = 56
        Top = 106
        Width = 82
        Height = 16
        Caption = 'Day since: -35'
      end
      object lblHoursSince: TLabel
        Left = 56
        Top = 128
        Width = 118
        Height = 16
        Caption = 'Hours sincxe: -843.1'
      end
      object lblMinutesSince: TLabel
        Left = 56
        Top = 150
        Width = 144
        Height = 16
        Caption = 'Minutes since: -50588.84'
      end
      object lblMonthsSince: TLabel
        Left = 56
        Top = 84
        Width = 113
        Height = 16
        Caption = 'Months since: -2.93'
      end
      object lblSecondsSince: TLabel
        Left = 56
        Top = 172
        Width = 148
        Height = 16
        Caption = 'Seconds  since: -3035300'
      end
      object lblYearsSince: TLabel
        Left = 56
        Top = 62
        Width = 97
        Height = 16
        Caption = 'Years since: -0.1'
      end
      object BindNavigator1: TBindNavigator
        Left = 320
        Top = 22
        Width = 33
        Height = 31
        DataSource = PrototypeBindSrcDates
        VisibleButtons = [nbNext]
        Orientation = orHorizontal
        TabOrder = 0
      end
    end
    object shtLiveBindString: TTabSheet
      Caption = 'String'
      ImageIndex = 1
      DesignSize = (
        544
        414)
      object Label12: TLabel
        Left = 48
        Top = 84
        Width = 409
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        ExplicitWidth = 473
      end
      object Label13: TLabel
        Left = 48
        Top = 211
        Width = 409
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'NetBIOS-friendly name:'
        ExplicitWidth = 473
      end
      object Label4: TLabel
        Left = 48
        Top = 62
        Width = 409
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        ExplicitWidth = 473
      end
      object Label5: TLabel
        Left = 48
        Top = 128
        Width = 409
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = '&Hot key labels--add one in the textbox above'
        ExplicitWidth = 473
      end
      object Label6: TLabel
        Left = 48
        Top = 173
        Width = 409
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        ExplicitWidth = 473
      end
      object lblNetBIOSFriendly: TLabel
        Left = 48
        Top = 233
        Width = 409
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        ExplicitWidth = 473
      end
      object CheckBox1: TCheckBox
        Left = 48
        Top = 150
        Width = 193
        Height = 17
        Caption = 'Show "accelerator" character'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object edtLengthTest: TLabeledEdit
        Left = 48
        Top = 32
        Width = 338
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        EditLabel.Width = 161
        EditLabel.Height = 16
        EditLabel.Caption = 'Modify this string or clear it:'
        TabOrder = 1
        Text = '&Ampersands are accelerators'
        OnChange = LabeledEditChange
      end
    end
    object shtLiveBindJSON: TTabSheet
      Caption = 'JSON'
      ImageIndex = 2
      DesignSize = (
        544
        414)
      object Label10: TLabel
        Left = 32
        Top = 207
        Width = 86
        Height = 16
        Caption = 'Names in CSV:'
      end
      object Label11: TLabel
        Left = 32
        Top = 214
        Width = 449
        Height = 127
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        WordWrap = True
        ExplicitWidth = 513
        ExplicitHeight = 27
      end
      object Label7: TLabel
        Left = 32
        Top = 140
        Width = 179
        Height = 16
        Caption = 'JSON Array with "Name" fields:'
      end
      object Label8: TLabel
        Left = 32
        Top = 185
        Width = 114
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = 'JsonValue of Name:'
        ExplicitTop = 85
      end
      object Label9: TLabel
        Left = 32
        Top = 163
        Width = 96
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = 'JsonValue of Id: '
        ExplicitTop = 63
      end
      object edtJsonArray: TEdit
        Left = 32
        Top = 162
        Width = 449
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 
          '[{"Id":1,"Name":"John"},{"Id":2,"Name":"Sue"},{"Id":3,"Name":"He' +
          'lga"}]'
        OnChange = EditChange
      end
      object edtJSONStr: TLabeledEdit
        Left = 32
        Top = 33
        Width = 449
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        EditLabel.Width = 257
        EditLabel.Height = 16
        EditLabel.Caption = 'JSON String (must have "Id" or "Name" field)'
        TabOrder = 1
        Text = '{"Id":1, "Name":"john"}'
        OnChange = LabeledEditChange
      end
    end
  end
  object PrototypeBindSrcDates: TPrototypeBindSource
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
    Left = 328
    Top = 320
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 228
    Top = 357
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrcDates
      FieldName = 'DateTime'
      Component = lblYearsSince
      CustomFormat = #39'Years since: '#39' + YearsSince(%s, -1)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption4: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrcDates
      FieldName = 'DateTime'
      Component = lblMonthsSince
      CustomFormat = #39'Months since: '#39' + MonthsSince(%s, -2)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption5: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrcDates
      FieldName = 'DateTime'
      Component = lblMinutesSince
      CustomFormat = #39'Minutes since: '#39' + MinutesSince(%s, -2)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrcDates
      FieldName = 'DateTime'
      Component = lblDaysSince
      CustomFormat = #39'Day since: '#39' + DaysSince(%s, 0)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrcDates
      FieldName = 'DateTime'
      Component = lblSecondsSince
      CustomFormat = #39'Seconds  since: '#39' + SecondsSince(%s, 2)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption6: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrcDates
      FieldName = 'DateTime'
      Component = Label1
      CustomFormat = #39'Random Time: '#39' + FormatDateTime('#39'mmm dd, yyyy hh:nn:ss'#39', %s)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption7: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrcDates
      FieldName = 'DateTime'
      Component = lblHoursSince
      CustomFormat = #39'Hours sincxe: '#39' + HoursSince(%s, -1)'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption8: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSrcDates
      FieldName = 'DateTime'
      Component = Label3
      CustomFormat = 
        #39'Current time: '#39' + FormatDateTime('#39'mmm dd, yyyy hh:nn:ss'#39', Now()' +
        ')'
      ComponentProperty = 'Caption'
    end
    object LinkControlToPropertyCaption: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = edtLengthTest
      Track = True
      Component = Label4
      ComponentProperty = 'Caption'
      CustomFormat = #39'Length: '#39' + StrLen(%s)'
      InitializeControlValue = False
    end
    object LinkControlToPropertyShowAccelChar: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = CheckBox1
      Track = True
      Component = Label5
      ComponentProperty = 'ShowAccelChar'
    end
    object LinkControlToPropertyCaption2: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = edtLengthTest
      Track = True
      Component = Label6
      ComponentProperty = 'Caption'
      CustomFormat = 'DoubleAmp(%s)'
      InitializeControlValue = False
    end
    object LinkControlToPropertyShowAccelChar2: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = CheckBox1
      Track = True
      Component = Label6
      ComponentProperty = 'ShowAccelChar'
      InitializeControlValue = False
    end
    object LinkControlToPropertyCaption3: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = edtJSONStr
      Track = True
      Component = Label9
      ComponentProperty = 'Caption'
      CustomFormat = #39'JsonValue of Id: '#39' + JsonValue(%s, '#39'Id'#39')'
      InitializeControlValue = False
    end
    object LinkControlToPropertyCaption4: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = edtJSONStr
      Track = True
      Component = Label8
      ComponentProperty = 'Caption'
      CustomFormat = #39'JsonValue of Name: '#39' + JsonValue(%s, '#39'Name'#39')'
      InitializeControlValue = False
    end
    object LinkControlToPropertyCaption5: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = edtJsonArray
      Track = True
      Component = Label11
      ComponentProperty = 'Caption'
      CustomFormat = 'JsonArrayValToCSV(%s, '#39'Name'#39')'
      InitializeControlValue = False
    end
    object LinkControlToPropertyCaption6: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = edtLengthTest
      Track = True
      Component = Label12
      ComponentProperty = 'Caption'
      CustomFormat = 'IfThen(StrLen(%s) = 0, '#39'<blank string>'#39', '#39#39')'
      InitializeControlValue = False
    end
    object LinkControlToPropertyCaption7: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = edtLengthTest
      Track = True
      Component = lblNetBIOSFriendly
      ComponentProperty = 'Caption'
      CustomFormat = 'NetBIOSName(%s)'
      InitializeControlValue = False
    end
  end
end
