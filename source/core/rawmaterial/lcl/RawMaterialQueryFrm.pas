unit RawMaterialQueryFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TRawMaterialQueryForm }

  TRawMaterialQueryForm = class(TCustomQueryForm)
    NameLabel: TLabel;
    NameEdit: TEdit;
  end;

implementation

uses
  PressXCLBroker
  ,RawMaterialMVP;

{$R *.lfm}

initialization
  PressXCLForm(TRawMaterialQueryPresenter, TRawMaterialQueryForm);

end.

