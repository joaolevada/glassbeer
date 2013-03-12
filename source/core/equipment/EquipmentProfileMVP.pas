unit EquipmentProfileMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP,
  PressMVPCommand,
  PressMVPPresenter;

type

  { TEquipmentProfileEditPresenter }

  TEquipmentProfileEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TEquipmentProfileQueryPresenter }

  TEquipmentProfileQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TWaterCalculatorEditPresenter }

  TWaterCalculatorEditPresenter = class(TPressMVPFormPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TWaterCalculatorApplyCommand }

  TWaterCalculatorApplyCommand = class(TPressMVPObjectCommand)
  protected
    procedure InternalExecute; override;
  end;

  { TWaterCalculatorCancelCommand }

  TWaterCalculatorCancelCommand = class(TPressMVPObjectCommand)
  protected
    procedure InternalExecute; override;
  end;


implementation

uses
  EquipmentProfileBO,
  MashBO;

{ TWaterCalculatorCancelCommand }

procedure TWaterCalculatorCancelCommand.InternalExecute;
begin
  Model.Close;
end;

{ TWaterCalculatorApplyCommand }

procedure TWaterCalculatorApplyCommand.InternalExecute;
var
  VMashItem: TMashItem;
  VWaterCalculator: TWaterCalculator;
begin
  VWaterCalculator := Model.Subject as TWaterCalculator;
  if not Assigned(VWaterCalculator) then
    Exit;
  VMashItem := VWaterCalculator._MashItem.Value as TMashItem;
  if not Assigned(VMashItem) then
    Exit;
  VMashItem.StartWater := VWaterCalculator.StartWater;
  VMashItem.SpargeWater := VWaterCalculator.SpargeWater;
  Model.Close;
end;

{ TWaterCalculatorEditPresenter }

procedure TWaterCalculatorEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  BindCommand(TWaterCalculatorApplyCommand, 'ApplyButton');
  BindCommand(TWaterCalculatorCancelCommand, 'CancelButton');
  CreateSubPresenter('GrainAmount', 'GrainAmountEdit');
  CreateSubPresenter('MashWaterRate', 'MashWaterRateEdit');
  CreateSubPresenter('Profile', 'ProfileComboBox', 'Name');
  CreateSubPresenter('MashItem.Recipe.Name', 'MashItemRecipeLabel');
  CreateSubPresenter('StartWater', 'StartWaterEdit');
  CreateSubPresenter('SpargeWater', 'SpargeWaterEdit');
  CreateSubPresenter('TotalWater', 'TotalWaterEdit');
  CreateSubPresenter('EvaporationLoss', 'EvaporationLossEdit');
  CreateSubPresenter('GrainLoss', 'GrainLossEdit');
  CreateSubPresenter('TotalLoss', 'TotalLossEdit');
  CreateSubPresenter('MashItem.VolumePretty', 'MashItemVolumeLabel');
end;

{ TEquipmentProfileQueryPresenter }

procedure TEquipmentProfileQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  //CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
end;

function TEquipmentProfileQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Code(198, "Código");' +
    'Name(356, "Nome");' +
    'GrainAbsorption(99, "Absor. água");' +
    'EvaporationRate(99, "Tx. evap. [minuto]");' +
    'KettleToFermenterLoss(99, "Perda ferv. p/ ferm.")';
end;

{ TEquipmentProfileEditPresenter }

procedure TEquipmentProfileEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  CreateSubPresenter('GrainAbsorption', 'GrainAbsorptionEdit');
  CreateSubPresenter('EvaporationRate', 'EvaporationRateEdit');
  CreateSubPresenter('KettleToFermenterLoss', 'KettleToFermenterLossEdit');
end;

initialization
  TEquipmentProfileEditPresenter.RegisterBO(TEquipmentProfile);
  TEquipmentProfileQueryPresenter.RegisterBO(TEquipmentProfileQuery);
  TWaterCalculatorEditPresenter.RegisterBO(TWaterCalculator);

end.

