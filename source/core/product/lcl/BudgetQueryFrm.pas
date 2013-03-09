unit BudgetQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TBudgetQueryForm }

  TBudgetQueryForm = class(TCustomQueryForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    DateAndLabel: TLabel;
    DateLabel: TLabel;
    MaxDateEdit: TEdit;
    MinDateEdit: TEdit;
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker,
  ProductMVP;

{$R *.lfm}

initialization
  PressXCLForm(TBudgetQueryPresenter, TBudgetQueryForm);

end.

