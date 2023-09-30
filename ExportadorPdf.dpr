program ExportadorPdf;

uses
  Vcl.Forms,
  uInserirDadosBanco in 'uInserirDadosBanco.pas' {fInserirConexao},
  uConexao in 'uConexao.pas' {dmConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfInserirConexao, fInserirConexao);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
