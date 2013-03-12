unit EquipmentProfileBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  MashBO,
  PressSubject;

type

  { TEquipmentProfile }

  TEquipmentProfile = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
    _GrainAbsorption: TPressDouble;
    _EvaporationRate: TPressDouble;
    _KettleToFermenterLoss: TPressDouble;
  private
    function GetEvaporationRate: Double;
    function GetGrainAbsorption: Double;
    function GetKettleToFermenterLoss: Double;
    procedure SetEvaporationRate(AValue: Double);
    procedure SetGrainAbsorption(AValue: Double);
    procedure SetKettleToFermenterLoss(AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
  published
    property GrainAbsorption: Double read GetGrainAbsorption
      write SetGrainAbsorption;
    property EvaporationRate: Double read GetEvaporationRate
      write SetEvaporationRate;
    property KettleToFermenterLoss: Double read GetKettleToFermenterLoss
      write SetKettleToFermenterLoss;
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
  private
    function GetEvaporationLoss: Double;
    function GetGrainAmount: Double;
    function GetGrainLoss: Double;
    function GetMashWaterRate: Double;
    function GetSpargeWater: Double;
    function GetStartWater: Double;
    function GetTotalLoss: Double;
    function GetTotalWater: Double;
    procedure SetEvaporationLoss(AValue: Double);
    procedure SetGrainAmount(AValue: Double);
    procedure SetGrainLoss(AValue: Double);
    procedure SetMashWaterRate(AValue: Double);
    procedure SetSpargeWater(AValue: Double);
    procedure SetStartWater(AValue: Double);
    procedure SetTotalLoss(AValue: Double);
    procedure SetTotalWater(AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  published
    property GrainAmount: Double read GetGrainAmount
      write SetGrainAmount;
    property MashWaterRate: Double read GetMashWaterRate
      write SetMashWaterRate;
    //property Profile: TRquipmentProfile read GetProfile
    //  write SetProfile;
    //property MashItem: TMashItem read GetMashItem
    //  write SetMashItem;
    property StartWater: Double read GetStartWater
      write SetStartWater;
    property SpargeWater: Double read GetSpargeWater
      write SetSpargeWater;
    property TotalWater: Double read GetTotalWater
      write SetTotalWater;
    property EvaporationLoss: Double read GetEvaporationLoss
      write SetEvaporationLoss;
    property GrainLoss: Double read GetGrainLoss
      write SetGrainLoss;
    property TotalLoss: Double read GetTotalLoss
      write SetTotalLoss;
  end;

implementation

{ TWaterCalculator }

function TWaterCalculator.GetEvaporationLoss: Double;
begin
  Result := _EvaporationLoss.Value;
end;

function TWaterCalculator.GetGrainAmount: Double;
begin
  Result := _GrainAmount.Value;
end;

function TWaterCalculator.GetGrainLoss: Double;
begin
  Result := _GrainLoss.Value;
end;

function TWaterCalculator.GetMashWaterRate: Double;
begin
  Result := _MashWaterRate.Value;
end;

function TWaterCalculator.GetSpargeWater: Double;
begin
  Result := _SpargeWater.Value;
end;

function TWaterCalculator.GetStartWater: Double;
begin
  Result := _StartWater.Value;
end;

function TWaterCalculator.GetTotalLoss: Double;
begin
  Result := _TotalLoss.Value;
end;

function TWaterCalculator.GetTotalWater: Double;
begin
  Result := _TotalWater.Value;
end;

procedure TWaterCalculator.SetEvaporationLoss(AValue: Double);
begin
  _EvaporationLoss.Value := AValue;
end;

procedure TWaterCalculator.SetGrainAmount(AValue: Double);
begin
  _GrainAmount.Value := AValue;
end;

procedure TWaterCalculator.SetGrainLoss(AValue: Double);
begin
  _GrainLoss.Value := AValue;
end;

procedure TWaterCalculator.SetMashWaterRate(AValue: Double);
begin
  _MashWaterRate.Value := AValue;
end;

procedure TWaterCalculator.SetSpargeWater(AValue: Double);
begin
  _SpargeWater.Value := AValue;
end;

procedure TWaterCalculator.SetStartWater(AValue: Double);
begin
  _StartWater.Value := AValue;
end;

procedure TWaterCalculator.SetTotalLoss(AValue: Double);
begin
  _TotalLoss.Value := AValue;
end;

procedure TWaterCalculator.SetTotalWater(AValue: Double);
begin
  _TotalWater.Value := AValue;
end;

class function TWaterCalculator.InternalMetadataStr: string;
begin
  Result := 'TWaterCalculator (' +
    'GrainAmount: Double;' +
    'MashWaterRate: Double;' +
    'Profile: Reference(TEquipmentProfile);' +
    'MashItem: Reference(TMashItem);' +
    'StartWater: Double Calc(GrainAmount, MashWaterRate, MashItem);' +
    'SpargeWater: Double Calc(StartWater, Profile, MashItem, GrainLoss, ' +
    'EvaporationLoss);' +
    'TotalWater: Double Calc(StartWater, SpargeWater);' +
    'EvaporationLoss: Double Calc(Profile, MashItem);' +
    'GrainLoss: Double Calc(GrainAmount, Profile);' +
    'TotalLoss: Double Calc(GrainLoss, EvaporationLoss, Profile);' +
    ')';
end;

procedure TWaterCalculator.InternalCalcAttribute(AAttribute: TPressAttribute);
var
  VMashItem: TMashItem;
  VProfile: TEquipmentProfile;
  VDifVolumeStartWater: Double;
  f, f2, f3: Double;
begin
  VMashItem := Self._MashItem.Value as TMashItem;
  VProfile := Self._Profile.Value as TEquipmentProfile;
  if AAttribute = _StartWater then
  begin
    //if Assigned(VMashItem) then
      StartWater := GrainAmount * MashWaterRate;
  end
  else if AAttribute = _SpargeWater then
  begin
    { TODO 1 -ojoaolevada -cbug : Verify and fix the SpargeWater attribute calculation }
    if Assigned(VMashItem) and Assigned(VProfile) then
    begin
      VDifVolumeStartWater := VMashItem.Volume - StartWater;
      SpargeWater := VDifVolumeStartWater +
        VProfile.KettleToFermenterLoss + GrainLoss + EvaporationLoss;
    end
    else
    begin
      SpargeWater := 0;
    end;
  end
  else if AAttribute = _EvaporationLoss then
  begin
    if Assigned(VProfile) and Assigned(VMashItem) then
    begin
      EvaporationLoss := VMashItem.BoilTime * VProfile.EvaporationRate;
    end
    else
    begin
      EvaporationLoss := 0;
    end;
  end
  else if AAttribute = _GrainLoss then
  begin
    if Assigned(VProfile) then
    begin
      GrainLoss := GrainAmount * VProfile.GrainAbsorption;
      f := GrainAmount;
      f2 := VProfile.GrainAbsorption;
      f3 := GrainLoss;
    end
    else
    begin
      GrainLoss := 0;
    end;
  end
  else if AAttribute = _TotalLoss then
  begin
    if Assigned(VProfile) then
    begin
      TotalLoss := GrainLoss + EvaporationLoss + VProfile.KettleToFermenterLoss
    end
    else
    begin
      TotalLoss := 0;
    end;
  end
  else if AAttribute = _TotalWater then
    TotalWater := StartWater + SpargeWater;
end;

{ TEquipmentProfileQuery }

class function TEquipmentProfileQuery.InternalMetadataStr: string;
begin
  Result := 'TEquipmentProfileQuery(TEquipmentProfile) (' +
    'Code: PlainString(20) MatchType=mtStarting";' +
    'Name: AnsiString(40) MatchType=mtContains";' +
    ')';
end;

{ TEquipmentProfile }

function TEquipmentProfile.GetEvaporationRate: Double;
begin
  Result := _EvaporationRate.Value;
end;

function TEquipmentProfile.GetGrainAbsorption: Double;
begin
  Result := _GrainAbsorption.Value;
end;

function TEquipmentProfile.GetKettleToFermenterLoss: Double;
begin
  Result := _KettleToFermenterLoss.Value;
end;

procedure TEquipmentProfile.SetEvaporationRate(AValue: Double);
begin
  _EvaporationRate.Value := AValue;
end;

procedure TEquipmentProfile.SetGrainAbsorption(AValue: Double);
begin
  _GrainAbsorption.Value := AValue;
end;

procedure TEquipmentProfile.SetKettleToFermenterLoss(AValue: Double);
begin
  _KettleToFermenterLoss.Value := AValue;
end;

class function TEquipmentProfile.InternalMetadataStr: string;
begin
  Result := 'TEquipmentProfile IsPersistent (' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40);' +
    'Remarks: Memo;' +
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

