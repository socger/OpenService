unit articulos_familias_001;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls, Buttons,
    utilidades_bd, utilidades_general, utilidades_rgtro, utilidades_forms_Filtrar, variants, Grids,
    utilidades_contabilidad, utilidades_usuarios, ComCtrls, StdCtrls, DbCtrls, DBGrids, sqldb,
    LCLTranslator, utilidades_datos_tablas;

resourcestring
  rs_FormClose_1 = '* La descripción.';
  rs_FormClose_2 = '* Visualizar en terminales. ¿Si/no?.';
  rs_FormClose_3 = '* Ventas por peso. ¿Si/no?.';
  rs_FormClose_5 = 'LA CUENTA CONTABLE DE VENTAS';
  rs_FormClose_6 = 'LA CUENTA CONTABLE DE COMPRAS';

  rs_Continuamos = '¿CONTINUAMOS?';

  rs_Continuar_1 = 'Este proceso asigna los descuentos a todos los artículos que componen esta Familia.';
  rs_Continuar_2 = 'Este proceso asigna el mismo tipo de beneficio a todos los artículos que componen esta Familia.';
  rs_Continuar_3 = 'Este proceso actualiza las Tarifas según el beneficio asignado a todos los artículos que componen esta Familia.';

  rs_Existe_Tarifa_Ya_1 = 'Error al comprobar si la tarifa existe ya para el tipo de artículos.';
  rs_Existe_Tarifa_Ya_2 = 'La tabla ha sido ';
  rs_Existe_Tarifa_Ya_3 = ' desde el módulo ';

  rs_Existe_SubFamilia_Ya_1 = 'Error al comprobar si la subfamilia existe ya para la familia de';
  rs_Existe_SubFamilia_Ya_2 = ' artículos. La tabla ha sido ';
  rs_Existe_SubFamilia_Ya_3 = ' desde el módulo ';

  rs_Existe_Terminal_Ya_1 = 'Error al comprobar si la terminal existe ya para la familia de';
  rs_Existe_Terminal_Ya_2 = ' articulos. La tabla ha sido ';
  rs_Existe_Terminal_Ya_3 = ' desde el módulo ';

  rs_aFcS_2_1 = 'Error al CREAR la subfamilia ';
  rs_aFcS_2_2 = ' para el tipo ';
  rs_aFcS_2_3 = '. La tabla ha sido ';
  rs_aFcS_2_4 = ' desde el módulo ';

  rs_cSFyGeHsC_1 = 'No se pudo grabar el histórico de los cambios';
  rs_cSFyGeHsC_2 = ' realizados al añadir al tipo ';
  rs_cSFyGeHsC_3 = ' la subfamilia ';

  rs_error = 'ERROR ... ';

  rs_Quitamos_1 = '¿QUITAMOS la FAMILIA SUPERIOR a la que pertenece';
  rs_Quitamos_2 = '¿QUITAMOS el GRUPO DE COCINA al que pertenece';
  rs_Quitamos_3 = '¿QUITAMOS la IMPRESORA DE COMANDAS?';
  rs_Quitamos_4 = '¿Seguro que desea quitarla como subfamilia de ';

  rs_Elegir_Familia_1 = 'Elija una familia para convertirla';
  rs_Elegir_Familia_2 = 'en familia superior';

  rs_avisamos = 'AVISAMOS DE ... ';

  rs_Editar_Registro_Tarifas_1 = 'Tarifa repetida.';

  rs_Editar_Registro_Terminales_1 = 'Terminal repetido.';

  rs_Asignar_Familia_como_SubFamilia_1 = 'Subfamilia repetida.';

