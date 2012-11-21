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

  { TWaterCalculator }

  TWaterCalculator = class(TCustomObject)
    _GrainAmount: TPressDouble;
    _MashWaterRate: TPressDouble;
    _Profile: TPressReference;
    _MashItem: TPressReference;
    _StartWater: TPressDouble;
    _SpargeWater: TPressDouble;
    _TotalWater: TPressDouble;
    _EvaporationLoss: TPressDouble;
    _GrainLoss: TPressDouble;
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  end;

implementation

{ TWaterCalculator }

class function TWaterCalculator.InternalMetadataStr: string;
begin
  Result := 'TWaterCalculator (' +
    'GrainAmount: Double;' +
    'MashWaterRate: Double;' +
    'Profile: Reference(TEquipmentProfile);' +
    'MashItem: Reference(TMashItem);' +
    'StartWater: Double Calc(GrainAmount, MashWaterRate, MashItem);' +
    'SpargeWater: Double Calc(StartWater);' +
    'TotalWater: Double Calc(StartWater, SpargeWater);' +
    'EvaporationLoss: Double Calc(Profile);' +
    'GrainLoss: Double Calc(GrainAmount);' +
    ')';
end;

procedure TWaterCalculator.InternalCalcAttribute(AAttribute: TPressAttribute);
begin
  { TODO -ojoaolevada : Implement TWaterCalculator.InternalCalcAttribute }
end;

{ TEquipmentProfileQuery }

class function TEquipmentProfileQuery.InternalMetadataStr: string;
begin
  Result := 'TEquipmentProfileQuery(TEquipmentProfile) (' +
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
  TWaterCalculator.RegisterClass;

finalization
  TEquipmentProfile.UnregisterClass;
  TEquipmentProfileQuery.UnregisterClass;
  TWaterCalculator.UnregisterClass;


end.

