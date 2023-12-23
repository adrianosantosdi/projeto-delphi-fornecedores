object DM: TDM
  OldCreateOrder = False
  Height = 505
  Width = 698
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=dbfornecedores'
      'User_Name=root'
      'Password=p@ssw0rd'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 96
  end
  object QryFornecedores: TFDQuery
    Connection = FDConn
    Left = 80
    Top = 184
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Adriano Santos\Documents\Projetos Delphi\Cadastro Forne' +
      'cedor\libmySQL.dll'
    Left = 608
    Top = 24
  end
  object dsFornecedores: TDataSource
    DataSet = QryFornecedores
    Left = 176
    Top = 184
  end
end
