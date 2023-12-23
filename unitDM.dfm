object DM: TDM
  OldCreateOrder = False
  Height = 516
  Width = 786
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=dbfornecedores'
      'User_Name=root'
      'Password=p@ssw0rd'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 64
  end
  object QueryFornecedores: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'select * from fornecedores')
    Left = 88
    Top = 152
    object QueryFornecedoresid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object QueryFornecedoresnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object QueryFornecedoresendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Required = True
      Size = 100
    end
    object QueryFornecedoresbairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 100
    end
    object QueryFornecedorescidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 100
    end
    object QueryFornecedoresuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QueryFornecedorescep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Required = True
      Size = 9
    end
    object QueryFornecedorescnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Required = True
      Size = 18
    end
    object QueryFornecedoresie: TStringField
      FieldName = 'ie'
      Origin = 'ie'
      Required = True
      Size = 15
    end
    object QueryFornecedorescelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      Required = True
      Size = 14
    end
    object QueryFornecedorescontato: TStringField
      FieldName = 'contato'
      Origin = 'contato'
      Required = True
      Size = 50
    end
    object QueryFornecedoresemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Required = True
      Size = 50
    end
    object QueryFornecedoressite: TStringField
      FieldName = 'site'
      Origin = 'site'
      Required = True
      Size = 50
    end
    object QueryFornecedoresobservacoes: TMemoField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      Required = True
      BlobType = ftMemo
    end
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Adriano Santos\Documents\Projetos Delphi\Cadastro Forne' +
      'cedor\libmySQL.dll'
    Left = 664
    Top = 56
  end
  object dsFornecedores: TDataSource
    DataSet = QueryFornecedores
    Left = 192
    Top = 152
  end
end
