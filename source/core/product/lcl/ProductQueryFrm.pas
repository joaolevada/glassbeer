unit ProductQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TProductQueryForm }

  TProductQueryForm = class(TCustomQueryForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker,
  ProductMVP;

{$R *.lfm}

initialization
  PressXCLForm(TProductQueryPresenter, TProductQueryForm);

end.

