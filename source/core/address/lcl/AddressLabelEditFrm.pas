unit AddressLabelEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TAddressLabelEditForm }

  TAddressLabelEditForm = class(TCustomEditForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;


implementation

uses
  AddressMVP,
  PressXCLBroker;

{$R *.lfm}

initialization
  PressXCLForm(TAddressLabelEditPresenter, TAddressLabelEditForm);


end.

