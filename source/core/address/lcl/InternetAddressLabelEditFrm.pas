unit InternetAddressLabelEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TInternetAddressLabelEditForm }

  TInternetAddressLabelEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
  end;


implementation

uses
  PressXCLBroker,
  AddressMVP;

{$R *.lfm}

initialization
  PressXCLForm(TInternetAddressLabelEditPresenter,
    TInternetAddressLabelEditForm);

end.

