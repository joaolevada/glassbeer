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
  end;

implementation

{$R *.lfm}

uses
  PressXCLBroker
  ,CustomMVP;

initialization
  PressXCLForm(TCustomEditPresenter, TCustomEditForm);

end.

