object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Consulta por Nombre del Fallecido'
  ClientHeight = 296
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 489
    Height = 281
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 98
      Height = 13
      Caption = 'Nombre del Fallecido'
    end
    object Edit1: TEdit
      Left = 120
      Top = 21
      Width = 337
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = Edit1Change
    end
    object DBGrid1: TDBGrid
      Left = 120
      Top = 43
      Width = 337
      Height = 142
      DataSource = DataModule1.DataSource2
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Visible = False
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'fecha_titulo'
          Title.Caption = 'Fecha Titulo'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nombre_fallecido'
          Title.Caption = 'Nombre del Fallecido'
          Width = 231
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 352
      Top = 240
      Width = 105
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
