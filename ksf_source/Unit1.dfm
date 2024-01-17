object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Koch Snowflake Fractals'
  ClientHeight = 612
  ClientWidth = 638
  Color = 3487029
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 638
    Height = 612
    Align = alClient
    Color = 3487029
    ParentColor = False
    OnPaint = PaintBox1Paint
    ExplicitLeft = -8
  end
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 32
    Height = 32
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
      0000023B4944415478DACD973F4C13511CC7DF055820E940E31F12402670AA0C
      6EA684EED274C3C9B486C410361D58B0094606065743A206D95CCB9F9540ECA6
      6C44910D9580A50EC4180625F5F3CBDD83F6ECF5EEA577ADBFE49B5FEEEEE5BE
      9F7B77F77BBF67A936876532B852A97492C6D01D348C62721AFD44FBA888DE59
      96F52754008C6F9266511AF5FA0CFF81D6D022207B4D01607C95F40CE550A7C9
      6C11320BAF511E90923100E6B7480574C3D0D81D872803C487C000984F90DEA2
      EE26CD75FC42F78058F705C07C54D91F534F48E63ACED0987B266A009C77BE83
      FA4336D7F105DD06E2C40BE025692A22731D4B004CFF0380F9086957997FEDA6
      718E12407C74032C93B2119BEB5806E0C1058053E1BE2BEF222370A560F7BE88
      6B0D1E488AD575A9981A2045DAF4182CA5562AE09121401F5A55DEB52605C096
      06C893E69B9D57C39803604103AC90EEB718600580AC0690929B6E30F811FA66
      6830809E37B85E00201314E031FA1A25403B5EC11B00721AE009E9698B016A3E
      42BFDF5056C7634303BFDF701C80EDEA422406718FC16117A2B2B20BD1F9FF51
      8A1D0069326531EA8AD85C5A35598C3ED50038104BA4871103BCC07C461FD46B
      48DEA3C188CC0F94DD9094EB02381051B66449CC77AA4F7A35A57795DD948605
      214DE924E61BEE0B8DDAF284B2DBF2A126CD650DC9B89FDC17C081B8A2EC0A29
      7DA269ABF61BBD52F6C6A4EC3528E8D64CFA45BD358BFB0C976E472AA06CCD3E
      FBDDDB7473DA414A2A7B732A5031E7D2A9BADC9C16A5C205BDA7114014F1172F
      E3BF21CE1A2C130000000049454E44AE426082}
    OnClick = Image1Click
  end
  object Image2: TImage
    Left = 0
    Top = 38
    Width = 32
    Height = 32
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
      000002634944415478DAC597CF4B155114C7EF902214B8B00C1791ADD29506BA
      0B0D6959C95B04B5F25781487F801B158C5AF40F8490A212415B4B7752914282
      BA93D2764982652D42C485CAF373B873A599DECCDCEBCCBC0E7C39BCF7EEDCEF
      67E6DD39F75C4FFDE7F05C06178BC50A523BBA8EAEA26AF91AEDA2AF68112D78
      9E77982900C68DA441D4896A1286FF466FD13340D65301607C91F404F5A20A97
      A745C85398402380FC7406C0BC993483EA1D8DC3B1850A40AC5803607E87F41A
      9D4D696E620FDD0762361100F36B4A2FA67319999BD847EDE1271100F0FFF355
      74296373139BA815889D288017A48739999B180360E01F00CC1B486BCA7DB5BB
      C6116A02E273186092D493B3B9894900FA4E00FC0AF743C5179957E87BC2C4DD
      A8CE02408A559D544C037093349F7091ACE085B801CC232BBCC5F2297430DF07
      0330421A2D33C010F33D3500D3A42E1B00C6CA2BBAA44A1729D99CCE58024C33
      5F8F019092DB690920772877FA40E95D302E5EA2AA88DF6698AF9006A096CFBF
      E22E60EC9E8A2EE701009BBFE016FA8464937A9F01C014D7F71A8061D263E516
      6901028BB083F4AECC0037B8FEA3019095BB8D2E9409205888FCC1AEA5F82EFA
      933046F6FF526F41B014FB00D264CA6654E900719A90564D36A32F01001F628C
      D49F33C073CC1F990FA51A9265743927F36F4A3724276BA7DC2D591BE6AB7F7F
      19D594DE56BA29CD0A42DE867B98CF857F886BCB9B946ECBAFA434971EA210BE
      F344001FA256E90A297DA26BAB7680C6953E9844D60BDBA399F48BE668763E61
      B81499374A1FCD3692E6763D9C4AC56C53FA702A50D5FE4F5290CCE17411E323
      DB399D00F288632B99EB21FE3A512C0000000049454E44AE426082}
    OnClick = Image2Click
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 0
    Width = 121
    Height = 137
    Color = 5197647
    ParentBackground = False
    ParentColor = False
    ShowFrame = False
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 19
      Width = 30
      Height = 15
      Caption = 'Stufe:'
    end
    object Label3: TLabel
      Left = 13
      Top = 104
      Width = 48
      Height = 15
      Caption = 'Ergebnis:'
    end
    object Edit3: TEdit
      Left = 65
      Top = 103
      Width = 45
      Height = 23
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 65
      Top = 16
      Width = 28
      Height = 23
      TabOrder = 1
      Text = '0'
    end
    object Button1: TButton
      Left = 13
      Top = 73
      Width = 97
      Height = 25
      Caption = 'Anti Snowflake'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 13
      Top = 47
      Width = 97
      Height = 25
      Caption = 'Koch Snowflake'
      TabOrder = 3
      OnClick = Button2Click
    end
    object UpDown1: TUpDown
      Left = 93
      Top = 16
      Width = 17
      Height = 25
      TabOrder = 4
      OnClick = UpDown1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 38
    Width = 121
    Height = 137
    Color = 5197647
    ParentBackground = False
    ParentColor = False
    ShowFrame = False
    TabOrder = 1
    Visible = False
    object Label2: TLabel
      Left = 6
      Top = 13
      Width = 96
      Height = 15
      Caption = 'Derzeitige Bitmap:'
    end
    object Button3: TButton
      Left = 6
      Top = 34
      Width = 109
      Height = 25
      Caption = 'Speichern'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 6
      Top = 65
      Width = 109
      Height = 25
      Caption = 'Zur'#252'cksetzen'
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 6
      Top = 96
      Width = 109
      Height = 25
      Caption = 'Hintergrund'
      DropDownMenu = PopupMenu1
      Style = bsSplitButton
      TabOrder = 2
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 147
    Top = 133
    object Standart1: TMenuItem
      Caption = 'Standart'
      Checked = True
      OnClick = Standart1Click
    end
    object Hell1: TMenuItem
      Caption = 'Hell'
      OnClick = Hell1Click
    end
    object ChromaKey1: TMenuItem
      Caption = 'ChromaKey'
      OnClick = ChromaKey1Click
    end
    object ransparent1: TMenuItem
      Caption = 'Transparent'
      OnClick = ransparent1Click
    end
  end
end
