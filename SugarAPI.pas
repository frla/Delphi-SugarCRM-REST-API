unit SugarAPI;

interface
uses
  SysUtils, Variants, Classes, Forms, IdHTTP;

type
  TStringArray = array of string;

  TSugarServer = class
  private
    FHTTP: TIdHTTP;

    FRESTUrl,
    FSessionKey: string;

    function intHTTPPost(AMethod, ARESTData: string): string;
  public
    constructor Create; overload;
    constructor Create(ARESTUrl: string); overload;
    destructor Destroy; override;
    procedure Clear;

    function Login(AUserID, APasswd: string): boolean;
    function GetUserID: int64;
    function GetAvaliableModules: TStringArray;
    function GetModuleFields(AModuleName: string; AFields: TStringArray): TStringArray;
    function GetEntriesCount(AModuleName, AQuery: string; ADeleted: boolean): TStringArray;

    property RESTUrl: string read FRESTUrl write FRESTUrl;
  end;

implementation

{ TSugarServer }

procedure TSugarServer.Clear;
begin
  FRESTUrl := '';
  FSessionKey := '';
end;

constructor TSugarServer.Create;
begin
  inherited;
  FHTTP := TIdHTTP.Create;
  Clear;
end;

constructor TSugarServer.Create(ARESTUrl: string);
begin
  Create;
  RESTUrl := ARESTUrl;
end;

destructor TSugarServer.Destroy;
begin
  inherited;
  FHTTP.Free;
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

function TSugarServer.intHTTPPost(AMethod, ARESTData: string): string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  sl.Add('method=' + AMethod);
  sl.Add('input_type=JSON');
  sl.Add('response_type=JSON');
  sl.Add('rest_data=' + ARESTData);
  Result :=  FHTTP.Post(FRESTUrl, sl);
  sl.Free;
end;

function TSugarServer.Login(AUserID, APasswd: string): boolean;
var
  data: string;
begin
  Result := false;

  data := intHTTPPost('login',
    '{"user_auth":{"user_name":"admin", "password":"21232f297a57a5a743894a0e4a801fc3", "version":"1.2"}, "application":"delphi REST API"}');
end;

end.
