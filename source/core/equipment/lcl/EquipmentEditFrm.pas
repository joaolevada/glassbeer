unit EquipmentEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TEquipmentEditForm }

  TEquipmentEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    CostEdit: TEdit;
    CostLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    PurchaseDateLabel: TLabel;
    PurchaseDateEdit: TEdit;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
  end;

implementation

uses
  PressXCLBroker,
  EquipmentMVP;

{$R *.lfm}

initialization
  PressXCLForm(TEquipmentEditPresenter, TEquipmentEditForm);

end.