type

    { Tform_articulos_familias_001 }

    Tform_articulos_familias_001 = class(TForm)
        BitBtn_Act_Tarifas: TBitBtn;
        BitBtn_Asignar_Beneficios: TBitBtn;
        BitBtn_Asignar_Descuentos: TBitBtn;
        BitBtn_Ver_Situacion_Registro_SubFamilias: TBitBtn;
        BitBtn_Ver_Situacion_Registro_Tarifas: TBitBtn;
        BitBtn_Ver_Situacion_Registro_Terminales: TBitBtn;
        Boton_Elegir_Familia_Superior: TBitBtn;
        Boton_Elegir_Impresora: TBitBtn;
        Boton_Elegir_Provincia1: TBitBtn;
        Boton_Grupo_Cocina: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DBCheckBox_Vencimientos_automaticos_SN: TDBCheckBox;
        DBCheckBox_Ventas_por_peso: TDBCheckBox;
        DBEdit_Comision: TDBEdit;
        DBEdit_Descripcion: TDBEdit;
        DBEdit_Cuenta_Contable_Ventas: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        DBEdit_Cuenta_Contable_Compras: TDBEdit;
        DBEdit_Minima_Variacion: TDBEdit;
        DBGrid_Tarifas: TDBGrid;
        DBGrid_SubFamilias: TDBGrid;
        DBGrid_Terminales: TDBGrid;
        DBNavigator_SubFamilias: TDBNavigator;
        DBNavigator_Tarifas: TDBNavigator;
        DBNavigator_Terminales: TDBNavigator;
        DBRadioGroup_Aplicar_Beneficio_en: TDBRadioGroup;
        Edit_Descripcion_Familia_Superior: TEdit;
        Edit_Descripcion_Grupo_Cocina: TEdit;
        Edit_Descripcion_Impresora_comandas: TEdit;
        GroupBox_Cocina: TGroupBox;
        GroupBox11: TGroupBox;
        GroupBox_Cuentas_Contables: TGroupBox;
        Label1: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label17: TLabel;
        Label18: TLabel;
        Label19: TLabel;
        Label50: TLabel;
        Label51: TLabel;
        Label52: TLabel;
        Label53: TLabel;
        Label54: TLabel;
        Label62: TLabel;
        PageControl_Otros_Datos: TPageControl;
        Panel1: TPanel;
        Panel_Terminales: TPanel;
        Panel_Tarifas: TPanel;
        RadioGroup_Bajas: TRadioGroup;
        TabSheet_SubFamilias: TTabSheet;
        TabSheet_Tarifas: TTabSheet;
        TabSheet_Terminales: TTabSheet;

        procedure Validacion( param_msg : TStrings );
        procedure Editar_Registro_Tarifas;
        procedure Editar_Registro_Terminales;
        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure Boton_Elegir_ImpresoraClick(Sender: TObject);
        procedure Boton_Grupo_CocinaClick(Sender: TObject);
        procedure Cauto_SubFamilia_Y_Guardo_en_Historico_sus_Cambios( param_id_articulos_familias, param_Id, param_descripcion : ShortString );
        procedure Edit_Descripcion_Grupo_CocinaClick(Sender: TObject);
        procedure Edit_Descripcion_Impresora_comandasClick(Sender: TObject);
        procedure para_Empezar;
        function  Elegir_Familia(param_familia : ShortString) : TRecord_Rgtro_Comun;
        procedure BitBtn_Asignar_DescuentosClick(Sender: TObject);
        procedure BitBtn_Asignar_BeneficiosClick(Sender: TObject);
        procedure BitBtn_Act_TarifasClick(Sender: TObject);
        procedure Boton_Elegir_Familia_SuperiorClick(Sender: TObject);
        procedure Edit_Descripcion_Familia_SuperiorClick(Sender: TObject);
        function  Existe_Tarifa_Ya( param_id, param_id_articulos_familias, param_id_tarifas : ShortString ) : Trecord_Existe;
        function  Existe_Terminal_Ya( param_id, param_id_articulos_familias, param_id_terminales : ShortString ) : Trecord_Existe;
        function  Existe_SubFamilia_Ya( param_id, param_id_articulos_familias : ShortString ) : Trecord_Existe;
        procedure Asignar_Familia_como_SubFamilia;
        function  Asignar_Familia_como_SubFamilia_2( param_id, param_articulos_Familias : ShortString ) : Boolean;
        procedure Quitar_SubFamilia_de_Familia;
        procedure BitBtn_Ver_Situacion_Registro_SubFamiliasClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_Registro_TarifasClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_Registro_TerminalesClick(Sender: TObject);
        procedure DBGrid_SubFamiliasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_TarifasDblClick(Sender: TObject);
        procedure DBGrid_TarifasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_TarifasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_TerminalesDblClick(Sender: TObject);
        procedure DBGrid_TerminalesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_TerminalesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator_SubFamiliasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure DBNavigator_TarifasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure DBNavigator_TerminalesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure Refrescar_Registros;
        procedure Presentar_Datos;
        procedure no_Tocar;
        procedure CancelButtonClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure OKButtonClick(Sender: TObject);
    private
        { private declarations }
        private_Salir_OK : Boolean;
    public
        { public declarations }
        public_Solo_Ver      : Boolean;
        public_Menu_Worked   : Integer;
        public_Pulso_Aceptar : Boolean;
        public_Record_Rgtro  : TRecord_Rgtro_Comun;
    end;

var
    form_articulos_familias_001: Tform_articulos_familias_001;

implementation

{$R *.lfm}

uses dm_articulos_familias, menu, articulos_familias_000, articulos_familias_002,
     articulos_familias_003, articulos_familias_005;

{ Tform_articulos_familias_001 }

