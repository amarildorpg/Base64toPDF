object dmConexao: TdmConexao
  Height = 385
  Width = 466
  object dBanco: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 48
    Top = 96
  end
  object sqlLabAtendimentoResultadoPdf: TFDQuery
    Connection = dBanco
    SQL.Strings = (
      'SELECT * FROM lab_atendimento_resultado_pdf')
    Left = 168
    Top = 96
    object sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'lab_atend_resul_pdf_id'
      Origin = 'lab_atend_resul_pdf_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_nome: TStringField
      FieldName = 'lab_atend_resul_pdf_nome'
      Origin = 'lab_atend_resul_pdf_nome'
      Required = True
      Size = 255
    end
    object sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_md5: TStringField
      FieldName = 'lab_atend_resul_pdf_md5'
      Origin = 'lab_atend_resul_pdf_md5'
      Required = True
      Size = 255
    end
    object sqlLabAtendimentoResultadoPdflab_atend_id: TLargeintField
      FieldName = 'lab_atend_id'
      Origin = 'lab_atend_id'
      Required = True
    end
    object sqlLabAtendimentoResultadoPdffornec_id: TLargeintField
      FieldName = 'fornec_id'
      Origin = 'fornec_id'
      Required = True
    end
    object sqlLabAtendimentoResultadoPdfdata_cad: TDateTimeField
      FieldName = 'data_cad'
      Origin = 'data_cad'
      Required = True
    end
    object sqlLabAtendimentoResultadoPdfdata_alt: TDateTimeField
      FieldName = 'data_alt'
      Origin = 'data_alt'
      Required = True
    end
    object sqlLabAtendimentoResultadoPdfprf_id_cad: TLargeintField
      FieldName = 'prf_id_cad'
      Origin = 'prf_id_cad'
      Required = True
    end
    object sqlLabAtendimentoResultadoPdfprf_id_alt: TLargeintField
      FieldName = 'prf_id_alt'
      Origin = 'prf_id_alt'
      Required = True
    end
    object sqlLabAtendimentoResultadoPdfserv_id_cad: TLargeintField
      FieldName = 'serv_id_cad'
      Origin = 'serv_id_cad'
      Required = True
    end
    object sqlLabAtendimentoResultadoPdfserv_id_alt: TLargeintField
      FieldName = 'serv_id_alt'
      Origin = 'serv_id_alt'
      Required = True
    end
    object sqlLabAtendimentoResultadoPdflab_atend_resul_pdf_base64: TMemoField
      FieldName = 'lab_atend_resul_pdf_base64'
      Origin = 'lab_atend_resul_pdf_base64'
      Required = True
      BlobType = ftMemo
    end
  end
end
