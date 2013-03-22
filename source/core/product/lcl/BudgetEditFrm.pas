unit BudgetEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TBudgetEditForm }

  TBudgetEditForm = class(TCustomEditForm)
    AddProductSpeedButton: TSpeedButton;
    AddSupplierCompanySpeedButton: TSpeedButton;
    AddSupplierPersonSpeedButton: TSpeedButton;
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    DateEdit: TEdit;
    DateLabel: TLabel;
    EditProductSpeedButton: TSpeedButton;
    EditSupplierSpeedButton: TSpeedButton;
    ExpireDateEdit: TEdit;
    ExpireDateLabel: TLabel;
    ShippingByKilogramEdit: TEdit;
    ShippingByKilogramEdit1: TEdit;
    ShippingByKilogramLabel: TLabel;
    ShippingByKilogramLabel1: TLabel;
    WeightInKilogramsEdit: TEdit;
    WeightInKilogramsEdit1: TEdit;
    WeightInKilogramsLabel: TLabel;
    WeightInKilogramsLabel1: TLabel;
    ItemCountEdit: TEdit;
    ItemCountEdit1: TEdit;
    ItemCountLabel: TLabel;
    ItemCountLabel1: TLabel;
    ItemsLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    ItemsStringGrid: TStringGrid;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    RemoveProductSpeedButton: TSpeedButton;
    ShippingEdit: TEdit;
    ShippingEdit1: TEdit;
    ShippingLabel: TLabel;
    ShippingLabel1: TLabel;
    SumOfItemsEdit: TEdit;
    SumOfItemsEdit1: TEdit;
    SumOfItemsLabel: TLabel;
    SumOfItemsLabel1: TLabel;
    SupplierComboBox: TComboBox;
    SupplierLabel: TLabel;
    ItemsTabSheet: TTabSheet;
    SupplierLabel1: TLabel;
    SupplierNameLabel: TLabel;
    TotalBudgetEdit: TEdit;
    TotalBudgetEdit1: TEdit;
    TotalBudgetLabel: TLabel;
    TotalBudgetLabel1: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  ProductMVP,
  MainFrm;

{ TBudgetEditForm }

constructor TBudgetEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_USER, AddSupplierPersonSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_FACTORY, AddSupplierCompanySpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditSupplierSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddProductSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditProductSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveProductSpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TBudgetEditPresenter, TBudgetEditForm);

end.

