unit ProductBudgetQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TProductBudgetQueryForm }

  TProductBudgetQueryForm = class(TCustomQueryForm)
    DateIntervalLabel: TLabel;
    DateSeparatorLabel: TLabel;
    MaxDateEdit: TEdit;
    MinDateEdit: TEdit;
  end;

implementation

uses
  PressXCLBroker,
  ProductMVP;

{$R *.lfm}

initialization
  PressXCLForm(TProductBudgetQueryPresenter, TProductBudgetQueryForm);

end.

