unit EquipmentQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TEquipmentQueryForm }

  TEquipmentQueryForm = class(TCustomQueryForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker,
  EquipmentMVP;

{$R *.lfm}

initialization
  PressXCLForm(TEquipmentQueryPresenter, TEquipmentQueryForm);

end.

