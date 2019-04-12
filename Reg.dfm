object Form1: TForm1
  Left = 323
  Top = 82
  Width = 1066
  Height = 584
  Caption = 'Programas Instalados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    1050
    545)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 1050
    Height = 13
    Align = alTop
  end
  object Button1: TButton
    Left = 11
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 839
    Top = 22
    Width = 205
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Listar Apenas Programas TecnoSpeed'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 11
    Top = 52
    Width = 1033
    Height = 489
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 450
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Editor'
        Width = 450
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 456
    Top = 24
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'Editor'
        DataType = ftString
        Size = 500
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end
      item
        Name = 'ClientDataSet1Index3'
        Fields = 'Nome'
      end>
    IndexName = 'ClientDataSet1Index3'
    Params = <>
    StoreDefs = True
    Left = 536
    Top = 24
    Data = {
      4E0000009619E0BD0100000018000000020000000000030000004E00044E6F6D
      65020049000000010005574944544802000200F40106456469746F7202004900
      0000010005574944544802000200F4010000}
    object ClientDataSet1Nome: TStringField
      FieldName = 'Nome'
      Size = 500
    end
    object ClientDataSet1Editor: TStringField
      FieldName = 'Editor'
      Size = 500
    end
  end
end
