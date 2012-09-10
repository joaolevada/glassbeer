unit CustomEditFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls;

type

  { TCustomEditForm }

  TCustomEditForm = class(TForm)
    EditPageControl: TPageControl;
    MainTab: TTabSheet;
    SaveButton: TBitBtn;
    CancelButton: TBitBtn;
    BottomPanel: TPanel;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker
  ,CustomMVP
  ,MainFrm;

constructor TCustomEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons32ImageList.GetBitmap(IMG_ACCEPT, SaveButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_CANCEL, CancelButton.Glyph);
end;

{ TCustomEditForm }

initialization
  PressXCLForm(TCustomEditPresenter, TCustomEditForm);


end.

