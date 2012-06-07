unit CustomQueryFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, Buttons, Grids;

type

  { TCustomQueryForm }

  TCustomQueryForm = class(TForm)
    AddButton: TBitBtn;
    EditButton: TBitBtn;
    RemoveButton: TBitBtn;
    SearchButton: TBitBtn;
    BottomPanel: TPanel;
    SearchPageControl: TPageControl;
    DefaultTab: TTabSheet;
    QueryStringGrid: TStringGrid;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.lfm}

uses
  PressXCLBroker
  ,CustomMVP;

const
  QUERYFORM_WIDTH = 800;
  QUERYFORM_HEIGHT = 600;

{ TCustomQueryForm }

constructor TCustomQueryForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Width := QUERYFORM_WIDTH;
  Self.Height := QUERYFORM_HEIGHT;
end;

initialization
  PressXCLForm(TCustomQueryPresenter, TCustomQueryForm);

end.

