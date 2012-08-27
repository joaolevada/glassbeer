unit AddressEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TAddressEditForm }

  TAddressEditForm = class(TCustomEditForm)
    CityComboBox: TComboBox;
    CityLabel: TLabel;
    PostalCodeEdit: TEdit;
    PostalCodeLabel: TLabel;
    NeighborhoodComboBox: TComboBox;
    NeighborhoodLabel: TLabel;
    POBoxEdit: TEdit;
    POBoxLabel: TLabel;
    NumberLabel: TLabel;
    LabelLabel: TLabel;
    StreetLabel: TLabel;
    NumberEdit: TEdit;
    StreetEdit: TEdit;
    LabelComboBox: TComboBox;
  end;

implementation

uses
  AddressMVP,
  PressXCLBroker;

{$R *.lfm}

initialization
  PressXCLForm(TAddressEditPresenter, TAddressEditForm);

end.

