program LiveBindingsBeyondExample;

uses
  Vcl.Forms,
  ufrmLiveBindingsBeyondTestMain in 'ufrmLiveBindingsBeyondTestMain.pas' {frmLiveBindingsBeyondTestMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLiveBindingsBeyondTestMain, frmLiveBindingsBeyondTestMain);
  Application.Run;
end.
