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
    AddFermenterEventSpeedButton: TSpeedButton;
    EditFermenterEventSpeedButton: TSpeedButton;
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
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  FermenterMVP,
  MainFrm;

{ TFermenterEventItemEditForm }

constructor TFermenterEventItemEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddFermenterEventSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditFermenterEventSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TFermenterEventItemEditPresenter, TFermenterEventItemEditForm);

end.

