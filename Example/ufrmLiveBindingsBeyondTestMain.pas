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
    PrototypeBindSrc: TPrototypeBindSource;
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
  end;

var
  frmLiveBindingsBeyondTestMain: TfrmLiveBindingsBeyondTestMain;

implementation

{$R *.dfm}

end.
