unit FermenterEventQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TFermenterEventQueryForm }

  TFermenterEventQueryForm = class(TCustomQueryForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  FermenterMVP;

initialization
  PressXCLForm(TFermenterEventQueryPresenter, TFermenterEventQueryForm);

end.