procedure Tform_articulos_familias_001.Validacion( param_msg : TStrings );
begin
    with form_articulos_familias_000.SQLQuery_Articulos_Familias do
    begin
        if Trim(FieldByName('descripcion').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_1);
        end;

        if Trim(FieldByName('Visualizar_en_terminales_SN').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_2);
        end;

        if Trim(FieldByName('Ventas_por_peso_SN').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_3);
        end;

        form_Menu.Traer_Configuracion_APP;

        UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Articulos_Familias_Ventas_Obligar_Cuenta_Contable_SN, //.... aqui tambien permitir el control de exigirlo o no
                                       param_msg,
                                       form_articulos_familias_000.SQLQuery_Articulos_Familias,
                                       '',
                                       'articulos_familias',
                                       'Cuenta_Contable_Ventas',
                                       rs_FormClose_5 );

        UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Articulos_Familias_Compras_Obligar_Cuenta_Contable_SN, //.... aqui tambien permitir el control de exigirlo o no
                                       param_msg,
                                       form_articulos_familias_000.SQLQuery_Articulos_Familias,
                                       '',
                                       'articulos_familias',
                                       'Cuenta_Contable_Compras',
                                       rs_FormClose_6 );
    end;
end;

procedure Tform_articulos_familias_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        Validacion( var_msg );
    end;

    if private_Salir_OK = False then
    begin
      { ********************************************************************
        Intento BitBtn_SALIR de la aplicación de un modo no permitido.
        ********************************************************************
        Pero si desde el menu principal está a true la variable
        public_Salir_Ok, significa que hay que salir si o si pues se pulsó
        cancelar al preguntar otra vez por la contraseña
        ******************************************************************** }
        if form_Menu.public_Salir_OK = False then CloseAction := TCloseAction.caNone;
    end else begin
      { ********************************************************************
        Fue correcto el modo como quiere salir de la aplicación
        ********************************************************************
        Comprobaremos si no se generó algún error por falta de completar
        algun campo y si se salió con el botón Ok o Cancel
        ******************************************************************** }
        if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            // var_msg.Free;
            CloseAction := TCloseAction.caNone;
        end else begin
            // var_msg.Free;
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_articulos_familias_001.FormCreate(Sender: TObject);
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
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    public_Solo_Ver := false;

    // ********************************************************************************************* //
    // ** Solo para este formulario                                                               ** //
    // ********************************************************************************************* //
    GroupBox_Cocina.Visible := false;
    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Trabajar_Grupos_Cocina_SN)) = 'S' then
    begin
        GroupBox_Cocina.Visible := true;
    end;
end;

procedure Tform_articulos_familias_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_articulos_familias_000.SQLQuery_Articulos_Familias do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('descripcion').AsString,
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;

  { ****************************************************************************
    SOLO PARA ESTE FORM
    **************************************************************************** }
    PageControl_Otros_Datos.ActivePage := TabSheet_Tarifas;
end;

procedure Tform_articulos_familias_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_articulos_familias_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_articulos_familias_001.Refrescar_Registros;
begin
    form_articulos_familias_000.Refrescar_Registros_Terminales;
    form_articulos_familias_000.Refrescar_Registros_Tarifas;
    form_articulos_familias_000.Refrescar_Registros_SubFamilias;
end;

procedure Tform_articulos_familias_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_articulos_familias_001.BitBtn_Ver_Situacion_Registro_TarifasClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_familias_000.SQLQuery_Articulos_Familias_Tarifas.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_familias_tarifas',
                                           form_articulos_familias_000.SQLQuery_Articulos_Familias_Tarifas,
                                           form_articulos_familias_000.DataSource_ArtFam_Tarifas,
                                           DBGrid_Tarifas );
        end;
    end;
end;

procedure Tform_articulos_familias_001.BitBtn_Ver_Situacion_Registro_TerminalesClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_familias_000.SQLQuery_Articulos_Familias_Terminales.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_familias_terminales',
                                           form_articulos_familias_000.SQLQuery_Articulos_Familias_Terminales,
                                           form_articulos_familias_000.DataSource_ArtFam_Terminales,
                                           DBGrid_Terminales );
        end;
    end;
end;

procedure Tform_articulos_familias_001.BitBtn_Ver_Situacion_Registro_SubFamiliasClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_familias_000.SQLQuery_Articulos_Familias_SubFamilias.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_familias',
                                           form_articulos_familias_000.SQLQuery_Articulos_Familias_SubFamilias,
                                           form_articulos_familias_000.DataSource_ArtFam_SubFamilias,
                                           DBGrid_SubFamilias );
        end;
    end;
end;

procedure Tform_articulos_familias_001.Presentar_Datos;
begin
    with form_articulos_familias_000.SQLQuery_Articulos_Familias do
    begin
         Edit_Descripcion_Familia_Superior.Text   := FieldByName('OT_descripcion_familia_superior').AsString;
         Edit_Descripcion_Grupo_Cocina.Text       := FieldByName('OT_descripcion_grupo_cocina').AsString;
         Edit_Descripcion_Impresora_comandas.Text := FieldByName('OT_descripcion_impresora_comandas').AsString;
    end;
end;

procedure Tform_articulos_familias_001.DBGrid_TarifasDblClick(Sender: TObject);
begin
    Editar_Registro_Tarifas;
end;

procedure Tform_articulos_familias_001.DBGrid_TerminalesDblClick(Sender: TObject);
begin
    Editar_Registro_Terminales;
