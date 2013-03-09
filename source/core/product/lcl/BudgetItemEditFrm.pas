unit BudgetItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TBudgetItemEditForm }

  TBudgetItemEditForm = class(TCustomEditForm)
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
  end;

implementation

uses
  PressXCLBroker,
  ProductMVP;

{$R *.lfm}

initialization
  PressXCLForm(TBudgetItemEditPresenter, TBudgetItemEditForm);

end.

