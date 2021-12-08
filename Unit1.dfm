object Form1: TForm1
  Left = 307
  Top = 138
  Width = 723
  Height = 290
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 281
    Height = 13
    Caption = 'chave de transporte (KEK) da autorizadora (formato aberto):'
  end
  object Label3: TLabel
    Left = 18
    Top = 158
    Width = 366
    Height = 13
    Caption = 
      'Woking Key (WK) aberta, descriptografada pela autorizadora com a' +
      ' sua KEK:'
  end
  object Label4: TLabel
    Left = 15
    Top = 87
    Width = 420
    Height = 13
    Caption = 
      'Exemplo de Working Key criptografada com a chave de transporte (' +
      'KEK) da autorizadora'
  end
  object edtChave: TEdit
    Left = 12
    Top = 32
    Width = 248
    Height = 21
    TabOrder = 0
    Text = '76F82C37647FEC4C6B5864F8312AAD8C'
  end
  object edtResultado: TEdit
    Left = 16
    Top = 178
    Width = 365
    Height = 21
    TabOrder = 1
  end
  object edtChaveCompleta: TEdit
    Left = 13
    Top = 107
    Width = 365
    Height = 21
    TabOrder = 2
    Text = '175DF0A7FCE3F498E3CDD798B3EE9680'
  end
  object btnDecript3: TButton
    Left = 396
    Top = 104
    Width = 154
    Height = 25
    Caption = 'Decript'
    TabOrder = 3
    OnClick = btnDecript3Click
  end
  object dcp_3ds1: TDCP_3des
    Id = 24
    Algorithm = '3DES'
    MaxKeySize = 192
    BlockSize = 64
    Left = 380
    Top = 36
  end
end
