unit SugarAPI;

interface
uses
  SysUtils, Variants, Classes, Forms;

type
  TStringArray = array of string;

  TSugarServer = class
  private
    FSessionKey: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;

    function Login(AUserID, APasswd: string): boolean;
    function GetUserID: int64;
    function GetAvaliableModules: TStringArray;
    function GetModuleFields(AModuleName: string; AFields: TStringArray): TStringArray;
    function GetEntriesCount(AModuleName, AQuery: string; ADeleted: boolean): TStringArray;

  end;

implementation

{ TSugarServer }

procedure TSugarServer.Clear;
begin
  FSessionKey := '';
end;

constructor TSugarServer.Create;
begin
  inherited;

  Clear;
end;

destructor TSugarServer.Destroy;
begin
  inherited;

end;

function TSugarServer.GetAvaliableModules: TStringArray;
begin

end;

function TSugarServer.GetEntriesCount(AModuleName, AQuery: string;
  ADeleted: boolean): TStringArray;
begin

end;

function TSugarServer.GetModuleFields(AModuleName: string; AFields: TStringArray): TStringArray;
begin

end;

function TSugarServer.GetUserID: int64;
begin
  Result := 0;

end;

function TSugarServer.Login(AUserID, APasswd: string): boolean;
begin
  Result := false;
end;

end.
