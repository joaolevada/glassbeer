unit AddressLabelEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TAddressLabelEditForm }

  TAddressLabelEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
  end;


implementation

uses
  AddressMVP,
  PressXCLBroker;

{$R *.lfm}

initialization
  PressXCLBroker(TAddressLabelEditPresenter, TAddressLabelEditForm);


end.

