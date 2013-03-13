unit LocationBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  CustomBO
  ,PressAttributes
  ,PressSubject;

type

  { TLocation }

  TLocation = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
  private
    function GetCode: string;
    function GetName: string;
    function GetRemarks: string;
    procedure SetCode(const AValue: string);
    procedure SetName(const AValue: string);
    procedure SetRemarks(const AValue: string);
  protected
    class function InternalMetadataStr: string; override;
  published
    property Code: string read GetCode write SetCode;
    property Name: string read GetName write SetName;
    property Remarks: string read GetRemarks write SetRemarks;
  end;

  { TLocationQuery }

  TLocationQuery = class(TCustomQuery)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TLocationQuery }

class function TLocationQuery.InternalMetadataStr: string;
begin
  Result := 'TLocationQuery(TLocation) (' +
    'Name: AnsiString(40) MatchType=mtContains;' +
    ')';
end;

{ TLocation }

function TLocation.GetCode: string;
begin
  Result := _Code.Value;
end;

function TLocation.GetName: string;
begin
  Result := _Name.Value;
end;

function TLocation.GetRemarks: string;
begin
  Result := _Remarks.Value;
end;

procedure TLocation.SetCode(const AValue: string);
begin
  _Code.Value := AValue;
end;

procedure TLocation.SetName(const AValue: string);
begin
  _Name.Value := AValue;
end;

procedure TLocation.SetRemarks(const AValue: string);
begin
  _Remarks.Value := AValue;
end;

class function TLocation.InternalMetadataStr: string;
begin
  Result := 'TLocation IsPersistent (' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40);' +
    'Remarks: Memo;' +
    ')';
end;


initialization
  TLocation.RegisterClass;
  TLocationQuery.RegisterClass;

finalization
  TLocation.UnregisterClass;
  TLocationQuery.UnregisterClass;

end.

