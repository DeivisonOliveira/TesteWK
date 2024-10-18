object PagePedidoVenda: TPagePedidoVenda
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeft
  Caption = 'Pedido Venda'
  ClientHeight = 541
  ClientWidth = 948
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentBiDiMode = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 942
    Height = 535
    Align = alClient
    AutoSize = True
    TabOrder = 0
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 934
      Height = 42
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object btCancelarPedido: TButton
        AlignWithMargins = True
        Left = 771
        Top = 3
        Width = 160
        Height = 36
        Align = alRight
        Caption = 'CANCELAR PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btCancelarPedidoClick
      end
      object btBuscarPedido: TButton
        AlignWithMargins = True
        Left = 605
        Top = 3
        Width = 160
        Height = 36
        Align = alRight
        Caption = 'BUSCAR PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btBuscarPedidoClick
      end
      object btGravarPedido: TButton
        AlignWithMargins = True
        Left = 439
        Top = 3
        Width = 160
        Height = 36
        Align = alRight
        Caption = 'GRAVAR PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btGravarPedidoClick
      end
      object btNovoPedido: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 160
        Height = 36
        Align = alLeft
        Caption = 'NOVO PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btNovoPedidoClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 480
      Width = 940
      Height = 54
      Align = alBottom
      BevelOuter = bvNone
      Padding.Right = 4
      TabOrder = 1
      object Label6: TLabel
        AlignWithMargins = True
        Left = 478
        Top = 3
        Width = 99
        Height = 48
        Align = alRight
        Alignment = taRightJustify
        Caption = 'TOTAL    '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 32
      end
      object lblData_Atual: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 62
        Height = 48
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 32
      end
      object DBEditTotal: TDBEdit
        AlignWithMargins = True
        Left = 583
        Top = 3
        Width = 350
        Height = 48
        Align = alRight
        AutoSize = False
        BiDiMode = bdRightToLeft
        Color = clSteelblue
        DataField = 'VALOR_TOTAL'
        DataSource = dsPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 52
      Width = 934
      Height = 425
      Align = alClient
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 2
      object Panel5: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 39
        Width = 928
        Height = 33
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        Padding.Left = 10
        TabOrder = 0
        object Panel6: TPanel
          Left = 10
          Top = 0
          Width = 185
          Height = 33
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Padding.Left = 10
          ParentBiDiMode = False
          TabOrder = 0
          object DBEditCodigoCliente: TDBEdit
            Left = 10
            Top = 0
            Width = 175
            Height = 29
            Align = alTop
            BiDiMode = bdLeftToRight
            DataField = 'CODIGO_CLIENTE'
            DataSource = dsPedido
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 0
            OnExit = DBEditCodigoClienteExit
          end
        end
        object Panel7: TPanel
          Left = 195
          Top = 0
          Width = 733
          Height = 33
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Padding.Left = 10
          ParentBiDiMode = False
          TabOrder = 1
          object DBEditNomeCliente: TDBEdit
            Left = 10
            Top = 0
            Width = 723
            Height = 29
            Align = alTop
            BiDiMode = bdLeftToRight
            CharCase = ecUpperCase
            DataField = 'NOME_CLIENTE'
            DataSource = dsPedido
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 928
        Height = 30
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        Padding.Left = 3
        TabOrder = 1
        object Panel9: TPanel
          AlignWithMargins = True
          Left = 6
          Top = 3
          Width = 185
          Height = 24
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Padding.Left = 11
          ParentBiDiMode = False
          TabOrder = 0
          object Label1: TLabel
            AlignWithMargins = True
            Left = 14
            Top = 3
            Width = 168
            Height = 18
            Align = alClient
            Caption = 'C'#243'd. Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 92
            ExplicitHeight = 21
          end
        end
        object Panel10: TPanel
          AlignWithMargins = True
          Left = 197
          Top = 3
          Width = 728
          Height = 24
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Padding.Left = 5
          ParentBiDiMode = False
          TabOrder = 1
          object Label2: TLabel
            AlignWithMargins = True
            Left = 8
            Top = 3
            Width = 717
            Height = 18
            Align = alClient
            Caption = 'Nome Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 105
            ExplicitHeight = 21
          end
        end
      end
      object Panel11: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 78
        Width = 928
        Height = 40
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        Padding.Left = 20
        ParentBiDiMode = False
        TabOrder = 2
        object DBEditDescricao: TDBEdit
          Left = 20
          Top = 0
          Width = 908
          Height = 40
          Align = alTop
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clSteelblue
          DataField = 'DESCRICAO'
          DataSource = dsPedidoProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 121
        Width = 934
        Height = 304
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 3
        object Panel13: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 318
          Height = 298
          Align = alLeft
          BevelOuter = bvNone
          Padding.Left = 6
          Padding.Right = 6
          TabOrder = 0
          object Panel15: TPanel
            AlignWithMargins = True
            Left = 9
            Top = 3
            Width = 300
            Height = 68
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object Panel16: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 294
              Height = 27
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              BiDiMode = bdLeftToRight
              Padding.Left = 6
              ParentBiDiMode = False
              TabOrder = 0
              object Label3: TLabel
                AlignWithMargins = True
                Left = 9
                Top = 3
                Width = 282
                Height = 21
                Align = alTop
                Caption = 'C'#243'd. Produto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitWidth = 100
              end
            end
            object Panel17: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 36
              Width = 294
              Height = 29
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              BiDiMode = bdLeftToRight
              Padding.Left = 9
              ParentBiDiMode = False
              TabOrder = 1
              object DBEditCodigoProduto: TDBEdit
                Left = 9
                Top = 0
                Width = 285
                Height = 29
                Align = alTop
                BiDiMode = bdLeftToRight
                DataField = 'CODIGO'
                DataSource = dsPedidoProduto
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentBiDiMode = False
                ParentFont = False
                TabOrder = 0
                OnExit = DBEditCodigoProdutoExit
              end
            end
          end
          object Panel18: TPanel
            Left = 6
            Top = 74
            Width = 306
            Height = 73
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Panel19: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 150
              Height = 67
              Align = alLeft
              AutoSize = True
              BevelOuter = bvNone
              Padding.Left = 5
              Padding.Right = 5
              TabOrder = 0
              object Panel21: TPanel
                AlignWithMargins = True
                Left = 8
                Top = 3
                Width = 134
                Height = 27
                Align = alTop
                AutoSize = True
                BevelOuter = bvNone
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                TabOrder = 0
                object Label4: TLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 128
                  Height = 21
                  Align = alTop
                  Caption = 'Quantidade'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ExplicitWidth = 90
                end
              end
              object Panel23: TPanel
                Left = 5
                Top = 33
                Width = 140
                Height = 32
                Align = alTop
                BevelOuter = bvNone
                Padding.Left = 5
                TabOrder = 1
                object DBEditQuantidade: TDBEdit
                  AlignWithMargins = True
                  Left = 8
                  Top = 3
                  Width = 129
                  Height = 29
                  Align = alTop
                  AutoSize = False
                  BiDiMode = bdRightToLeft
                  DataField = 'QUANTIDADE'
                  DataSource = dsPedidoProduto
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentBiDiMode = False
                  ParentFont = False
                  TabOrder = 0
                end
              end
            end
            object Panel20: TPanel
              AlignWithMargins = True
              Left = 153
              Top = 3
              Width = 150
              Height = 67
              Align = alRight
              AutoSize = True
              BevelOuter = bvNone
              Padding.Left = 5
              Padding.Right = 5
              TabOrder = 1
              object Panel22: TPanel
                AlignWithMargins = True
                Left = 8
                Top = 3
                Width = 134
                Height = 27
                Align = alTop
                AutoSize = True
                BevelOuter = bvNone
                TabOrder = 0
                object Label5: TLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 128
                  Height = 21
                  Align = alTop
                  BiDiMode = bdLeftToRight
                  Caption = 'Valor Unit'#225'rio'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentBiDiMode = False
                  ParentFont = False
                  ExplicitWidth = 107
                end
              end
              object Panel24: TPanel
                Left = 5
                Top = 33
                Width = 140
                Height = 32
                Align = alTop
                BevelOuter = bvNone
                Padding.Left = 4
                TabOrder = 1
                object DBEditValorUnitario: TDBEdit
                  AlignWithMargins = True
                  Left = 7
                  Top = 3
                  Width = 130
                  Height = 29
                  Align = alTop
                  AutoSize = False
                  BiDiMode = bdRightToLeft
                  DataField = 'VALOR_UNITARIO'
                  DataSource = dsPedidoProduto
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentBiDiMode = False
                  ParentFont = False
                  TabOrder = 0
                end
              end
            end
          end
          object Panel25: TPanel
            Left = 6
            Top = 147
            Width = 306
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Padding.Left = 16
            Padding.Right = 11
            ParentBiDiMode = False
            TabOrder = 2
            object btAdicionar: TButton
              Left = 16
              Top = 0
              Width = 279
              Height = 41
              Align = alClient
              BiDiMode = bdLeftToRight
              Caption = '+ Adicionar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 0
              OnClick = btAdicionarClick
            end
          end
          object Panel26: TPanel
            Left = 6
            Top = 188
            Width = 306
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            Caption = 'N'#176' Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object Panel27: TPanel
            Left = 6
            Top = 212
            Width = 306
            Height = 53
            Align = alTop
            BevelOuter = bvNone
            Padding.Left = 12
            Padding.Right = 8
            TabOrder = 4
            object DBEditNumeroPedido: TDBEdit
              AlignWithMargins = True
              Left = 15
              Top = 3
              Width = 280
              Height = 35
              Align = alTop
              AutoSize = False
              BiDiMode = bdRightToLeft
              DataField = 'NUMERO_PEDIDO'
              DataSource = dsPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
        object Panel14: TPanel
          AlignWithMargins = True
          Left = 327
          Top = 3
          Width = 604
          Height = 298
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 604
            Height = 298
            Align = alClient
            DataSource = dsPedidoProduto
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnKeyDown = DBGrid1KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                ReadOnly = True
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                ReadOnly = True
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                ReadOnly = True
                Width = 100
                Visible = True
              end>
          end
        end
      end
    end
  end
  object dsPedidoProduto: TDataSource
    DataSet = TablePedidoProduto
    Left = 702
    Top = 353
  end
  object TablePedidoProduto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 809
    Top = 353
    object TablePedidoProdutoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object TablePedidoProdutoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object TablePedidoProdutoQUANTIDADE: TIntegerField
      DisplayLabel = 'Qtde.'
      FieldName = 'QUANTIDADE'
    end
    object TablePedidoProdutoVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      currency = True
    end
    object TablePedidoProdutoVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      currency = True
    end
    object TablePedidoProdutoNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
  end
  object TablePedido: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 782
    Top = 277
    object TablePedidoCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
    end
    object TablePedidoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 200
    end
    object TablePedidoNUMERO_PEDIDO: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMERO_PEDIDO'
    end
    object TablePedidoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object TablePedidoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      currency = True
    end
  end
  object dsPedido: TDataSource
    DataSet = TablePedido
    Left = 718
    Top = 277
  end
end
