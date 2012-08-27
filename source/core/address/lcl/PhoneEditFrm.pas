unit PhoneEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TPhoneEditForm }

  TPhoneEditForm = class(TCustomEditForm)
    LabelComboBox: TComboBox;
    NumberEdit: TEdit;
    LabelLabel: TLabel;
    NumberLabel: TLabel;
  end;


implementation

uses
  PressXCLBroker,
  AddressMVP;

{$R *.lfm}

initialization
  PressXCLForm(TPhoneEditPresenter, TPhoneEditForm);

end.

