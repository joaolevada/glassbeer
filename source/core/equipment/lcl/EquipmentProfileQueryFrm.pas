unit EquipmentProfileQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TEquipmentProfileQueryForm }

  TEquipmentProfileQueryForm = class(TCustomQueryForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;

implementation

uses
  EquipmentProfileMVP,
  PressXCLBroker;

{$R *.lfm}

initialization
  PressXCLForm(TEquipmentProfileQueryPresenter, TEquipmentProfileQueryForm);

end.

