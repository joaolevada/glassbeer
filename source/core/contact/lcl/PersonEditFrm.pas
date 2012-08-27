unit PersonEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, ContactEditFrm;

type

  { TPersonEditForm }

  TPersonEditForm = class(TContactEditForm)
    CPFLabel: TLabel;
    CPFEdit: TEdit;
    RGEdit: TEdit;
    RGLabel: TLabel;
    SpouseComboBox: TComboBox;
    SpouseLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker,
  ContactMVP;

{$R *.lfm}

initialization
  PressXCLForm(TPersonEditPresenter, TPersonEditForm);

end.

