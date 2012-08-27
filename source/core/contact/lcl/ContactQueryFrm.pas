unit ContactQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TContactQueryForm }

  TContactQueryForm = class(TCustomQueryForm)
    CodeLabel: TLabel;
    CodeEdit: TEdit;
    NameEdit: TEdit;
    NameLabel: TLabel;
    CodeTabSheet: TTabSheet;
    SearchCodeButton: TBitBtn;
  end;


implementation

uses
  PressXCLBroker,
  ContactMVP;

{$R *.lfm}

initialization
  PressXCLForm(TContactQueryPresenter, TContactQueryForm);

end.

