unit SugarAPI;

interface
uses
  SysUtils, Variants, Classes, Forms, IdHTTP, idHash, IdHashMessageDigest, superobject;

type
  TStringArray = array of string;

  TRESTError = record
    Name: string;
    Number: integer;
    Description: string;
    procedure Clear;
  end;

  TSugarServer = class
  private
    FHTTP: TIdHTTP;

    FRESTUrl,
    FSessionKey: string;
    FLastError: TRESTError;

    function intHTTPPost(AMethod, ARESTData: string): string;
    function GotException(data: string): boolean;
  public
    constructor Create; overload;
    constructor Create(ARESTUrl: string); overload;
    destructor Destroy; override;
    procedure Clear;

    function Login(AUserID, APasswd: string): boolean;
    function Logout: boolean;
    function GetUserID: int64;
    function GetAvaliableModules: TStringArray;
    function GetModuleFields(AModuleName: string; AFields: TStringArray): TStringArray;
    function GetEntriesCount(AModuleName, AQuery: string; ADeleted: boolean): TStringArray;

    property RESTUrl: string read FRESTUrl write FRESTUrl;
    property LastError: TRESTError read FLastError;
  end;

implementation

{ TSugarServer }

procedure TSugarServer.Clear;
begin
  FRESTUrl := '';
  FSessionKey := '';
  FLastError.Clear;
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

function TSugarServer.GotException(data: string): boolean;
begin
  Result := false;

  FLastError.Clear;
  FLastError := TSuperRttiContext.Create.AsType(SO(data));
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
  md5 : TIdHashMessageDigest5;
  data: string;
begin
  Result := false;
  md5 := TIdHashMessageDigest5.Create;

  data := intHTTPPost('login',
    '{"user_auth":{"user_name":"' + AUserID + '", ' +
      '"password":"' + md5.HashStringAsHex(APasswd) + 'y", "version":"1.2"}, ' +
    '"application":"delphi REST API"}');

  if GotException(data) then exit;


  md5.Free;
end;

function TSugarServer.Logout: boolean;
begin
  Result := false;

end;

{ TRESTError }

procedure TRESTError.Clear;
begin
  Name := '';
  Number := 0;
  Description := '';
end;

end.
