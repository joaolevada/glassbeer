unit WaterCalculatorEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TWaterCalculatorEditForm }

  TWaterCalculatorEditForm = class(TCustomEditForm)
    GrainAmountEdit: TEdit;
    MashItemLabel: TLabel;
    MashItemRecipeLabel: TLabel;
    MashWaterRateEdit: TEdit;
    GrainAmountLabel: TLabel;
    MashWaterRateLabel: TLabel;
    ProfileLabel: TLabel;
    ProfileComboBox: TComboBox;
    SpargeWaterEdit: TEdit;
    SpargeWaterLabel: TLabel;
    StartWaterEdit: TEdit;
    StartWaterLabel: TLabel;
    TotalWaterEdit: TEdit;
    EvaporationLossEdit: TEdit;
    GrainLossEdit: TEdit;
    TotalLossEdit: TEdit;
    TotalWaterLabel: TLabel;
    EvaporationLossLabel: TLabel;
    GrainLossLabel: TLabel;
    TotalLossLabel: TLabel;
  end;

implementation

uses
  TEquipmentProfileMVP,
  PressXCLBroker;

{$R *.lfm}

initialization
  PressXCLForm(TWaterCalculatorEditPresenter, TWaterCalculatorEditForm);

end.

