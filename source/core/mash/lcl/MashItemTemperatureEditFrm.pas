unit MashItemTemperatureEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TMashItemTemperatureEditForm }

  TMashItemTemperatureEditForm = class(TCustomEditForm)
    MeasuredAtEdit: TEdit;
    MeasuredAtLabel: TLabel;
    TemperatureEdit: TEdit;
    TemperatureLabel: TLabel;
  end;

implementation

{$R *.lfm}

uses
  PressXCLBroker,
  MashItemLogMVP;

initialization
  PressXCLForm(TMashItemTemperatureEditPresenter, TMashItemTemperatureEditForm);

end.

