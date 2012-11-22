unit EquipmentProfileBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  BasicUserRecordDataBO,
  MashBO;

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
    _TotalLoss: TPressDouble;
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
    'TotalLoss: Double Calc(TotalWater);'
    ')';
end;

procedure TWaterCalculator.InternalCalcAttribute(AAttribute: TPressAttribute);
var
  VMashItem: TMashItem;
  VProfile: TEquipmentProfile;
  VDifVolumeStartWater: Double;
begin
  VMashItem := _MashItem.Value as TMashItem;
  VProfile := _Profile.Value as TEquipmentProfile;
  if AAttribute = _StartWater then
  begin
    //if Assigned(VMashItem) then
      _StartWater.Value := GrainAmount * MashWaterRate;
  end
  else if AAttribute = _SpargeWater then
  begin
    if Assigned(VMashItem) then
    begin
      VDifVolumeStartWater := VMashItem.Volume - GrainLoss;
      _SpargeWater.Value := VDifVolumeStartWater +
        VProfile.KettleToFermenterLoss + GrainLoss + EvaporationLoss;
      VMashItem.Volume := ;
    end;
  end
  else if AAttribute = _EvaporationLoss then
  begin
    if Assigned(VProfile) and Assigned(VMashItem) then
      _EvaporationLoss.Value := VMashItem.BoilTime * VProfile.EvaporationRate
    else
      _EvaporationLoss.Value := 0;
  end
  else if AAttribute = _GrainLoss then
  begin
    if Assigned(VProfile) then
      _GrainLoss.Value := _GrainAmount.Value * VProfile.GrainAbsorption
    else
      _GrainLoss.Value := 0;
  end
  else if AAtribute := _TotalLoss then
  begin
    if Assigned(VProfile) then
      _TotalLoss.Value := _GrainLoss.Value + _EvaporationLoss.Value +
        VProfile._KettleToFermenterLoss.Value
    else
      _TotalLoss := 0;
  end;
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

