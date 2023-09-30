unit uInserirDadosBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,FireDAC.Comp.Client, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, uConexao, System.NetEncoding,
  Data.DB;

type
  TfInserirConexao = class(TForm)
    lHost: TLabel;
    lUserName: TLabel;
    lPassword: TLabel;
    lPorta: TLabel;
    edHost: TEdit;
    edUsername: TEdit;
    edPassword: TEdit;
    edPorta: TEdit;
    edBanco: TEdit;
    lbBanco: TLabel;
    btExportar: TButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    edPastaPdf: TEdit;
    procedure btExportarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edBancoExit(Sender: TObject);
    procedure edHostExit(Sender: TObject);
    procedure edPasswordExit(Sender: TObject);
    procedure edUsernameExit(Sender: TObject);
    procedure edPortaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FConectado: Boolean;
    FSelectedFolder: string;
    FConexao: TdmConexao;
  public
    procedure PreencherConexaoEditada();
    procedure Base64ToPDF( const FileName: string; Base64String: string);
  end;

var
  fInserirConexao: TfInserirConexao;

implementation

{$R *.dfm}

{ TfInserirConexao }

procedure TfInserirConexao.Base64ToPDF( const FileName: string; Base64String: string);
var
  DecodedBytes: TBytes;
  FileStream: TFileStream;
begin
  DecodedBytes := TNetEncoding.Base64.DecodeStringToBytes(Base64String);
  try
    FileStream := TFileStream.Create(FileName, fmCreate);
    try
      FileStream.WriteBuffer(DecodedBytes[0], Length(DecodedBytes));
    finally
      FileStream.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar o arquivo PDF: ' + E.Message);
  end;
end;


procedure TfInserirConexao.btExportarClick(Sender: TObject);
var
 LtextoPdf64: string;
 Base64: TMemoField;
 LNome: String;
begin
  if edPastaPdf.Text = '' then
  begin
    ShowMessage('Insira um caminho para salvar os PDFs para Continuar');
    abort;
  end;
 self.PreencherConexaoEditada();
 if (FConectado) and not(FSelectedFolder = '') then
    Base64 := TMemoField.Create(nil);
    try
      FConexao.sqlLabAtendimentoResultadoPdf.Open();
      while not FConexao.sqlLabAtendimentoResultadoPdf.eof do
      begin
        LNome := edPastaPdf.Text + '\' +FConexao.sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_id.AsString + '' + FConexao.sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_nome.AsString + '.pdf';
        LtextoPdf64 := FConexao.sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_base64.AsString;
        Base64ToPDF(LNome, LtextoPdf64);
        FConexao.sqlLabAtendimentoResultadoPdf.Next;
        Sleep(1000);
      end;
      ShowMessage('Arquivos PDFs decodificado e salvos com sucesso');
    finally
      FreeAndNil(Base64);
    end;
end;

procedure TfInserirConexao.edBancoExit(Sender: TObject);
begin
  if edBanco.Text = '' then
  begin
    ShowMessage('Insira o Banco de Dados para Continuar');
    edBanco.SetFocus;
  end
end;

procedure TfInserirConexao.edHostExit(Sender: TObject);
begin
  if edHost.Text = '' then
  begin
    ShowMessage('Insira o HOST do Banco de Dados para Continuar');
    edHost.SetFocus;
  end
end;

procedure TfInserirConexao.edPasswordExit(Sender: TObject);
begin
  if edPassword.Text = '' then
  begin
    ShowMessage('Insira a Senha do Banco de Dados para Continuar');
    edPassword.SetFocus;
  end
end;

procedure TfInserirConexao.edPortaExit(Sender: TObject);
begin
  if edPorta.Text = '' then
  begin
    ShowMessage('Insira a Porta do Banco de Dados para Continuar');
    edPorta.SetFocus;
  end
end;

procedure TfInserirConexao.edUsernameExit(Sender: TObject);
begin
  if edUsername.Text = '' then
  begin
    ShowMessage('Insira a Ususario do Banco de Dados para Continuar');
    edUsername.SetFocus;
  end
end;

procedure TfInserirConexao.FormCreate(Sender: TObject);
begin
  FConexao := TdmConexao.Create(nil);
end;

procedure TfInserirConexao.PreencherConexaoEditada();
begin
  FConectado := False;
  try
    FConexao.dBanco.Params.Values['DriverID'] := 'MySQL';
    FConexao.dBanco.Params.Values['Database'] := edBanco.Text;
    FConexao.dBanco.Params.Values['Server'] := edHost.Text;
    FConexao.dBanco.Params.Values['UserName'] := edUsername.Text;
    FConexao.dBanco.Params.Values['Password'] := edPassword.Text;
    FConexao.dBanco.Params.Values['Porta'] := edPorta.Text;
    FConexao.dBanco.Connected := True;
    FConexao.dBanco.Open();
    FConectado := True;
  except
    on E:Exception do
    begin
      ShowMessage('Banco de Dados n�o localizado!'+#13+'Informe ao Suporte T�cnico.');
      FConectado := False;
      abort;
    end;
  end;
end;

procedure TfInserirConexao.SpeedButton1Click(Sender: TObject);
var
  folderDialog: TFileOpenDialog;
begin
  folderDialog := TFileOpenDialog.Create(nil);
  try
    folderDialog.Options := [fdoPickFolders];
    folderDialog.Title := 'Selecione uma pasta';
    if folderDialog.Execute then
    begin
      FSelectedFolder := folderDialog.FileName;
      edPastaPdf.Text :=  FSelectedFolder;
    end;
  finally
    folderDialog.Free;
  end;
end;

end.