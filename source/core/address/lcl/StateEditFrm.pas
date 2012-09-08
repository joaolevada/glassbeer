unit StateEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TStateEditForm }

  TStateEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    AbbreviationLabel: TLabel;
    AbbreviationEdit: TEdit;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    CountryComboBox: TComboBox;
    CountryLabel: TLabel;
    AddCountrySpeedButton: TSpeedButton;
    EditCountrySpeedButton: TSpeedButton;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses
  AddressMVP,
  PressXCLBroker,
  MainFrm;

{ TStateEditForm }

constructor TStateEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddCountrySpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditCountrySpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TStateEditPresenter, TStateEditForm);

end.

