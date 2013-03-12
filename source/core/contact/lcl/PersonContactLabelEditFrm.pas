unit PersonContactLabelEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TPersonContactLabelEditForm }

  TPersonContactLabelEditForm = class(TCustomEditForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;


implementation

uses
  PressXCLBroker,
  ContactMVP;

{$R *.lfm}

initialization
  PressXCLForm(TPersonContactLabelEditPresenter, TPersonContactLabelEditForm);

end.

