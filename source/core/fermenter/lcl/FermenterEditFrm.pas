unit FermenterEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TFermenterEditForm }

  TFermenterEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    StatusCombo: TComboBox;
    CurrentVolumeLabel: TLabel;
    CurrentVolumeEdit: TEdit;
    StatusLabel: TLabel;
    LocationCombo: TComboBox;
    LocationLabel: TLabel;
    UtilCapacityEdit: TEdit;
    HeadSpaceEdit: TEdit;
    FullCapacityEdit: TEdit;
    FullCapacityLabel: TLabel;
    HeadSpaceLabel: TLabel;
    UtilCapacityLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker
  ,FermenterMVP;

{$R *.lfm}

initialization
  PressXCLForm(TFermenterEditPresenter, TFermenterEditForm);

end.

