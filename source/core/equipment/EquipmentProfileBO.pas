unit EquipmentProfileBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  BasicUserRecordDataBO;

type

  { TEquipmentProfile }

  TEquipmentProfile = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _GrainAbsorption: TPressDouble;
    _EvaporationRate: TPressDouble;
    _KettleToFermenterLoss: TPressDouble;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TEquipmentProfileQuery }

  TEquipmentProfileQuery = class(TCustomQuery)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TEquipmentProfileQuery }

class function TEquipmentProfileQuery.InternalMetadataStr: string;
begin
  Result := 'TEquipmentProfileQuery(TEquipmentProfile) (' +;
    'Code: PlainString(20) MatchType=mtContains DataName="BasicUserRecordData.Code";' +
    'Name: AnsiString(40) MatchType=mtContains DataName="BasicUserRecordData.Name";' +
    ')';
end;

{ TEquipmentProfile }

class function TEquipmentProfile.InternalMetadataStr: string;
begin
  Result := 'TEquipmentProfile IsPersistent (' +
    'BasicUserRecordData: TBasicUserRecordDataPart;' +
    'GrainAbsorption: Double;' +
    'EvaporationRate: Double;' +
    'KettleToFermenterLoss: Double;' +
    ')';
end;

initialization
  TEquipmentProfile.RegisterClass;
  TEquipmentProfileQuery.RegisterClass;

finalization
  TEquipmentProfile.UnregisterClass;
  TEquipmentProfileQuery.UnregisterClass;

end.

