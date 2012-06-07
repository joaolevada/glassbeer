unit MainFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TMainForm }

  TMainForm = class(TForm)
    GlassBeerMainMenu: TMainMenu;
    FileMenu: TMenuItem;
    ExitMenu: TMenuItem;
    MenuItem1: TMenuItem;
    MetadataMenu: TMenuItem;
    ToolsMenu: TMenuItem;
    RawMaterialMenu: TMenuItem;
  end; 

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

end.

