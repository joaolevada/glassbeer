unit PhoneLabelEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TPhoneLabelEditForm }

  TPhoneLabelEditForm = class(TCustomEditForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end; 


implementation

uses
  PressXCLBroker,
  AddressMVP;

{$R *.lfm}

initialization
  PressXCLForm(TPhoneLabelEditPresenter, TPhoneLabelEditForm);

end.

