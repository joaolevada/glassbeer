unit AddressEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TAddressEditForm }

  TAddressEditForm = class(TCustomEditForm)
    AddNeighborhoodSpeedButton: TSpeedButton;
    AddCitySpeedButton: TSpeedButton;
    CityComboBox: TComboBox;
    CityLabel: TLabel;
    EditNeighborhoodSpeedButton: TSpeedButton;
    EditCitySpeedButton: TSpeedButton;
    PostalCodeEdit: TEdit;
    PostalCodeLabel: TLabel;
    NeighborhoodComboBox: TComboBox;
    NeighborhoodLabel: TLabel;
    POBoxEdit: TEdit;
    POBoxLabel: TLabel;
    NumberLabel: TLabel;
    LabelLabel: TLabel;
    AddLabelSpeedButton: TSpeedButton;
    EditLabelSpeedButton: TSpeedButton;
    StreetLabel: TLabel;
    NumberEdit: TEdit;
    StreetEdit: TEdit;
    LabelComboBox: TComboBox;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  AddressMVP,
  PressXCLBroker,
  MainFrm;

{ TAddressEditForm }

constructor TAddressEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddLabelSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditLabelSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddNeighborhoodSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditNeighborhoodSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddCitySpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditCitySpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TAddressEditPresenter, TAddressEditForm);

end.

