object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 281
  Width = 494
  object SQLConnection1: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver180.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=18.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver180.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=18.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'MaxBlobSize=-1'
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=panteones'
      'User_Name=root'
      'Password=123'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    Connected = True
    Left = 32
    Top = 16
  end
  object Tperpetuidad: TSQLTable
    Active = True
    MaxBlobSize = -1
    SQLConnection = SQLConnection1
    TableName = 'perpetuidad'
    Left = 112
    Top = 16
    object Tperpetuidadid_perpetuidad: TIntegerField
      FieldName = 'id_perpetuidad'
      Required = True
    end
    object Tperpetuidadnombre_fallecido: TStringField
      FieldName = 'nombre_fallecido'
      Required = True
      Size = 40
    end
    object Tperpetuidadsolicitante: TStringField
      FieldName = 'solicitante'
      Required = True
      Size = 40
    end
    object Tperpetuidadpanteon: TStringField
      FieldName = 'panteon'
      Required = True
      Size = 40
    end
    object Tperpetuidadno_recibo: TStringField
      FieldName = 'no_recibo'
      Size = 10
    end
    object Tperpetuidadcantidad_pagar: TFloatField
      FieldName = 'cantidad_pagar'
    end
    object Tperpetuidadfecha_recibo: TDateField
      FieldName = 'fecha_recibo'
    end
    object Tperpetuidadfecha_titulo: TDateField
      FieldName = 'fecha_titulo'
    end
    object Tperpetuidadsepulcro: TStringField
      FieldName = 'sepulcro'
      Size = 30
    end
    object Tperpetuidadfila: TStringField
      FieldName = 'fila'
      Size = 30
    end
    object Tperpetuidadtipo: TStringField
      FieldName = 'tipo'
      Size = 30
    end
    object Tperpetuidadpresidente: TStringField
      FieldName = 'presidente'
      Size = 40
    end
    object Tperpetuidadsecretario: TStringField
      FieldName = 'secretario'
      Size = 40
    end
    object Tperpetuidadtesorero: TStringField
      FieldName = 'tesorero'
      Size = 40
    end
    object Tperpetuidadseccion: TStringField
      FieldName = 'seccion'
    end
  end
  object Queryagregartitulo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'fallecido'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'solicitante'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'panteon'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'recibo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cantidad'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecharecibo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fechatitulo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sepulcro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'seccion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'presidente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'secretario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tesorero'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'INSERT INTO perpetuidad (nombre_fallecido, solicitante, panteon,' +
        ' no_recibo, cantidad_pagar, fecha_recibo, fecha_titulo, sepulcro' +
        ', fila, tipo, seccion,  presidente, secretario, tesorero)'
      
        'VALUES ( :fallecido, :solicitante, :panteon, :recibo, :cantidad,' +
        ' :fecharecibo, :fechatitulo, :sepulcro, :fila, :tipo,:seccion,  ' +
        ':presidente, :secretario, :tesorero);'
      '')
    SQLConnection = SQLConnection1
    Left = 24
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 16
    Top = 144
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 88
    Top = 144
    object ClientDataSet1id_perpetuidad: TIntegerField
      FieldName = 'id_perpetuidad'
      Required = True
    end
    object ClientDataSet1nombre_fallecido: TStringField
      FieldName = 'nombre_fallecido'
      Required = True
      Size = 40
    end
    object ClientDataSet1solicitante: TStringField
      FieldName = 'solicitante'
      Required = True
      Size = 40
    end
    object ClientDataSet1panteon: TStringField
      FieldName = 'panteon'
      Required = True
      Size = 40
    end
    object ClientDataSet1no_recibo: TStringField
      FieldName = 'no_recibo'
      Size = 10
    end
    object ClientDataSet1cantidad_pagar: TFloatField
      FieldName = 'cantidad_pagar'
    end
    object ClientDataSet1fecha_recibo: TDateField
      FieldName = 'fecha_recibo'
    end
    object ClientDataSet1fecha_titulo: TDateField
      FieldName = 'fecha_titulo'
    end
    object ClientDataSet1sepulcro: TStringField
      FieldName = 'sepulcro'
      Size = 30
    end
    object ClientDataSet1fila: TStringField
      FieldName = 'fila'
      Size = 30
    end
    object ClientDataSet1tipo: TStringField
      FieldName = 'tipo'
      Size = 30
    end
    object ClientDataSet1presidente: TStringField
      FieldName = 'presidente'
      Size = 40
    end
    object ClientDataSet1secretario: TStringField
      FieldName = 'secretario'
      Size = 40
    end
    object ClientDataSet1tesorero: TStringField
      FieldName = 'tesorero'
      Size = 40
    end
    object ClientDataSet1seccion: TStringField
      FieldName = 'seccion'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Tperpetuidad
    Left = 168
    Top = 144
  end
  object Querybuscarnombrefellecido: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'fallecido'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      '    FROM perpetuidad'
      '       WHERE (nombre_fallecido LIKE  :fallecido)'
      '          ORDER BY nombre_fallecido;')
    SQLConnection = SQLConnection1
    Left = 136
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 16
    Top = 200
  end
  object ClientDataSet2: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 88
    Top = 200
    object ClientDataSet2id_perpetuidad: TIntegerField
      FieldName = 'id_perpetuidad'
      Required = True
    end
    object ClientDataSet2nombre_fallecido: TStringField
      FieldName = 'nombre_fallecido'
      Required = True
      Size = 40
    end
    object ClientDataSet2solicitante: TStringField
      FieldName = 'solicitante'
      Required = True
      Size = 40
    end
    object ClientDataSet2panteon: TStringField
      FieldName = 'panteon'
      Required = True
      Size = 40
    end
    object ClientDataSet2no_recibo: TStringField
      FieldName = 'no_recibo'
      Size = 10
    end
    object ClientDataSet2cantidad_pagar: TFloatField
      FieldName = 'cantidad_pagar'
    end
    object ClientDataSet2fecha_recibo: TDateField
      FieldName = 'fecha_recibo'
    end
    object ClientDataSet2fecha_titulo: TDateField
      FieldName = 'fecha_titulo'
    end
    object ClientDataSet2sepulcro: TStringField
      FieldName = 'sepulcro'
      Size = 30
    end
    object ClientDataSet2fila: TStringField
      FieldName = 'fila'
      Size = 30
    end
    object ClientDataSet2tipo: TStringField
      FieldName = 'tipo'
      Size = 30
    end
    object ClientDataSet2presidente: TStringField
      FieldName = 'presidente'
      Size = 40
    end
    object ClientDataSet2secretario: TStringField
      FieldName = 'secretario'
      Size = 40
    end
    object ClientDataSet2tesorero: TStringField
      FieldName = 'tesorero'
      Size = 40
    end
    object ClientDataSet2seccion: TStringField
      FieldName = 'seccion'
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = Querybuscarnombrefellecido
    Left = 168
    Top = 200
  end
end
