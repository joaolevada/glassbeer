unit LocationQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TLocationQueryForm }

  TLocationQueryForm = class(TCustomQueryForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;


implementation

uses
  PressXCLBroker
  ,LocationMVP;

{$R *.lfm}

initialization
  PressXCLForm(TLocationQueryPresenter, TLocationQueryForm);

end.

