unit BudgetItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TBudgetItemEditForm }

  TBudgetItemEditForm = class(TCustomEditForm)
    AddProductSpeedButton: TSpeedButton;
    AddUnitySpeedButton: TSpeedButton;
    EditProductSpeedButton: TSpeedButton;
    EditUnitySpeedButton: TSpeedButton;
    ProductComboBox: TComboBox;
    ProductLabel: TLabel;
    QuantityEdit: TEdit;
    QuantityLabel: TLabel;
    TotalValueEdit: TEdit;
    TotalValueLabel: TLabel;
    UnityComboBox: TComboBox;
    UnityLabel: TLabel;
    UnityValue: TLabel;
    UnityValueEdit: TEdit;
    WeightInKilogramsEdit: TEdit;
    WeightInKilogramsLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  ProductMVP,
  MainFrm;

{ TBudgetItemEditForm }

constructor TBudgetItemEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddProductSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditProductSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddUnitySpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditUnitySpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TBudgetItemEditPresenter, TBudgetItemEditForm);

end.

