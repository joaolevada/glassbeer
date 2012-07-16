unit MashQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TMashQueryForm }

  TMashQueryForm = class(TCustomQueryForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;


implementation

{$R *.lfm}

uses
  MashMVP,
  PressXCLBroker;

initialization
  PressXCLForm(TMashQueryPresenter, TMashQueryForm);

end.

