unit informe;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, PrintersDlgs, LR_DBSet, LR_Class, LR_Desgn,
    Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons,
    Grids, ValEdit, utilidades_usuarios, LR_DSet;

type

    { Tform_Informe }

    Tform_Informe = class(TForm)
        BitBtn_Imprimir: TBitBtn;
        BitBtn_Design: TBitBtn;
        BitBtn_VPrevia: TBitBtn;
        frDBDataSet_Detalle_2: TfrDBDataSet;
        frDBDataSet_Detalle_3: TfrDBDataSet;
        frDBDataSet_Maestro: TfrDBDataSet;
        frDBDataSet_Detalle: TfrDBDataSet;
        frDesigner1: TfrDesigner;
        frReport1: TfrReport;
        Label46: TLabel;
        LabeledEdit_Copias: TLabeledEdit;
        ListBox_a_Listar_Visible_NO: TListBox;
        ListBox_a_Listar_Visible_SI: TListBox;
        PrintDialog1: TPrintDialog;
        SALIR: TBitBtn;
        UpDown2: TUpDown;

        procedure BitBtn_DesignClick(Sender: TObject);
        procedure BitBtn_ImprimirClick(Sender: TObject);
        procedure BitBtn_VPreviaClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure frReport1EnterRect(Memo: TStringList; View: TfrView);
        procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
        procedure SALIRClick(Sender: TObject);
    private
        { private declarations }
        private_Salir_OK : Boolean;
    public
        { public declarations }
        public_Ordenado_por   : String;
        public_Menu_Worked    : Integer;
        public_id_empresas    : String;
        public_opcion         : ShortInt;
        public_Impuesto_Comun : String;
    end;

var
    form_Informe: Tform_Informe;

implementation

{$R *.lfm}

uses menu;

{ Tform_Informe }

procedure Tform_Informe.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la contra** //
        // ** seña                                                                                ** //
        // ***************************************************************************************** //
       if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_Informe.BitBtn_DesignClick(Sender: TObject);
begin
    public_opcion := 2;
    SALIRClick(Nil);
end;

procedure Tform_Informe.BitBtn_VPreviaClick(Sender: TObject);
begin
    public_opcion := 1;
    SALIRClick(Nil);
end;

procedure Tform_Informe.FormActivate(Sender: TObject);
begin
    if ListBox_a_Listar_Visible_SI.Items.Count > 0 then
    begin
        ListBox_a_Listar_Visible_SI.ItemIndex := 0;
    end;
end;

procedure Tform_Informe.FormCreate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Obligado en cada formulario para no olvidarlo                                           ** //
    // ********************************************************************************************* //
    with Self do
    begin
        Color       := $00C2C29E;
        Position    := poScreenCenter;
        BorderIcons := [];
        BorderStyle := bsSingle;
    end;

    private_Salir_OK := false;

    // ********************************************************************************************* //
    // ** Solo para este form                                                                     ** //
    // ********************************************************************************************* //
    public_Ordenado_por := '';
    public_id_empresas  := '';
    public_opcion       := 0;
end;

procedure Tform_Informe.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
    if ParName = 'Orden' then
    begin
        ParValue := public_Ordenado_por;
    end;

    if ParName = 'Impuesto_Comun' then
    begin
        ParValue := public_Impuesto_Comun;
    end;
end;

procedure Tform_Informe.SALIRClick(Sender: TObject);
begin
     private_Salir_OK := true;  { La pongo a true para controlar el modo de salir del programa}

     Close;
end;

procedure Tform_Informe.BitBtn_ImprimirClick(Sender: TObject);
var var_DesdePagina  : Integer;
    var_HastaPagina  : Integer;
    Var_Ctdad_Copias : Integer;
    var_Impresora    : Integer;
    Collap           : Boolean;
begin
    public_opcion := 3;
    SALIRClick(Nil);
end;

procedure Tform_Informe.frReport1EnterRect(Memo: TStringList; View: TfrView);
var var_picture     : TPicture;
    var_PictureView : TfrPictureView;
    var_logo        : String;
    var_Info        : TSearchRec;
begin
    if Memo.Count = 0 then
    begin
        Exit;
    end;

    if (Memo[0] = 'Logo') and (View is TfrPictureView) then
    begin
        var_PictureView := View as TfrPictureView;
        var_picture     := TPicture.Create;

        try
          var_picture.Bitmap.Width  := Round(var_PictureView.Width);
          var_picture.Bitmap.Height := Round(var_PictureView.Height);

          var_picture.LoadFromFile(form_menu.public_path_imgs_socger + 'logo_socger.jpg');

        { ver ejemplo de C:\lazarus\components\tachart\demo\lazreport\lazreportdemo.lpi

          Chart1.PaintOnCanvas( var_picture.Canvas,
                                Rect(0, 0, var_picture.Width, var_picture.Height) ); }

          var_PictureView.Picture.Bitmap.Assign(var_picture.Bitmap);
        finally
          var_picture.Free;
        end;
    end;

    if Trim(public_id_empresas) <> '' then
    begin
        if (Memo[0] = 'LogoEmpresa') and (View is TfrPictureView) then
        begin
            var_PictureView := View as TfrPictureView;
            var_picture     := TPicture.Create;

            try
              var_picture.Bitmap.Width  := Round(var_PictureView.Width);
              var_picture.Bitmap.Height := Round(var_PictureView.Height);

              var_logo := form_menu.public_path_empresas_logos + Trim(public_id_empresas);

              If FindFirst( var_logo + '.*',
                            faAnyFile and faDirectory,
                            var_Info ) = 0 then
              begin
                  var_picture.LoadFromFile( form_menu.public_path_empresas_logos + var_Info.Name );
              end;

              var_PictureView.Picture.Bitmap.Assign(var_picture.Bitmap);
            finally
              var_picture.Free;
            end;
        end;
    end;
end;

end.

