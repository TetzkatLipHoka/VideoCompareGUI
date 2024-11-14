object FrmVideoCompare: TFrmVideoCompare
  Left = 603
  Top = 307
  Caption = 'Video Compare'
  ClientHeight = 543
  ClientWidth = 702
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  Scaled = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object splParams: TSplitter
    Left = 0
    Top = 498
    Width = 702
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 498
    Align = alClient
    TabOrder = 0
    OnResize = pnlTopResize
    object splFile: TSplitter
      Left = 193
      Top = 1
      Height = 496
    end
    object grpFile2: TGroupBox
      Left = 196
      Top = 1
      Width = 187
      Height = 496
      Align = alClient
      Caption = 'File 2'
      TabOrder = 0
      object dirEdtIn2: TJvDirectoryEdit
        Left = 2
        Top = 15
        Width = 183
        Height = 21
        Align = alTop
        TabOrder = 0
        Text = ''
        OnChange = dirEdtIn2Change
      end
      object flIn2: TFileListBox
        Left = 2
        Top = 36
        Width = 183
        Height = 458
        Align = alClient
        ItemHeight = 13
        Mask = 
          '*.webm;*.mkv;*.flv;*.flv;*.vob;*.ogv;*.mng;*.avi;*.MTS;*.M2TS;*.' +
          'TS;*.mov;*.qt;*.wmv;*.yuv;*.rm;*.rmvb;*.viv;*.asf;*.amv;*.mp4;*.' +
          'm4p;*.m4v;*.mpg;*.mp2;*.mpeg;*.mpe;*.mpv;*.mpg;*.mpeg;*.m2v;*.m4' +
          'v;*.svi;*.3gp;*.3g2;*.mxf;*.roq;*.nsv;*.flv*.f4v*.f4p*.f4a*.f4b;'
        TabOrder = 1
        OnChange = OnChange
      end
    end
    object grpFile1: TGroupBox
      Left = 1
      Top = 1
      Width = 192
      Height = 496
      Align = alLeft
      Caption = 'File 1'
      TabOrder = 1
      object dirEdtIn1: TJvDirectoryEdit
        Left = 2
        Top = 15
        Width = 188
        Height = 21
        Align = alTop
        TabOrder = 0
        Text = ''
        OnChange = dirEdtIn1Change
      end
      object flIn1: TFileListBox
        Left = 2
        Top = 36
        Width = 188
        Height = 458
        Align = alClient
        ItemHeight = 13
        Mask = 
          '*.webm;*.mkv;*.flv;*.flv;*.vob;*.ogv;*.mng;*.avi;*.MTS;*.M2TS;*.' +
          'TS;*.mov;*.qt;*.wmv;*.yuv;*.rm;*.rmvb;*.viv;*.asf;*.amv;*.mp4;*.' +
          'm4p;*.m4v;*.mpg;*.mp2;*.mpeg;*.mpe;*.mpv;*.mpg;*.mpeg;*.m2v;*.m4' +
          'v;*.svi;*.3gp;*.3g2;*.mxf;*.roq;*.nsv;*.flv*.f4v*.f4p*.f4a*.f4b;'
        TabOrder = 1
        OnChange = OnChange
      end
    end
    object pcMain: TPageControl
      Left = 383
      Top = 1
      Width = 318
      Height = 496
      ActivePage = tsDefault
      Align = alRight
      TabOrder = 2
      object tsDefault: TTabSheet
        Caption = 'Default'
        DesignSize = (
          310
          468)
        object chkHighDPI: TCheckBox
          Left = 187
          Top = 46
          Width = 75
          Height = 17
          Hint = 
            'Allow high DPI mode for e.g. displaying UHD content on Retina di' +
            'splays'
          Caption = 'High DPI'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = OnChange
        end
        object grpMode: TGroupBox
          Left = 81
          Top = 1
          Width = 78
          Height = 41
          Caption = 'Mode'
          TabOrder = 1
          DesignSize = (
            78
            41)
          object cbbMode: TComboBox
            Left = 3
            Top = 16
            Width = 73
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 0
            TabOrder = 0
            Text = 'Split'
            OnChange = OnChange
            OnKeyPress = BlockKeyPress
            Items.Strings = (
              'Split'
              'Vertical'
              'Horizontal')
          end
        end
        object chk10Bit: TCheckBox
          Left = 187
          Top = 63
          Width = 75
          Height = 17
          Hint = 
            'Increase bit depth to 10 bits per color component (Default=8 Bit' +
            ')'#13#10
          Caption = '10 Bit'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = OnChange
        end
        object grpDisplay: TGroupBox
          Left = 1
          Top = 1
          Width = 78
          Height = 41
          Hint = 'Open main window on specific display'
          Caption = 'Display'
          TabOrder = 3
          DesignSize = (
            78
            41)
          object cbbDisplay: TComboBox
            Left = 3
            Top = 16
            Width = 73
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = OnChange
            OnKeyPress = BlockKeyPress
          end
        end
        object grpAutoLoopMode: TGroupBox
          Left = 162
          Top = 1
          Width = 78
          Height = 41
          Caption = 'Loop Mode'
          TabOrder = 4
          DesignSize = (
            78
            41)
          object cbbAutoLoopMode: TComboBox
            Left = 3
            Top = 16
            Width = 73
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 0
            TabOrder = 0
            Text = 'Off'
            OnChange = OnChange
            OnKeyPress = BlockKeyPress
            Items.Strings = (
              'Off'
              'On'
              'Ping-Pong')
          end
        end
        object grpFrameBufferSize: TGroupBox
          Left = 242
          Top = 1
          Width = 68
          Height = 41
          Hint = 'Frame buffer size (Default=50)'#13#10
          Caption = 'Buffer Size'
          TabOrder = 5
          DesignSize = (
            68
            41)
          object edtFrameBufferSize: TEdit
            Left = 3
            Top = 16
            Width = 62
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = '50'
            OnChange = OnChange
            OnKeyDown = UnsignedKeyDown
            OnKeyPress = UnsignedKeyPress
          end
        end
        object rgWindow: TRadioGroup
          Left = 1
          Top = 42
          Width = 183
          Height = 62
          Caption = 'Window'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Default'
            'Custom'
            'Fit')
          TabOrder = 6
          OnClick = rgWindowClick
        end
        object pnlWindowSize: TPanel
          Left = 70
          Top = 77
          Width = 112
          Height = 25
          BevelOuter = bvNone
          TabOrder = 7
          object lblWindowSizeX: TLabel
            Left = 53
            Top = 6
            Width = 6
            Height = 13
            Caption = 'x'
            Enabled = False
          end
          object edtWidth: TEdit
            Left = 3
            Top = 2
            Width = 48
            Height = 21
            Enabled = False
            TabOrder = 0
            Text = '1280'
            OnKeyDown = UnsignedKeyDown
            OnKeyPress = UnsignedKeyPress
            OnKeyUp = edtWidthKeyUp
          end
          object edtHeight: TEdit
            Left = 62
            Top = 2
            Width = 48
            Height = 21
            Enabled = False
            TabOrder = 1
            Text = '1024'
            OnKeyDown = UnsignedKeyDown
            OnKeyPress = UnsignedKeyPress
            OnKeyUp = edtHeightKeyUp
          end
        end
        object btnLaunch: TButton
          Left = 0
          Top = 443
          Width = 310
          Height = 25
          Action = actLaunch
          Anchors = [akLeft, akBottom]
          TabOrder = 8
        end
        object chkAutoFilters: TCheckBox
          Left = 187
          Top = 80
          Width = 76
          Height = 17
          Caption = 'Auto Filters'
          Checked = True
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 9
          OnClick = OnChange
        end
        object grpWheelSensitivity: TGroupBox
          Left = 57
          Top = 105
          Width = 55
          Height = 41
          Hint = 'Mouse wheel sensitivity (Default is 1)'#13#10
          Caption = 'Wheel'
          TabOrder = 10
          DesignSize = (
            55
            41)
          object edtWheelSensitivity: TEdit
            Left = 3
            Top = 16
            Width = 49
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = '-1'
            OnChange = OnChange
            OnKeyDown = FloatKeyDown
            OnKeyPress = FloatKeyPress
          end
        end
        object grpShift: TGroupBox
          Left = 1
          Top = 105
          Width = 55
          Height = 41
          Hint = 
            'Shift the time stamps of the right video by a user-specified num' +
            'ber of seconds'#13#10
          Caption = 'Shift'
          TabOrder = 11
          DesignSize = (
            55
            41)
          object edtShift: TEdit
            Left = 3
            Top = 16
            Width = 49
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = '0'
            OnChange = OnChange
            OnKeyDown = FloatKeyDown
            OnKeyPress = FloatKeyPress
          end
        end
        object grpToneMapMode: TGroupBox
          Left = 114
          Top = 105
          Width = 95
          Height = 41
          Caption = 'Tone-Map Mode'
          TabOrder = 12
          DesignSize = (
            95
            41)
          object cbbToneMapMode: TComboBox
            Left = 3
            Top = 16
            Width = 90
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 0
            TabOrder = 0
            Text = 'Off'
            OnChange = OnChange
            OnClick = cbbToneMapModeClick
            OnKeyPress = BlockKeyPress
            Items.Strings = (
              'Off'
              'Full Range'
              'Relative')
          end
        end
        object grpPeakNits: TGroupBox
          Left = 210
          Top = 105
          Width = 100
          Height = 41
          Hint = 'Video peak luminance in nits (Default=100)'
          Caption = 'Peak Nits'
          TabOrder = 13
          DesignSize = (
            100
            41)
          object edtPeakNitsLeft: TEdit
            Left = 3
            Top = 16
            Width = 46
            Height = 21
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = '100'
            OnChange = OnChange
            OnKeyDown = UnsignedKeyDown
            OnKeyPress = UnsignedKeyPress
          end
          object edtPeakNitsRight: TEdit
            Left = 51
            Top = 16
            Width = 46
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Text = '100'
            OnChange = OnChange
            OnKeyDown = UnsignedKeyDown
            OnKeyPress = UnsignedKeyPress
          end
        end
        object grpBoostTone: TGroupBox
          Left = 1
          Top = 145
          Width = 71
          Height = 41
          Hint = 'Tone-mapping strength multiplicatior (Default=1)'
          Caption = 'Boost Tone'
          TabOrder = 14
          DesignSize = (
            71
            41)
          object edtBoostTone: TEdit
            Left = 3
            Top = 16
            Width = 65
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = '1'
            OnChange = OnChange
            OnKeyDown = FloatKeyDown
            OnKeyPress = FloatKeyPress
          end
        end
      end
      object tsAdvanced: TTabSheet
        Caption = 'Advanced'
        ImageIndex = 2
        object grpFilter: TGroupBox
          Left = 0
          Top = 0
          Width = 310
          Height = 63
          Align = alTop
          Caption = 'Filter'
          TabOrder = 0
          DesignSize = (
            310
            63)
          object lblFilterLeft: TLabel
            Left = 4
            Top = 21
            Width = 19
            Height = 13
            Caption = 'Left'
          end
          object lblFilterRight: TLabel
            Left = 4
            Top = 41
            Width = 25
            Height = 13
            Caption = 'Right'
          end
          object edtFilterLeft: TEdit
            Left = 32
            Top = 16
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = OnChange
          end
          object edtFilterRight: TEdit
            Left = 32
            Top = 38
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = OnChange
          end
        end
        object grpDecoder: TGroupBox
          Left = 0
          Top = 126
          Width = 310
          Height = 63
          Align = alTop
          Caption = 'Decoder'
          TabOrder = 1
          DesignSize = (
            310
            63)
          object lblDecoderLeft: TLabel
            Left = 4
            Top = 21
            Width = 19
            Height = 13
            Caption = 'Left'
          end
          object lblDecoderRight: TLabel
            Left = 4
            Top = 41
            Width = 25
            Height = 13
            Caption = 'Right'
          end
          object edtDecoderLeft: TEdit
            Left = 32
            Top = 16
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = OnChange
          end
          object edtDecoderRight: TEdit
            Left = 32
            Top = 38
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = OnChange
          end
        end
        object grpDemuxer: TGroupBox
          Left = 0
          Top = 63
          Width = 310
          Height = 63
          Align = alTop
          Caption = 'Demuxer'
          TabOrder = 2
          DesignSize = (
            310
            63)
          object lblDemuxerLeft: TLabel
            Left = 4
            Top = 21
            Width = 19
            Height = 13
            Caption = 'Left'
          end
          object lblDemuxerRight: TLabel
            Left = 4
            Top = 41
            Width = 25
            Height = 13
            Caption = 'Right'
          end
          object edtDemuxerLeft: TEdit
            Left = 32
            Top = 16
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = OnChange
          end
          object edtDemuxerRight: TEdit
            Left = 32
            Top = 38
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = OnChange
          end
        end
        object grpHardwareAcceleration: TGroupBox
          Left = 0
          Top = 189
          Width = 310
          Height = 63
          Align = alTop
          Caption = 'Hardware Acceleration'
          TabOrder = 3
          DesignSize = (
            310
            63)
          object lblHardwareAccelerationLeft: TLabel
            Left = 4
            Top = 21
            Width = 19
            Height = 13
            Caption = 'Left'
          end
          object lblHardwareAccelerationRight: TLabel
            Left = 4
            Top = 41
            Width = 25
            Height = 13
            Caption = 'Right'
          end
          object edtHardwareAccelerationLeft: TEdit
            Left = 32
            Top = 16
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = OnChange
          end
          object edtHardwareAccelerationRight: TEdit
            Left = 32
            Top = 38
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = OnChange
          end
        end
        object grplibvmafFilterOptions: TGroupBox
          Left = 0
          Top = 252
          Width = 310
          Height = 41
          Align = alTop
          Caption = 'libvmaf Filter Options'
          TabOrder = 4
          DesignSize = (
            310
            41)
          object edtlibvmafFilterOptions: TEdit
            Left = 4
            Top = 16
            Width = 302
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = OnChange
          end
        end
      end
      object tsHotKeys: TTabSheet
        Caption = 'HotKeys'
        ImageIndex = 1
        object lblHotKeys: TLabel
          Left = 0
          Top = 0
          Width = 310
          Height = 468
          Align = alClient
          Caption = 
            '- H: Toggle on-screen help text for controls'#13#10'- Space: Toggle pl' +
            'ay/pause'#13#10'- Comma `,`: Toggle bidirectional in-buffer loop/pause' +
            #13#10'- Period `.`: Toggle forward-only in-buffer loop/pause'#13#10'- Esca' +
            'pe: Quit'#13#10'- Down arrow: Seek 15 seconds backward'#13#10'- Left arrow: ' +
            'Seek 1 second backward'#13#10'- Page down: Seek 600 seconds backward'#13#10 +
            '- Up arrow: Seek 15 seconds forward'#13#10'- Right arrow: Seek 1 secon' +
            'd forward'#13#10'- Page up: Seek 600 seconds forward'#13#10'- J: Reduce play' +
            'back speed'#13#10'- L: Increase playback speed'#13#10'- S: Swap left and rig' +
            'ht video'#13#10'- A: Move to the previous frame in the buffer'#13#10'- D: Mo' +
            've to the next frame in the buffer'#13#10'--> Hold `SHIFT` to decode a' +
            'nd move to the next frame.'#13#10'- F: Save both frames as PNG images ' +
            'in the current directory'#13#10'- P: Print mouse position and pixel va' +
            'lue under cursor to console'#13#10'- M: Print image similarity metrics' +
            ' to console'#13#10'- Z: Magnify area around cursor (result in lower le' +
            'ft corner)'#13#10'- C: Magnify area around cursor (result in lower rig' +
            'ht corner)'#13#10'- R: Re-center and reset zoom to 100% (x1)'#13#10'- 1: Tog' +
            'gle hide/show left video'#13#10'- 2: Toggle hide/show right video'#13#10'- 3' +
            ': Toggle hide/show HUD'#13#10'- 5: Zoom 50% (x0.5)'#13#10'- 6: Zoom 100% (x1' +
            ')'#13#10'- 7: Zoom 200% (x2)'#13#10'- 8: Zoom 400% (x4)'#13#10'- 0: Toggle video/s' +
            'ubtraction mode'#13#10'- Plus `+`: Time-shift right video 1 frame forw' +
            'ard'#13#10'- Minus `-`: Time-shift right video 1 frame backward'#13#10'--> H' +
            'old `CTRL` for 10 or `ALT` for 100 Frames '#13#10#13#10'Use MouseWheel to ' +
            'Zoom, Pan by holding right mouse button.'
        end
      end
    end
  end
  object mmoParams: TMemo
    Left = 0
    Top = 501
    Width = 702
    Height = 42
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object actlstMain: TActionList
    Left = 22
    Top = 38
    object actLaunch: TAction
      Caption = '&Launch'
      OnExecute = actLaunchExecute
      OnUpdate = actLaunchUpdate
    end
  end
end
