object FrmVideoCompare: TFrmVideoCompare
  Left = 626
  Top = 178
  Caption = 'Video Compare'
  ClientHeight = 621
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
    Top = 576
    Width = 702
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 576
    Align = alClient
    TabOrder = 0
    OnResize = pnlTopResize
    object splFile: TSplitter
      Left = 193
      Top = 1
      Height = 574
    end
    object grpFile2: TGroupBox
      Left = 196
      Top = 1
      Width = 187
      Height = 574
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
        Height = 536
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
      Height = 574
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
        Height = 536
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
      Height = 574
      ActivePage = tsDefault
      Align = alRight
      TabOrder = 2
      object tsDefault: TTabSheet
        Caption = 'Default'
        DesignSize = (
          310
          546)
        object chkHighDPI: TCheckBox
          Left = 187
          Top = 131
          Width = 65
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
          Top = 88
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
          Left = 257
          Top = 131
          Width = 51
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
          Top = 88
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
          Top = 88
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
          Top = 88
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
          Top = 129
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
          Top = 164
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
          Top = 521
          Width = 310
          Height = 25
          Action = actLaunch
          Anchors = [akLeft, akBottom]
          TabOrder = 8
        end
        object chkAutoFilters: TCheckBox
          Left = 187
          Top = 179
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
          Top = 197
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
          Top = 197
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
          Left = 115
          Top = 197
          Width = 190
          Height = 41
          Caption = 'Tone-Map Mode'
          TabOrder = 12
          object cbbToneMapModeLeft: TComboBox
            Left = 3
            Top = 16
            Width = 90
            Height = 21
            ItemIndex = 0
            TabOrder = 0
            Text = 'Auto'
            OnChange = OnChange
            OnClick = cbbToneMapModeLeftClick
            OnKeyPress = BlockKeyPress
            Items.Strings = (
              'Auto'
              'Off'
              'Full Range'
              'Relative')
          end
          object cbbToneMapModeRight: TComboBox
            Left = 96
            Top = 16
            Width = 90
            Height = 21
            ItemIndex = 0
            TabOrder = 1
            Text = 'Auto'
            OnChange = OnChange
            OnClick = cbbToneMapModeLeftClick
            OnKeyPress = BlockKeyPress
            Items.Strings = (
              'Auto'
              'Off'
              'Full Range'
              'Relative')
          end
        end
        object grpPeakNits: TGroupBox
          Left = 1
          Top = 237
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
            Enabled = False
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
            Enabled = False
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
          Left = 104
          Top = 237
          Width = 142
          Height = 41
          Hint = 'Tone-mapping strength multiplicatior (Default=1)'
          Caption = 'Boost Tone'
          TabOrder = 14
          DesignSize = (
            142
            41)
          object edtBoostToneLeft: TEdit
            Left = 5
            Top = 18
            Width = 65
            Height = 21
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = '1'
            OnChange = OnChange
            OnKeyDown = FloatKeyDown
            OnKeyPress = FloatKeyPress
          end
          object edtBoostToneRight: TEdit
            Left = 73
            Top = 18
            Width = 65
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Text = '1'
            OnChange = OnChange
            OnKeyDown = FloatKeyDown
            OnKeyPress = FloatKeyPress
          end
        end
        object btnCreateShellLink: TButton
          Left = 1
          Top = 280
          Width = 154
          Height = 25
          Action = actCreateShellLink
          TabOrder = 15
        end
        object btnRemoveShellLink: TButton
          Left = 157
          Top = 280
          Width = 154
          Height = 25
          Action = actRemoveShellLink
          TabOrder = 16
        end
        object chkFastAlignment: TCheckBox
          Left = 187
          Top = 146
          Width = 93
          Height = 17
          Hint = 
            'Faster bilinear scaling for aligning input source resolutions, r' +
            'eplacing higher-quality bicubic interpolation when resolutions d' +
            'iffer'
          Caption = 'Fast Alignment'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          OnClick = OnChange
        end
        object chkBilinearTexture: TCheckBox
          Left = 187
          Top = 162
          Width = 96
          Height = 17
          Hint = 
            'Bilinear video texture interpolation, replacing nearest-neighbor' +
            ' filtering'
          Caption = 'Bilinear Texture'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
          OnClick = OnChange
        end
        object grpSelectionMode: TGroupBox
          Left = 1
          Top = 0
          Width = 306
          Height = 87
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Selection Mode'
          TabOrder = 19
          object rbSelectionModeDefault: TRadioButton
            Left = 10
            Top = 20
            Width = 59
            Height = 17
            Caption = 'Default'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rbSelectionModeClick
          end
          object rbSelectionModeExtension: TRadioButton
            Left = 72
            Top = 20
            Width = 71
            Height = 17
            Caption = 'Extension'
            TabOrder = 1
            OnClick = rbSelectionModeClick
          end
          object rbSelectionModePrefix: TRadioButton
            Left = 146
            Top = 20
            Width = 52
            Height = 17
            Caption = 'Prefix'
            TabOrder = 2
            OnClick = rbSelectionModeClick
          end
          object rbSelectionModeSuffix: TRadioButton
            Left = 202
            Top = 20
            Width = 53
            Height = 17
            Caption = 'Suffix'
            TabOrder = 3
            OnClick = rbSelectionModeClick
          end
          object rbSelectionModeID: TRadioButton
            Left = 72
            Top = 40
            Width = 35
            Height = 17
            Caption = 'ID'
            TabOrder = 4
            OnClick = rbSelectionModeClick
          end
          object rbSelectionModeName: TRadioButton
            Left = 10
            Top = 40
            Width = 50
            Height = 17
            Caption = 'Name'
            TabOrder = 5
            OnClick = rbSelectionModeClick
          end
          object edtSelectionModeText: TEdit
            Left = 10
            Top = 60
            Width = 293
            Height = 21
            TabOrder = 6
            OnChange = edtSelectionModeTextChange
          end
        end
      end
      object tsAdvanced: TTabSheet
        Caption = 'Advanced'
        ImageIndex = 2
        object grplibvmafFilterOptions: TGroupBox
          Left = 0
          Top = 504
          Width = 310
          Height = 41
          Align = alTop
          Caption = 'libvmaf Filter Options'
          TabOrder = 0
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
        object grpFilter: TGroupBox
          Left = 0
          Top = 0
          Width = 310
          Height = 85
          Hint = 
            'Specify a comma-separated list of FFmpeg filters (e.g. scale=192' +
            '0:-2,delogo=x=10:y=10:w=100:h=70)'
          Align = alTop
          Caption = 'Filter'
          TabOrder = 1
          DesignSize = (
            310
            85)
          object edtFilterBoth: TLabeledEdit
            Left = 32
            Top = 16
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 22
            EditLabel.Height = 13
            EditLabel.Caption = 'Both'
            LabelPosition = lpLeft
            TabOrder = 2
            OnChange = OnChange
          end
          object edtFilterLeft: TLabeledEdit
            Left = 32
            Top = 38
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 19
            EditLabel.Height = 13
            EditLabel.Caption = 'Left'
            LabelPosition = lpLeft
            TabOrder = 0
            OnChange = OnChange
          end
          object edtFilterRight: TLabeledEdit
            Left = 32
            Top = 60
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 25
            EditLabel.Height = 13
            EditLabel.Caption = 'Right'
            LabelPosition = lpLeft
            TabOrder = 1
            OnChange = OnChange
          end
        end
        object grpDecoder: TGroupBox
          Left = 0
          Top = 170
          Width = 310
          Height = 85
          Hint = 
            'FFmpeg video decoder name, specified as [type?][:options?] (e.g.' +
            ' '#39':strict=unofficial'#39', '#39':strict=-2'#39' or '#39'vvc:strict=experimental'#39 +
            ')'
          Align = alTop
          Caption = 'Decoder'
          TabOrder = 2
          DesignSize = (
            310
            85)
          object edtDecoderBoth: TLabeledEdit
            Left = 32
            Top = 16
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 22
            EditLabel.Height = 13
            EditLabel.Caption = 'Both'
            LabelPosition = lpLeft
            TabOrder = 2
            OnChange = OnChange
          end
          object edtDecoderLeft: TLabeledEdit
            Left = 32
            Top = 38
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 19
            EditLabel.Height = 13
            EditLabel.Caption = 'Left'
            LabelPosition = lpLeft
            TabOrder = 0
            OnChange = OnChange
          end
          object edtDecoderRight: TLabeledEdit
            Left = 32
            Top = 60
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 25
            EditLabel.Height = 13
            EditLabel.Caption = 'Right'
            LabelPosition = lpLeft
            TabOrder = 1
            OnChange = OnChange
          end
        end
        object grpDemuxer: TGroupBox
          Left = 0
          Top = 85
          Width = 310
          Height = 85
          Hint = 
            'FFmpeg video demuxer name specified as [type?][:options?] (e.g. ' +
            #39'rawvideo:pixel_format=rgb24,video_size=320x240,framerate=10'#39')'
          Align = alTop
          Caption = 'Demuxer'
          TabOrder = 3
          DesignSize = (
            310
            85)
          object edtDemuxerBoth: TLabeledEdit
            Left = 32
            Top = 16
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 22
            EditLabel.Height = 13
            EditLabel.Caption = 'Both'
            LabelPosition = lpLeft
            TabOrder = 2
            OnChange = OnChange
          end
          object edtDemuxerLeft: TLabeledEdit
            Left = 32
            Top = 38
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 19
            EditLabel.Height = 13
            EditLabel.Caption = 'Left'
            LabelPosition = lpLeft
            TabOrder = 0
            OnChange = OnChange
          end
          object edtDemuxerRight: TLabeledEdit
            Left = 32
            Top = 60
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 25
            EditLabel.Height = 13
            EditLabel.Caption = 'Right'
            LabelPosition = lpLeft
            TabOrder = 1
            OnChange = OnChange
          end
        end
        object grpHardwareAcceleration: TGroupBox
          Left = 0
          Top = 255
          Width = 310
          Height = 85
          Hint = 
            'FFmpeg video hardware acceleration, specified as [type][:device?' +
            '[:options?]] (e.g. '#39'videotoolbox'#39' or '#39'vaapi:/dev/dri/renderD128'#39 +
            ')'
          Align = alTop
          Caption = 'Hardware Acceleration'
          TabOrder = 4
          DesignSize = (
            310
            85)
          object edtHardwareAccelerationBoth: TLabeledEdit
            Left = 32
            Top = 16
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 22
            EditLabel.Height = 13
            EditLabel.Caption = 'Both'
            LabelPosition = lpLeft
            TabOrder = 2
            OnChange = OnChange
          end
          object edtHardwareAccelerationLeft: TLabeledEdit
            Left = 32
            Top = 38
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 19
            EditLabel.Height = 13
            EditLabel.Caption = 'Left'
            LabelPosition = lpLeft
            TabOrder = 0
            OnChange = OnChange
          end
          object edtHardwareAccelerationRight: TLabeledEdit
            Left = 32
            Top = 60
            Width = 275
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 25
            EditLabel.Height = 13
            EditLabel.Caption = 'Right'
            LabelPosition = lpLeft
            TabOrder = 1
            OnChange = OnChange
          end
        end
        object grpColorSpace: TGroupBox
          Left = 0
          Top = 340
          Width = 310
          Height = 41
          Hint = 
            'Color space matrix, specified as [matrix] for the same on both s' +
            'ides, or [l-matrix?]:[r-matrix?] for different values (e.g. '#39'bt7' +
            '09'#39' or '#39'bt2020nc:'#39')'
          Align = alTop
          Caption = 'Color Space'
          TabOrder = 5
          DesignSize = (
            310
            41)
          object edtColorSpace: TEdit
            Left = 4
            Top = 16
            Width = 302
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = OnChange
          end
        end
        object grpColorRange: TGroupBox
          Left = 0
          Top = 381
          Width = 310
          Height = 41
          Hint = 
            'Color range specified as [range] for the same on both sides, or ' +
            '[l-range?]:[r-range?] for different values (e.g. '#39'tv'#39', '#39':pc'#39' or ' +
            #39'pc:tv'#39')'
          Align = alTop
          Caption = 'Color Range'
          TabOrder = 6
          DesignSize = (
            310
            41)
          object edtColorRange: TEdit
            Left = 4
            Top = 16
            Width = 302
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = OnChange
          end
        end
        object grpColorPrimaries: TGroupBox
          Left = 0
          Top = 422
          Width = 310
          Height = 41
          Hint = 
            'Color primaries specified as [primaries] for the same on both si' +
            'des, or [l-primaries?]:[r-primaries?] for different values (e.g.' +
            ' '#39'bt709'#39' or '#39'bt2020:bt709'#39')'
          Align = alTop
          Caption = 'Color Primaries'
          TabOrder = 7
          DesignSize = (
            310
            41)
          object edtColorPrimaries: TEdit
            Left = 4
            Top = 16
            Width = 302
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = OnChange
          end
        end
        object grpColorTRC: TGroupBox
          Left = 0
          Top = 463
          Width = 310
          Height = 41
          Hint = 
            'Transfer characteristics (transfer curve), specified as [trc] fo' +
            'r the same on both sides, or [l-trc?]:[r-trc?] for different val' +
            'ues (e.g. '#39'bt709'#39' or '#39'smpte2084:'#39')'
          Align = alTop
          Caption = 'Color TRC'
          TabOrder = 8
          DesignSize = (
            310
            41)
          object edtColorTRC: TEdit
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
          Height = 546
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
    Top = 579
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
    object actCreateShellLink: TAction
      Caption = 'Create SendTo-ShortCut'
      OnExecute = actCreateShellLinkExecute
    end
    object actRemoveShellLink: TAction
      Caption = 'Remove SendTo-ShortCut'
      OnExecute = actRemoveShellLinkExecute
      OnUpdate = actRemoveShellLinkUpdate
    end
  end
end
