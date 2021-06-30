unit ufrmLiveBindingsBeyondTestMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzDBEdit,
  RzTabs, Vcl.ComCtrls, RzDTP, Data.Bind.GenData, Data.Bind.EngExt,
  Beyond.Bind.DateUtils, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.ObjectScope, Beyond.Bind.Json, Beyond.Bind.StrUtils,
  Data.Bind.Controls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Bind.Navigator;

type
  TfrmLiveBindingsBeyondTestMain = class(TForm)
    pgLBCategories: TRzPageControl;
    shtDateTime: TRzTabSheet;
    Label1: TLabel;
    lblYearsSince: TLabel;
    lblMonthsSince: TLabel;
    lblDaysSince: TLabel;
    lblMinutesSince: TLabel;
    lblSecondsSince: TLabel;
    PrototypeBindSrcDates: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption4: TLinkPropertyToField;
    LinkPropertyToFieldCaption5: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption6: TLinkPropertyToField;
    lblHoursSince: TLabel;
    LinkPropertyToFieldCaption7: TLinkPropertyToField;
    BindNavigator1: TBindNavigator;
    Label2: TLabel;
    shtStrUtils: TRzTabSheet;
    Label3: TLabel;
    LinkPropertyToFieldCaption8: TLinkPropertyToField;
    shtJSON: TRzTabSheet;
    edtLengthTest: TLabeledEdit;
    Label4: TLabel;
    LinkControlToPropertyCaption: TLinkControlToProperty;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    LinkControlToPropertyShowAccelChar: TLinkControlToProperty;
    Label6: TLabel;
    LinkControlToPropertyCaption2: TLinkControlToProperty;
    LinkControlToPropertyShowAccelChar2: TLinkControlToProperty;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtJSONStr: TLabeledEdit;
    LinkControlToPropertyCaption3: TLinkControlToProperty;
    LinkControlToPropertyCaption4: TLinkControlToProperty;
    Label10: TLabel;
    Label11: TLabel;
    edtJsonArray: TEdit;
    LinkControlToPropertyCaption5: TLinkControlToProperty;
    Label12: TLabel;
    LinkControlToPropertyCaption6: TLinkControlToProperty;
    Label13: TLabel;
    lblNetBIOSFriendly: TLabel;
    LinkControlToPropertyCaption7: TLinkControlToProperty;
    procedure LabeledEditChange(Sender: TObject);
    procedure EditChange(Sender: TObject);
  end;

var
  frmLiveBindingsBeyondTestMain: TfrmLiveBindingsBeyondTestMain;

implementation

{$R *.dfm}

procedure TfrmLiveBindingsBeyondTestMain.LabeledEditChange(Sender: TObject);
begin
  TLinkObservers.ControlChanged(Sender as TLabeledEdit);
end;

procedure TfrmLiveBindingsBeyondTestMain.EditChange(Sender: TObject);
begin
  TLinkObservers.ControlChanged(Sender as TEdit);
end;

end.
