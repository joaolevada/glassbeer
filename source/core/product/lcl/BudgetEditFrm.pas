unit BudgetEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TBudgetEditForm }

  TBudgetEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    DateEdit: TEdit;
    DateLabel: TLabel;
    ExpireDateEdit: TEdit;
    ExpireDateLabel: TLabel;
    ItemQuantityEdit: TEdit;
    ItemQuantityEdit1: TEdit;
    ItemAmountLabel: TLabel;
    ItemAmountLabel1: TLabel;
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
    ShippingEdit: TEdit;
    ShippingEdit1: TEdit;
    ShippingLabel: TLabel;
    ShippingLabel1: TLabel;
    SumOfItemsEdit: TEdit;
    SumOfItemsEdit1: TEdit;
    SumOfItemsLabel: TLabel;
    SumOfItemsLabel1: TLabel;
    SupplierComboBox: TComboBox;
    SupplierComboBox1: TComboBox;
    SupplierLabel: TLabel;
    ItemsTabSheet: TTabSheet;
    SupplierLabel1: TLabel;
    TotalBudgetEdit: TEdit;
    TotalBudgetEdit1: TEdit;
    TotalBudgetLabel: TLabel;
    TotalBudgetLabel1: TLabel;
  end;

implementation

uses
  PressXCLBroker,
  ProductMVP;

{$R *.lfm}

initialization
  PressXCLForm(TBudgetEditPresenter, TBudgetEditForm);

end.

