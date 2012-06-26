unit FementerQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TFermenterQueryForm }

  TFermenterQueryForm = class(TCustomQueryForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker
  ,FermenterMVP;

{$R *.lfm}

initialization
  PressXCLForm(TFermenterQueryPresenter, TFermenterQueryForm);

end.

