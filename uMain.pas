unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  SugarAPI, StdCtrls;

type
  TfMain = class(TForm)
    Label1: TLabel;
    edRESTUrl: TEdit;
    Label2: TLabel;
    edUserName: TEdit;
    Label3: TLabel;
    edPasswd: TEdit;
    btInit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btInitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Server: TSugarServer;
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.btInitClick(Sender: TObject);
begin
  if Server <> Nil then
  try
    Server.Free;
  except
  end;

  Server := TSugarServer.Create(edRESTUrl.Text);
  if not Server.Login(edUserName.Text, edPasswd.Text) then
    begin

      exit;
    end;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  Server := Nil;
end;

end.
