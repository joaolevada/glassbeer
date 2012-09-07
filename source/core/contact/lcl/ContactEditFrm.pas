unit ContactEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TContactEditForm }

  TContactEditForm = class(TCustomEditForm)
    AddAddressSpeedButton: TSpeedButton;
    EditAddressSpeedButton: TSpeedButton;
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    AddressesLabel: TLabel;
    InternetAddressEdit: TEdit;
    InternetAddressLabelComboBox: TComboBox;
    InternetAddressGroubBox: TGroupBox;
    InternetAddressesLabel: TLabel;
    InternetAddressLabelLabel: TLabel;
    InternetAddressLabel: TLabel;
    PhoneNumberEdit: TEdit;
    PhoneNumberLabel: TLabel;
    PhoneLabelComboBox: TComboBox;
    PhoneLabelLabel: TLabel;
    PhoneGroupBox: TGroupBox;
    PhonesLabel: TLabel;
    NickNameEdit: TEdit;
    NickNameLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    AddressesTabSheet: TTabSheet;
    AddressesStringGrid: TStringGrid;
    PhonesTabSheet: TTabSheet;
    PhonesStringGrid: TStringGrid;
    InternetTabSheet: TTabSheet;
    InternetAddressesStringGrid: TStringGrid;
    DocumentsTabSheet: TTabSheet;
    RemoveAddressSpeedButton: TSpeedButton;
    AddPhoneSpeedButton: TSpeedButton;
    EditPhoneSpeedButton: TSpeedButton;
    RemovePhoneSpeedButton: TSpeedButton;
    AddInternetAddressSpeedButton: TSpeedButton;
    EditInternetAddressSpeedButton: TSpeedButton;
    RemoveInternetAddressSpeedButton: TSpeedButton;
    AddPhoneLabelSpeedButton: TSpeedButton;
    EditPhoneLabelSpeedButton: TSpeedButton;
    AddInternetAddressLabelSpeedButton: TSpeedButton;
    EditInternetAddressLabelSpeedButton: TSpeedButton;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses
  MainFrm;

{$R *.lfm}

{ TContactEditForm }

constructor TContactEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddAddressSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditAddressSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveAddressSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddPhoneSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditPhoneSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemovePhoneSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddPhoneLabelSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditPhoneLabelSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddInternetAddressSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditInternetAddressSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveInternetAddressSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddInternetAddressLabelSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditInternetAddressLabelSpeedButton.Glyph);
end;

end.

