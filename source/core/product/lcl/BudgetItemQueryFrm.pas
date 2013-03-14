unit BudgetItemQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids;

type

  { TBudgetItemQueryForm }

  TBudgetItemQueryForm = class(TForm)
    BudgetsStringGrid: TStringGrid;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  ProductMVP,
  CustomQueryFrm;

{ TBudgetItemQueryForm }

constructor TBudgetItemQueryForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Width := QUERYFORM_WIDTH;
  Self.Height:= QUERYFORM_HEIGHT;
end;

{$R *.lfm}

initialization
  PressXCLForm(TBudgetItemQueryPresenter, TBudgetItemQueryForm);

end.

