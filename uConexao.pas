unit uConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Data.FMTBcd, Data.SqlExpr, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TdmConexao = class(TDataModule)
    dBanco: TFDConnection;
    sqlLabAtendimentoResultadoPdf: TFDQuery;
    sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_id: TLargeintField;
    sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_nome: TStringField;
    sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_md5: TStringField;
    sqlLabAtendimentoResultadoPdflab_atend_id: TLargeintField;
    sqlLabAtendimentoResultadoPdffornec_id: TLargeintField;
    sqlLabAtendimentoResultadoPdfdata_cad: TDateTimeField;
    sqlLabAtendimentoResultadoPdfdata_alt: TDateTimeField;
    sqlLabAtendimentoResultadoPdfprf_id_cad: TLargeintField;
    sqlLabAtendimentoResultadoPdfprf_id_alt: TLargeintField;
    sqlLabAtendimentoResultadoPdfserv_id_cad: TLargeintField;
    sqlLabAtendimentoResultadoPdfserv_id_alt: TLargeintField;
    sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_base64: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexao }


end.
