unit EquipmentProfileEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TEquipmentProfileEditForm }

  TEquipmentProfileEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    EvaporationRateEdit: TEdit;
    EvaporationRateLabel: TLabel;
    GrainAbsorptionEdit: TEdit;
    GrainAbsorptionLabel: TLabel;
    KettleToFermenterLossEdit: TEdit;
    KettleToFermenterLossLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
  end;

implementation

uses
  PressXCLBroker,
  EquipmentProfileMVP;

initialization
  PressXCLForm(TEquipmentProfileEditPresenter, TEquipmentProfileForm);

{$R *.lfm}

end.

