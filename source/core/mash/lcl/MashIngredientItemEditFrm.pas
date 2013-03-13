unit MashIngredientItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TMashIngredientItemEditForm }

  TMashIngredientItemEditForm = class(TCustomEditForm)
    AddProductSpeedButton: TSpeedButton;
    EditProductSpeedButton: TSpeedButton;
    UnityEdit: TEdit;
    UnityLabel: TLabel;
    QuantityLabel: TLabel;
    QuantityEdit: TEdit;
    ProductComboBox: TComboBox;
    ProductLabel: TLabel;
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
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddProductSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditProductSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TMashIngredientItemEditPresenter, TMashIngredientItemEditForm);

end.

