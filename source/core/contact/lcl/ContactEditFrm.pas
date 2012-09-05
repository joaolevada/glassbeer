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
end;

end.

