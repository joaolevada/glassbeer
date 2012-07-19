unit FermenterEventItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TFermenterEventItemEditForm }

  TFermenterEventItemEditForm = class(TCustomEditForm)
    GravityEdit: TEdit;
    TemperatureEdit: TEdit;
    CurrentGravityLabel: TLabel;
    TemperatureLabel: TLabel;
    VolumeEdit: TEdit;
    ExpiredEdit: TEdit;
    ExpirationDateEdit: TEdit;
    FermenterEventCombo: TComboBox;
    FermenterEventLabel: TLabel;
    ExpirationDateLabel: TLabel;
    ExpiredLabel: TLabel;
    VolumeLabel: TLabel;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  FermenterMVP;

initialization
  PressXCLForm(TFermenterEventItemEditPresenter, TFermenterEventItemEditForm);

end.

