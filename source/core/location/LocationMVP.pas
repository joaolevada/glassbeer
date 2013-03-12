unit LocationMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  CustomMVP
  ,LocationBO;

type

  { TLocationEditPresenter }

  TLocationEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TLocationQueryPresenter }

  TLocationQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;


implementation

{ TLocationQueryPresenter }

procedure TLocationQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TLocationQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Code(198, "Código");' +
    'Name(356, "Nome")';
end;

{ TLocationEditPresenter }

procedure TLocationEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
end;

initialization
  TLocationEditPresenter.RegisterBO(TLocation);
  TLocationQueryPresenter.RegisterBO(TLocationQuery);

end.

