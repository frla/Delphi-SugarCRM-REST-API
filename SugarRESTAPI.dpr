program SugarRESTAPI;

uses
  Forms,
  uMain in 'uMain.pas' {fMain},
  SugarAPI in 'SugarAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
