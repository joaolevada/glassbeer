unit MashIngredientItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TMashIngredientItemEditForm }

  TMashIngredientItemEditForm = class(TCustomEditForm)
    AddRawMaterialSpeedButton: TSpeedButton;
    EditRawMaterialSpeedButton: TSpeedButton;
    UnityEdit: TEdit;
    UnityLabel: TLabel;
    QuantityLabel: TLabel;
    QuantityEdit: TEdit;
    RawMaterialCombo: TComboBox;
    RawMaterialLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  MashMVP,
  MainFrm;

{ TMashIngredientItemEditForm }

constructor TMashIngredientItemEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddRawMaterialSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditRawMaterialSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TMashIngredientItemEditPresenter, TMashIngredientItemEditForm);

end.