end;

procedure Tform_articulos_familias_001.DBGrid_TarifasDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_familias_000.SQLQuery_Articulos_Familias_Tarifas.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_familias_000.SQLQuery_Articulos_Familias_Tarifas.FieldByName('Del_WHEN').IsNull then
            begin
              { ****************************************************************
                Registro DADO de BAJA
                **************************************************************** }
                Canvas.Font.Color := clSilver;
            end
        else
            begin
              { ****************************************************************
                Registro DADO de ALTA, NO BAJA
                ****************************************************************
                Así que las pinto, pero sólo si no son las columnas que van a
                ser dibujadas
                **************************************************************** }
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

      { ************************************************************************
        Ahora paso a dibujar una celda normal con los colores elegidos o una
        dibujada
        ************************************************************************ }
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
              { ****************************************************************
                No es una de las columnas a dibujar por lo que la pinto con los
                colores elegidos
                **************************************************************** }
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
              { ****************************************************************
                Es una de las columnas a dibujar
                **************************************************************** }
                // COLUMNA CONFIRMADA
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    {
                    if Trim(form_articulos_familias_000.SQLQuery_Articulos_Familias_Tarifas.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_familias_001.DBGrid_TerminalesDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_familias_000.SQLQuery_Articulos_Familias_Terminales.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_familias_000.SQLQuery_Articulos_Familias_Terminales.FieldByName('Del_WHEN').IsNull then
            begin
              { ****************************************************************
                Registro DADO de BAJA
                **************************************************************** }
                Canvas.Font.Color := clSilver;
            end
        else
            begin
              { ****************************************************************
                Registro DADO de ALTA, NO BAJA
                ****************************************************************
                Así que las pinto, pero sólo si no son las columnas que van a
                ser dibujadas
                **************************************************************** }
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

      { ************************************************************************
        Ahora paso a dibujar una celda normal con los colores elegidos o una
        dibujada
        ************************************************************************ }
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
              { ****************************************************************
                No es una de las columnas a dibujar por lo que la pinto con los
                colores elegidos
                **************************************************************** }
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
              { ****************************************************************
                Es una de las columnas a dibujar
                **************************************************************** }
                // COLUMNA CONFIRMADA
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    {
                    if Trim(form_articulos_familias_000.SQLQuery_Articulos_Familias_Terminales.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_familias_001.DBGrid_SubFamiliasDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_familias_000.SQLQuery_Articulos_Familias_SubFamilias.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_familias_000.SQLQuery_Articulos_Familias_SubFamilias.FieldByName('Del_WHEN').IsNull then
            begin
              { ****************************************************************
                Registro DADO de BAJA
                **************************************************************** }
                Canvas.Font.Color := clSilver;
            end
        else
            begin
              { ****************************************************************
                Registro DADO de ALTA, NO BAJA
                ****************************************************************
                Así que las pinto, pero sólo si no son las columnas que van a
                ser dibujadas
                **************************************************************** }
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

      { ************************************************************************
        Ahora paso a dibujar una celda normal con los colores elegidos o una
        dibujada
        ************************************************************************ }
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
              { ****************************************************************
                No es una de las columnas a dibujar por lo que la pinto con los
                colores elegidos
                **************************************************************** }
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
              { ****************************************************************
                Es una de las columnas a dibujar
                **************************************************************** }
                // COLUMNA CONFIRMADA
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    {
                    if Trim(form_articulos_familias_000.SQLQuery_Articulos_Familias_SubFamilias.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_familias_001.DBGrid_TarifasKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Tarifas;
end;

procedure Tform_articulos_familias_001.DBGrid_TerminalesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Terminales;
end;

procedure Tform_articulos_familias_001.DBNavigator_TarifasBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            // ************************************************************************************* //
            // ** No hace falta insertar porque se insertan automáticamente en el momento que se  ** //
            // ** crea una nueva tarifa, incluso cuando se borra la tarifa, también se borra auto-** //
            // ** máticamente en familias de articulos y articulos                                ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Tarifas;
            Abort;
        end;

        nbDelete : begin
            // ************************************************************************************* //
            // ** No hace falta borrar porque se borran automáticamente en el momento se borra la ** //
            // ** tarifa, desde el mantenimiento de tarifas                                       ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbRefresh : begin
            form_articulos_familias_000.Refrescar_Registros_Tarifas;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_familias_001.DBNavigator_TerminalesBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            // ************************************************************************************* //
            // ** No hace falta insertar porque se insertan automáticamente en el momento que se  ** //
            // ** crea una nueva terminal, incluso cuando se borra la terminal, también se borra  ** //
            // automáticamente en familias de articulos y articulos                               ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Terminales;
            Abort;
        end;

        nbDelete : begin
            // ************************************************************************************* //
            // ** No hace falta borrar porque se borran automáticamente en el momento se borra la ** //
            // ** terminal, desde el mantenimiento de terminales                                  ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbRefresh : begin
            form_articulos_familias_000.Refrescar_Registros_Terminales;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_familias_001.DBNavigator_SubFamiliasBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Asignar_Familia_como_SubFamilia;
            Abort;
        end;

        nbDelete : begin
            Quitar_SubFamilia_de_Familia;
            Abort;
        end;

        nbRefresh : begin
            form_articulos_familias_000.Refrescar_Registros_SubFamilias;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_familias_001.Edit_Descripcion_Familia_SuperiorClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_1);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_familias_000.SQLQuery_Articulos_Familias.FieldByName('id_articulos_familias').Clear;
         Edit_Descripcion_Familia_Superior.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_familias_001.BitBtn_Asignar_DescuentosClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Continuar_1);
    var_msg.Add(rs_Continuamos);
    if UTI_GEN_Aviso(true, var_msg, rs_Continuamos, True, True) = True then
    begin

    end;
    var_msg.Free;
end;

procedure Tform_articulos_familias_001.BitBtn_Asignar_BeneficiosClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Continuar_2);
    var_msg.Add(rs_Continuamos);
    if UTI_GEN_Aviso(true, var_msg, rs_Continuamos, True, True) = True then
    begin

    end;
    var_msg.Free;
end;

procedure Tform_articulos_familias_001.BitBtn_Act_TarifasClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Continuar_3);
    var_msg.Add(rs_Continuamos);
    if UTI_GEN_Aviso(true, var_msg, rs_Continuamos, True, True) = True then
    begin

    end;
    var_msg.Free;
end;

function Tform_articulos_familias_001.Existe_Tarifa_Ya( param_id,
                                                        param_id_articulos_familias,
                                                        param_id_tarifas : ShortString ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT a.*' );
        var_SQL.Add(  'FROM articulos_familias_tarifas AS a' );
        var_SQL.Add(' WHERE a.id_articulos_familias = ' +  Trim(param_id_articulos_familias) );
        var_SQL.Add(  ' AND a.id_tarifas = ' +  Trim(param_id_tarifas) );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT a.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY a.id_articulos_familias ASC, a.id_tarifas ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_Tarifa_Ya';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        TRABAJAMOS CON LOS REGISTROS DEVUELTOS
        ****************************************************************************
        Si el módulo no se creó, no se permite entrar en él ... Result := False
        **************************************************************************** }
        Result.Fallo_en_Conexion_BD := false;
        Result.Existe               := false;
        Result.deBaja               := 'N';

        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe := true;
            if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
        end;

      { ****************************************************************************
        Cerramos la tabla
        **************************************************************************** }
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQL.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
         on error : Exception do
         begin
             UTI_GEN_Error_Log( rs_Existe_Tarifa_Ya_1 +
                                rs_Existe_Tarifa_Ya_2 + var_SQLQuery.Name +
                                rs_Existe_Tarifa_Ya_3 + Screen.ActiveForm.Name,
                                error );
             try
                 var_SQL.Free;
                 var_SQLTransaction.Free;
                 var_SQLConnector.Free;
                 var_SQLQuery.Free;
             except
             end;

             Result.Fallo_en_Conexion_BD := true;
         end;
    end;
end;

function Tform_articulos_familias_001.Existe_SubFamilia_Ya( param_id,
                                                            param_id_articulos_familias : ShortString ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT a.*' );
        var_SQL.Add(  'FROM articulos_familias AS a' );

        var_SQL.Add(' WHERE a.id_articulos_familias = ' +  Trim(param_id_articulos_familias) );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT a.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY a.id_articulos_familias ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_SubFamilia_Ya';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        TRABAJAMOS CON LOS REGISTROS DEVUELTOS
        ****************************************************************************
        Si el módulo no se creó, no se permite entrar en él ... Result := False
        **************************************************************************** }
        Result.Fallo_en_Conexion_BD := false;
        Result.Existe               := false;
        Result.deBaja               := 'N';

        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe := true;
            if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
        end;

      { ****************************************************************************
        Cerramos la tabla
        **************************************************************************** }
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQL.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
         on error : Exception do
         begin
             UTI_GEN_Error_Log( rs_Existe_SubFamilia_Ya_1 +
                                rs_Existe_SubFamilia_Ya_2 + var_SQLQuery.Name +
                                rs_Existe_SubFamilia_Ya_3 + Screen.ActiveForm.Name,
                                error );
             try
                 var_SQL.Free;
                 var_SQLTransaction.Free;
                 var_SQLConnector.Free;
                 var_SQLQuery.Free;
             except
             end;

             Result.Fallo_en_Conexion_BD := true;
         end;
    end;
end;

function Tform_articulos_familias_001.Existe_Terminal_Ya( param_id,
                                                          param_id_articulos_familias,
                                                          param_id_terminales : ShortString ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT a.*' );
        var_SQL.Add(  'FROM articulos_familias_terminales AS a' );

        var_SQL.Add(' WHERE a.id_articulos_familias = ' +  Trim(param_id_articulos_familias) );
        var_SQL.Add(  ' AND a.id_terminales = ' +  Trim(param_id_terminales) );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT a.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY a.id_articulos_familias ASC, a.id_terminales ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_Terminal_Ya';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        TRABAJAMOS CON LOS REGISTROS DEVUELTOS
        ****************************************************************************
        Si el módulo no se creó, no se permite entrar en él ... Result := False
        **************************************************************************** }
        Result.Fallo_en_Conexion_BD := false;
        Result.Existe               := false;
        Result.deBaja               := 'N';

        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe := true;
            if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
        end;

      { ****************************************************************************
        Cerramos la tabla
        **************************************************************************** }
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQL.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
         on error : Exception do
         begin
             UTI_GEN_Error_Log( rs_Existe_Terminal_Ya_1 + rs_Existe_Terminal_Ya_2 + var_SQLQuery.Name +
                                rs_Existe_Terminal_Ya_3 + Screen.ActiveForm.Name,
                                error );
             try
                 var_SQL.Free;
                 var_SQLTransaction.Free;
                 var_SQLConnector.Free;
                 var_SQLQuery.Free;
             except
             end;

             Result.Fallo_en_Conexion_BD := true;
         end;
    end;
end;

function Tform_articulos_familias_001.Asignar_Familia_como_SubFamilia_2( param_id,
                                                                         param_articulos_Familias : ShortString ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_Fecha          : ShortString;
    var_msg            : TStrings;
begin
    Result := true;
    Try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_Fecha := UTI_GEN_Format_Fecha_Hora(UTI_CN_Fecha_Hora, true);

        var_SQL.Add( 'UPDATE articulos_familias' +
                       ' SET id_articulos_familias = ' + Trim(param_articulos_Familias) + ',' +
                           ' Change_WHEN = ' + UTI_GEN_Comillas(var_Fecha) + ',' +
                           ' Change_Id_User = ' + IntToStr(Form_Menu.public_User) +
                     ' WHERE id = ' + Trim(param_id) );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Asignar_Familia_como_SubFamilia_2';


        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQL.Free;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        if UTI_CN_Connector_Close( var_SQLTransaction,
                                   var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
         on error : Exception do
         begin
             UTI_GEN_Error_Log( rs_aFcS_2_1 + Trim(param_id) +
                                rs_aFcS_2_2 + Trim(param_articulos_Familias) +
                                rs_aFcS_2_3 + var_SQLQuery.Name +
                                rs_aFcS_2_4 + Screen.ActiveForm.Name,
                                error );
             try
                 var_SQL.Free;
                 var_SQLTransaction.Free;
                 var_SQLConnector.Free;
                 var_SQLQuery.Free;
             except
             end;

             Result := false
         end;
    end;
end;

procedure Tform_articulos_familias_001.Cauto_SubFamilia_Y_Guardo_en_Historico_sus_Cambios( param_id_articulos_familias,
                                                                                           param_Id,
                                                                                           param_descripcion : ShortString );
var var_SQL : TStrings;
begin
    // ********************************************************************* //
    // ** Esto lo hago porque puede ser que los criterios de filtrado me  ** //
    // ** eviten filtrar el registro recien creado                        ** //
    // ********************************************************************* //
    var_SQL := TStringList.Create;

    var_SQL.Add( 'SELECT af.*' );
    var_SQL.Add(   'FROM articulos_familias AS af' );
    var_SQL.Add(  'WHERE af.id_articulos_familias = ' + Trim(param_id_articulos_familias)  );
    var_SQL.Add(    'AND af.id = ' +  Trim(param_Id) );
    var_SQL.Add(  'ORDER BY af.id_articulos_familias ASC, af.descripcion ASC' );

    if UTI_RGTRO_Buscar_Rgtro_y_Grabar_Cambios_en_Historico( 'SQLQuery_Articulos_Familias',
                                                             var_SQL ) = false then
    begin
        var_SQL.Clear;

        var_SQL.Add( rs_cSFyGeHsC_1 +
                     rs_cSFyGeHsC_2 +
                     Trim(form_articulos_familias_000.SQLQuery_Articulos_Familias.FieldByName('descripcion').AsString) +
                     rs_cSFyGeHsC_3 + Trim(param_descripcion) );

        UTI_GEN_Aviso(true, var_SQL, rs_error, True, False);
    end;

    var_SQL.Free;
end;

procedure Tform_articulos_familias_001.Boton_Grupo_CocinaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_familias_000.SQLQuery_Articulos_Familias do
    begin
        var_Registro := UTI_Abrir_Modulo_GruposDeCocina( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_grupos_cocina').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Grupo_Cocina.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_familias_001.Edit_Descripcion_Grupo_CocinaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_2);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_familias_000.SQLQuery_Articulos_Familias.FieldByName('id_grupos_cocina').Clear;
         Edit_Descripcion_Grupo_Cocina.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_familias_001.Boton_Elegir_ImpresoraClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_familias_000.SQLQuery_Articulos_Familias do
    begin
        var_Registro := UTI_Abrir_Modulo_Impresoras( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_impresoras').AsString    := Trim(var_Registro.id_1);
             Edit_Descripcion_Impresora_comandas.Text := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_familias_001.Edit_Descripcion_Impresora_comandasClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_3);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_familias_000.SQLQuery_Articulos_Familias.FieldByName('id_impresoras').Clear;
         Edit_Descripcion_Impresora_comandas.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_familias_001.Boton_Elegir_Familia_SuperiorClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_familias_000.SQLQuery_Articulos_Familias do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
        begin
            var_Registro := Elegir_Familia( FieldByName('id').AsString );
        end;

        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_articulos_familias').AsString := Trim(var_Registro.id_1);
            Edit_Descripcion_Familia_Superior.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

function Tform_articulos_familias_001.Elegir_Familia(param_familia : ShortString) : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
    Result.id_1 := '';

    if UTI_GEN_Form_Abierto_Ya('form_articulos_familias_005') = false then
    begin
        Application.CreateForm(Tform_articulos_familias_005, form_articulos_familias_005);
        form_articulos_familias_005.Label_Cambiable_1.Caption := rs_Elegir_Familia_1;
        form_articulos_familias_005.Label_Cambiable_2.Caption := rs_Elegir_Familia_2;

        form_articulos_familias_005.public_id_familia_que_no_tiene_que_aparecer := param_familia;

        form_articulos_familias_005.public_Solo_Ver    := true;
        form_articulos_familias_005.public_Elegimos    := true;
        form_articulos_familias_005.public_Menu_Worked := public_Menu_Worked;

        form_articulos_familias_005.para_Empezar;

        form_articulos_familias_005.ShowModal;

        if form_articulos_familias_005.public_Rgtro_Seleccionado = true then
        begin
            with form_articulos_familias_005.SQLQuery_Articulos_NO_SubFamilias do
            begin
                Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                      '',
                                                      '',

                                                      FieldByName('descripcion').AsString,
                                                      '',
                                                      '' );
            end;
        end;

        form_articulos_familias_005.Free;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add(rs_Modulo_Abierto);
        UTI_GEN_Aviso(true, var_msg, rs_avisamos, True, False);
        var_msg.Free;
        Exit;
    end;
end;

procedure Tform_articulos_familias_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled                     := False;
    DBCheckBox_Ventas_por_peso.Enabled             := False;
    Boton_Elegir_Familia_Superior.Enabled          := False;
    Edit_Descripcion_Familia_Superior.Enabled      := False;
    DBEdit_Cuenta_Contable_Ventas.Enabled          := False;
    DBEdit_Cuenta_Contable_Compras.Enabled         := False;
    GroupBox_Cocina.Enabled                        := False;
    DBEdit_Comision.Enabled                        := False;
    BitBtn_Asignar_Descuentos.Enabled              := False;
    BitBtn_Asignar_Beneficios.Enabled              := False;
    DBCheckBox_Vencimientos_automaticos_SN.Enabled := False;
end;

procedure Tform_articulos_familias_001.FormActivate(Sender: TObject);
begin
    If form_articulos_familias_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_articulos_familias_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
                                                          param_Ejecutar_No_Tocar : Boolean ) : Boolean;
begin
    Result := false;

    // ********************************************************************************************* //
    // ** Si se llamó para solo verlo, pues no se puede tocar                                     ** //
    // ********************************************************************************************* //
    if public_Solo_Ver = true then
    begin
        Result := true;
        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;
end;

procedure Tform_articulos_familias_001.Editar_Registro_Tarifas;
var var_msg           : TStrings;
    var_Form          : Tform_articulos_familias_002;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_familias_000.SQLQuery_Articulos_Familias_Tarifas do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'articulos_familias_tarifas',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'articulos_familias_tarifas',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_articulos_familias_002.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_record_Existe := Existe_Tarifa_Ya( FieldByName('id').AsString,
                                                                   FieldByName('id_articulos_familias').AsString,
                                                                   FieldByName('id_tarifas').AsString );

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_familias_000.SQLQuery_Articulos_Familias_Tarifas ) = true then
                                               begin
                                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                                    UTI_RGTRO_Grabar_Antes( 'articulos_familias_tarifas',
                                                                            form_articulos_familias_000.SQLQuery_Articulos_Familias_Tarifas );
                                               end
                                            else Cancel;
                                            var_Form.Free;
                                        end
                                    else
                                        begin
                                            var_Form.Free;
                                            Cancel;
                                            var_msg.Clear;
                                            var_msg.Add(rs_Editar_Registro_Tarifas_1);

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;

                    UTI_RGTRO_UnLock( 'articulos_familias_tarifas',
                                      var_id );
                end;
            end
        else
            begin
                var_msg.Add(rs_no_Hay_Rgtros);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end;
    end;

    var_msg.Free;
end;

procedure Tform_articulos_familias_001.Editar_Registro_Terminales;
var var_msg           : TStrings;
    var_Form          : Tform_articulos_familias_003;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_familias_000.SQLQuery_Articulos_Familias_Terminales do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'articulos_familias_terminales',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'articulos_familias_terminales',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_articulos_familias_003.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_record_Existe := Existe_Terminal_Ya( FieldByName('id').AsString,
                                                                     FieldByName('id_articulos_familias').AsString,
                                                                     FieldByName('id_terminales').AsString );

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_familias_000.SQLQuery_Articulos_Familias_Terminales ) = true then
                                               begin
                                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                                    UTI_RGTRO_Grabar_Antes( 'articulos_familias_terminales',
                                                                            form_articulos_familias_000.SQLQuery_Articulos_Familias_Terminales );
                                               end
                                            else Cancel;
                                            var_Form.Free;
                                        end
                                    else
                                        begin
                                            var_Form.Free;
                                            Cancel;
                                            var_msg.Clear;
                                            var_msg.Add(rs_Editar_Registro_Terminales_1);

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;

                    UTI_RGTRO_UnLock( 'articulos_familias_terminales',
                                      var_id );
                end;
            end
        else
            begin
                var_msg.Add(rs_no_Hay_Rgtros);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end;
    end;

    var_msg.Free;
end;

procedure Tform_articulos_familias_001.Asignar_Familia_como_SubFamilia;
var var_Registro      : TRecord_Rgtro_Comun;
    var_msg           : TStrings;
    var_record_Existe : Trecord_Existe;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_familias_000.SQLQuery_Articulos_Familias_SubFamilias do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
        begin
            var_Registro := Elegir_Familia(form_articulos_familias_000.SQLQuery_Articulos_Familias.FieldByName('id').AsString);

            if var_Registro.id_1 <> '' then
            begin
                var_record_Existe := Existe_SubFamilia_Ya( '', // en realidad es como si fuera un insercción
                                                           var_Registro.id_1 );

                if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                    end
                else
                    begin
                        if var_record_Existe.Existe = false then
                            begin
                                if Asignar_Familia_como_SubFamilia_2( var_Registro.id_1,
                                                                      form_articulos_familias_000.SQLQuery_Articulos_Familias.FieldByName('id').AsString ) = true then
                                begin
                                    // ********************************************************************* //
                                    // ** Si se consiguió asignar la subfamilia a la familia, lo que hace-** //
                                    // ** mos es refrescar la tabla de subfamilias, buscar el registro re-** //
                                    // ** cién creado y guardar los cambios realizados sobre el registro  ** //
                                    // ** en el historico de cambios                                      ** //
                                    // ********************************************************************* //
                                    form_articulos_familias_000.Refrescar_Registros_SubFamilias;


                                    with form_articulos_familias_000.SQLQuery_Articulos_Familias_SubFamilias do
                                    begin
                                         Locate( 'descripcion;id',
                                                 VarArrayOf( [ var_Registro.descripcion_1,
                                                               var_Registro.id_1 ] ),
                                                 [] );
                                    end;

                                    with form_articulos_familias_000.SQLQuery_Articulos_Familias do
                                    begin
                                         Cauto_SubFamilia_Y_Guardo_en_Historico_sus_Cambios( FieldByName('id').AsString,
                                                                                             var_Registro.id_1,
                                                                                             var_Registro.descripcion_1 );
                                    end;
                                end;
                            end
                        else
                            begin
                                var_msg.Clear;

                                var_msg.Add(rs_Asignar_Familia_como_SubFamilia_1);

                                if UpperCase(var_record_Existe.deBaja) = 'S' then
                                begin
                                    var_msg.Add(rs_Rgtro_Borrado);
                                end;

                                UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                            end;
                    end;
            end;

        end;

        var_msg.Free;
    end;
end;

procedure Tform_articulos_familias_001.Quitar_SubFamilia_de_Familia;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_familias_000.SQLQuery_Articulos_Familias_SubFamilias do
    begin
        var_msg := TStringList.Create;

        var_msg.Add( rs_Quitamos_4 +
                     form_articulos_familias_000.SQLQuery_Articulos_Familias.FieldByName('descripcion').AsString +
                     '?' );

        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_RGTRO_isLock( 'articulos_familias',
                                 FieldByName('id').AsString,
                                 true ) = true then
            begin
                Exit;
            end else begin
                if UTI_RGTRO_Lock( 'articulos_familias',
                                   FieldByName('id').AsString ) = true then
                     Edit
                else Exit;
            end;

            FieldByName('id_articulos_familias').Clear;

            UTI_RGTRO_Grabar_Antes( 'articulos_familias',
                                    form_articulos_familias_000.SQLQuery_Articulos_Familias_SubFamilias );
        end;

        var_msg.Free;

        UTI_RGTRO_UnLock( 'articulos_familias', var_id );
    end;
end;

end.


