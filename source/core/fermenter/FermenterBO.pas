unit FermenterBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes
  ,SysUtils
  ,PressAttributes
  ,PressSubject
  ,CustomBO
  ,BasicUserRecordDataBO
  ,LocationBO;

type

  TFermenterStatus = (fsAvailable, fsInUse);

  { TFermenter }

  TFermenter = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordData;
    _FullCapacity: TPressDouble;
    _HeadSpace: TPressDouble;
    _UtilCapacity: TPressDouble;
    _Location: TLocationReference;
    _CurrentVolume: TPressDouble;
    _Status: TPressEnum;
  private
    function GetCode: string;
    function GetCurrentVolume: Double;
    function GetFullCapacity: Double;
    function GetHeadSpace: Double;
    function GetName: string;
    function GetRemarks: string;
    function GetStatus: TFermenterStatus;
    function GetUtilCapacity: Double;
    procedure SetCode(const AValue: string);
    procedure SetCurrentVolume(const AValue: Double);
    procedure SetFullCapacity(const AValue: Double);
    procedure SetHeadSpace(const AValue: Double);
    procedure SetName(const AValue: string);
    procedure SetRemarks(const AValue: string);
    procedure SetStatus(const AValue: TFermenterStatus);
    procedure SetUtilCapacity(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  published
    property Code: string read GetCode write SetCode;
    property Name: string read GetName write SetName;
    property Remarks: string read GetRemarks write SetRemarks;
    property FullCapacity: Double read GetFullCapacity write SetFullCapacity;
    property HeadSpace: Double read GetHeadSpace write SetHeadSpace;
    property UtilCapacity: Double read GetUtilCapacity write SetUtilCapacity;
    property CurrentVolume: Double read GetCurrentVolume write SetCurrentVolume;
    property Status: TFermenterStatus read GetStatus write SetStatus;
  end;

  { TFermenterQuery }

  TFermenterQuery = class(TCustomQuery)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;


implementation

{ TFermenterQuery }

class function TFermenterQuery.InternalMetadataStr: string;
begin
  Result := 'TFermenterQuery(TFermenter) (' +
    'Name: AnsiString(40) MatchType=mtContains DataName="BasicUserRecordData.Name";' +
    ')';
end;

{ TFermenter }

function TFermenter.GetCode: string;
begin
  Result := _BasicUserRecordData.Code;
end;

function TFermenter.GetCurrentVolume: Double;
begin
  Result := _CurrentVolume.Value;
end;

function TFermenter.GetFullCapacity: Double;
begin
  Result := _FullCapacity.Value;
end;

function TFermenter.GetHeadSpace: Double;
begin
  Result := _HeadSpace.Value;
end;

function TFermenter.GetName: string;
begin
  Result := _BasicUserRecordData.Name;
end;

function TFermenter.GetRemarks: string;
begin
  Result := _BasicUserRecordData.Remarks;
end;

function TFermenter.GetStatus: TFermenterStatus;
begin
  Result := TFermenterStatus(_Status.Value);
end;

function TFermenter.GetUtilCapacity: Double;
begin
  Result := _UtilCapacity.Value
end;

procedure TFermenter.SetCode(const AValue: string);
begin
  _BasicUserRecordData.Code := AValue;
end;

procedure TFermenter.SetCurrentVolume(const AValue: Double);
begin
  _CurrentVolume.Value := AValue;
end;

procedure TFermenter.SetFullCapacity(const AValue: Double);
begin
  _FullCapacity.Value := AValue;
end;

procedure TFermenter.SetHeadSpace(const AValue: Double);
begin
  _HeadSpace.Value := AValue;
end;

procedure TFermenter.SetName(const AValue: string);
begin
  _BasicUserRecordData.Name := AValue;
end;

procedure TFermenter.SetRemarks(const AValue: string);
begin
  _BasicUserRecordData.Remarks := AValue;
end;

procedure TFermenter.SetStatus(const AValue: TFermenterStatus);
begin
  _Status.Value := LongInt(AValue);
end;

procedure TFermenter.SetUtilCapacity(const AValue: Double);
begin
  _UtilCapacity.Value := AValue;
end;

class function TFermenter.InternalMetadataStr: string;
begin
  Result := 'TFermenter IsPersistent ( ' +
    'BasicUserRecordData: TBasicUserRecordDataPart ShortName="BasicURD";' +
    'FullCapacity: Double DisplayName="Capacidade total";' +
    'HeadSpace: Double DisplayName="Head space (%)";' +
    'UtilCapacity: Double Calc(FullCapacity, HeadSpace) DisplayName="Capacidade útil";' +
    'Location: TLocationReference DisplayName="Localização";' +
    'CurrentVolume: Double DisplayName="Volume atual";' +
    'Status: Enum(TFermenterStatus) DisplayName="Status";' +
    ')';
end;

procedure TFermenter.InternalCalcAttribute(AAttribute: TPressAttribute);
begin
  if AAttribute = _UtilCapacity then
    UtilCapacity := FullCapacity - (FullCapacity * HeadSpace / 100);
end;

initialization
  TFermenter.RegisterClass;
  TFermenterQuery.RegisterClass;
  PressModel.RegisterEnumMetadata(TypeInfo(TFermenterStatus),
    'TFermenterStatus',
    ['Disponível', 'Em uso']);

finalization
  TFermenter.UnregisterClass;
  TFermenterQuery.UnregisterClass;

end.

