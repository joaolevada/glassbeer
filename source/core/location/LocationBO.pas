unit LocationBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  CustomBO
  ,BasicUserRecordDataBO
  ,PressAttributes
  ,PressSubject;

type

  { TLocation }

  TLocation = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordData;
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

  { TLocationReference }

  TLocationReference = class(TCustomReference)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

implementation

{ TLocationReference }

class function TLocationReference.ValidObjectClass: TPressObjectClass;
begin
  Result := TLocation;
end;

{ TLocationQuery }

class function TLocationQuery.InternalMetadataStr: string;
begin
  Result := 'TLocationQuery(TLocation) (' +
    'Name: AnsiString(40) MatchType=mtContains DataName="BasicUserRecordData.Name";' +
    ')';
end;

{ TLocation }

function TLocation.GetCode: string;
begin
  Result := _BasicUserRecordData.Code;
end;

function TLocation.GetName: string;
begin
  Result := _BasicUserRecordData.Name;
end;

function TLocation.GetRemarks: string;
begin
  Result := _BasicUserRecordData.Remarks;
end;

procedure TLocation.SetCode(const AValue: string);
begin
  _BasicUserRecordData.Code := AValue;
end;

procedure TLocation.SetName(const AValue: string);
begin
  _BasicUserRecordData.Name := AValue;
end;

procedure TLocation.SetRemarks(const AValue: string);
begin
  _BasicUserRecordData.Remarks := AValue;
end;

class function TLocation.InternalMetadataStr: string;
begin
  Result := 'TLocation IsPersistent (' +
    'BasicUserRecordData: TBasicUserRecordDataPart ShortName="BasicURD";' +
    ')';
end;


initialization
  TLocation.RegisterClass;
  TLocationQuery.RegisterClass;
  TLocationReference.RegisterAttribute;

finalization
  TLocation.UnregisterClass;
  TLocationQuery.UnregisterClass;
  TLocationReference.UnregisterAttribute;

end.

