unit visitas_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel, db, sqldb,
  StdCtrls, DbCtrls, Buttons, EditBtn, utilidades_forms_Filtrar, utilidades_general, utilidades_datos_tablas,
  utilidades_bd, utilidades_usuarios, utilidades_clientes;

type

  { Tform_visitas_001 }

  Tform_visitas_001 = class(TForm)
    BitBtn_SMS: TBitBtn;
    Boton_Elegir_Cliente: TBitBtn;
    Boton_Elegir_Contacto: TBitBtn;
    Boton_Elegir_Representante: TBitBtn;
    Boton_Elegir_Visita_Resultado: TBitBtn;
    Boton_Elegir_Visita_Tipo: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBCheckBox_IVA_Pedido_Realizado: TDBCheckBox;
    DBCheckBox_Presupuesto_Realizado: TDBCheckBox;
    DBDateTimePicker_Visita: TDBDateTimePicker;
    DBDateTimePicker_Visita_Proxima: TDBDateTimePicker;
    DBEdit_eMail1: TDBEdit;
    DBMemo1: TDBMemo;
    Edit_Descripcion_Actividad: TEdit;
    Edit_Descripcion_Cliente: TEdit;
    Edit_Descripcion_Cliente_Tipo: TEdit;
    Edit_Descripcion_Contacto: TEdit;
    Edit_Descripcion_Tfno1: TEdit;
    Edit_Descripcion_Tfno2: TEdit;
    Edit_Descripcion_Fax: TEdit;
    Edit_Descripcion_Movil: TEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    Edit_Descripcion_Visita_Resultado: TEdit;
    Edit_nif: TEdit;
    Edit_Descripcion_Representante: TEdit;
    Edit_Descripcion_Ruta: TEdit;
    Edit_Descripcion_Visita_Tipo: TEdit;
    GroupBox1: TGroupBox;
    GroupBox11: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label_Fecha: TLabel;
    Label_Fecha1: TLabel;
    Label_Fecha2: TLabel;
    Label_MaxLength_Comentario: TLabel;

    procedure No_Tocar_Representante;
    procedure No_Tocar_Por_Planificacion;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure No_Tocar_Cliente;
    procedure Boton_Elegir_ContactoClick(Sender: TObject);
    procedure Cuanto_Falta_para_Total_Comentario;
    procedure Boton_Elegir_ClienteClick(Sender: TObject);
    procedure Boton_Elegir_RepresentanteClick(Sender: TObject);
    procedure Boton_Elegir_Visita_ResultadoClick(Sender: TObject);
    procedure Boton_Elegir_Visita_TipoClick(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure Edit_Descripcion_ClienteClick(Sender: TObject);
    procedure Edit_Descripcion_ContactoClick(Sender: TObject);
    procedure Edit_Descripcion_RepresentanteClick(Sender: TObject);
    procedure Edit_Descripcion_Visita_ResultadoClick(Sender: TObject);
    procedure Edit_Descripcion_Visita_TipoClick(Sender: TObject);
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

  private
      { private declarations }
      private_Salir_OK : Boolean;

      function Traer_Clientes_xID( param_id : ShortString ) : TClientes;

  public
      { public declarations }
      public_Solo_Ver      : Boolean;
      public_Menu_Worked   : Integer;
      public_Pulso_Aceptar : Boolean;
      public_Record_Rgtro  : TRecord_Rgtro_Comun;
      public_planificacion : Boolean;
  end;

var
  form_visitas_001: Tform_visitas_001;

implementation

{$R *.lfm}

uses menu, visitas_000;

{ Tform_visitas_001 }

procedure Tform_visitas_001.FormActivate(Sender: TObject);
begin
    If form_visitas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_visitas_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_visitas_001.Presentar_Datos;
begin
    with form_visitas_000.SQLQuery_Visitas do
    begin
        Edit_Descripcion_Cliente.Text          := FieldByName('OT_descripcion_cliente').AsString;
        Edit_nif.Text                          := FieldByName('OT_nif_cif').AsString;
        Edit_Descripcion_Cliente_Tipo.Text     := FieldByName('OT_descripcion_cliente_tipo').AsString;
        Edit_Descripcion_Ruta.Text             := FieldByName('OT_descripcion_ruta').AsString;
        Edit_Descripcion_Provincia.Text        := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Descripcion_Actividad.Text        := FieldByName('OT_descripcion_actividad').AsString;
        Edit_Descripcion_Poblacion.Text        := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Descripcion_Pais.Text             := FieldByName('OT_descripcion_pais').AsString;
        Edit_Descripcion_Tfno1.Text            := FieldByName('OT_Tfno_Fijo_1').AsString;
        Edit_Descripcion_Tfno2.Text            := FieldByName('OT_Tfno_Fijo_2').AsString;
        Edit_Descripcion_Fax.Text              := FieldByName('OT_FAX').AsString;
        Edit_Descripcion_Movil.Text            := FieldByName('OT_Movil').AsString;

        Edit_Descripcion_Representante.Text    := FieldByName('OT_descripcion_representante').AsString;
        Edit_Descripcion_Visita_Tipo.Text      := FieldByName('OT_descripcion_visita_tipo').AsString;
        Edit_Descripcion_Visita_Resultado.Text := FieldByName('OT_descripcion_visita_resultado').AsString;

        Edit_Descripcion_Contacto.Text         := FieldByName('OT_descripcion_Contacto').AsString;

        Cuanto_Falta_para_Total_Comentario;
    end;
end;

procedure Tform_visitas_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_visitas_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_visitas_001.FormCreate(Sender: TObject);
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
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    public_planificacion := false;
end;

procedure Tform_visitas_001.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_visitas_000.SQLQuery_Visitas do
      begin
          public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                             FieldByName('Fecha_Visita').AsString,
                                                             FieldByName('id_clientes').AsString,
                                                             FieldByName('id_visitas_tipos').AsString,
                                                             FieldByName('id_visitas_resultados').AsString,
                                                             FieldByName('id_representantes').AsString );
      end;

      Presentar_Datos;
end;

procedure Tform_visitas_001.Boton_Elegir_Visita_TipoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_visitas_000.SQLQuery_Visitas do
    begin
        var_Registro := UTI_Abrir_Modulo_VisitasTipos( true, false, 470, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_visitas_tipos').AsString := Trim(var_Registro.id_1);

             Edit_Descripcion_Visita_Tipo.Text := var_Registro.descripcion_1;

             FieldByName('OT_descripcion_visita_tipo').AsString := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_visitas_001.DBMemo1Change(Sender: TObject);
begin
    Cuanto_Falta_para_Total_Comentario;
end;

procedure Tform_visitas_001.Cuanto_Falta_para_Total_Comentario;
begin
    Label_MaxLength_Comentario.Caption := IntToStr( DBMemo1.MaxLength - Length(DBMemo1.Text) );
end;

procedure Tform_visitas_001.Boton_Elegir_ContactoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_visitas_000.SQLQuery_Visitas do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
        begin
            var_Registro := UTI_Abrir_Modulo_Elegir_cliente_contacto( true, true, 51, '1' );
            if var_Registro.id_1 <> '' then
            begin
                 FieldByName('id_clientes_contactos').AsString := Trim(var_Registro.id_1);
                 Edit_Descripcion_Contacto.Text                := var_Registro.descripcion_1;
            end;
        end;
    end;
end;

procedure Tform_visitas_001.Edit_Descripcion_ClienteClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el CLIENTE?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_visitas_000.SQLQuery_Visitas.FieldByName('id_clientes').Clear;
         Edit_Descripcion_Cliente.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_visitas_001.Edit_Descripcion_ContactoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la persona CON QUIEN SE HABLO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_visitas_000.SQLQuery_Visitas.FieldByName('id_clientes_contactos').Clear;
         Edit_Descripcion_Contacto.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_visitas_001.Edit_Descripcion_RepresentanteClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el REPRESENTANTE?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_visitas_000.SQLQuery_Visitas.FieldByName('id_representantes').Clear;
         Edit_Descripcion_Representante.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_visitas_001.Edit_Descripcion_Visita_ResultadoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el RESULTADO DE LA VISITA?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_visitas_000.SQLQuery_Visitas.FieldByName('id_visitas_tipos').Clear;
         Edit_Descripcion_Visita_Tipo.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_visitas_001.Edit_Descripcion_Visita_TipoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el TIPO/MOTIVO DE VISITA?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_visitas_000.SQLQuery_Visitas.FieldByName('id_visitas_tipos').Clear;
         Edit_Descripcion_Visita_Tipo.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_visitas_001.Boton_Elegir_RepresentanteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_visitas_000.SQLQuery_Visitas do
    begin
        var_Registro := UTI_Abrir_Modulo_Representantes( true, false, 130, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_representantes').AsString := Trim(var_Registro.id_1);

             Edit_Descripcion_Representante.Text := var_Registro.descripcion_1;

             FieldByName('OT_descripcion_representante').AsString := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_visitas_001.Boton_Elegir_Visita_ResultadoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_visitas_000.SQLQuery_Visitas do
    begin
        var_Registro := UTI_Abrir_Modulo_VisitasResultados( true, false, 480, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_visitas_resultados').AsString := Trim(var_Registro.id_1);

             Edit_Descripcion_Visita_Resultado.Text := var_Registro.descripcion_1;

             FieldByName('OT_descripcion_visita_resultado').AsString := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_visitas_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_visitas_000.SQLQuery_Visitas do
        begin
            if Trim(FieldByName('Fecha_Visita').asString) = '' then
            begin
                var_msg.Add( '* La fecha de la visita');
            end;

            if public_planificacion = false then
            begin
                if Trim(FieldByName('id_clientes').asString) = '' then
                begin
                    var_msg.Add( '* El cliente');
                end;
            end;

            if Trim(FieldByName('id_representantes').asString) = '' then
            begin
                var_msg.Add( '* El representante');
            end;
        end;
    end;

    if private_Salir_OK = false then
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
            CloseAction := TCloseAction.caNone;
        end else begin
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_visitas_001.No_Tocar_Cliente;
begin
    Boton_Elegir_Cliente.Enabled          := false;
    Edit_Descripcion_Cliente.Enabled      := false;
    Edit_nif.Enabled                      := false;
    Edit_Descripcion_Cliente_Tipo.Enabled := false;
    Edit_Descripcion_Ruta.Enabled         := false;
    Edit_Descripcion_Provincia.Enabled    := false;
    Edit_Descripcion_Actividad.Enabled    := false;
    Edit_Descripcion_Poblacion.Enabled    := false;
    Edit_Descripcion_Pais.Enabled         := false;
    Edit_Descripcion_Tfno1.Enabled        := false;
    Edit_Descripcion_Tfno2.Enabled        := false;
    Edit_Descripcion_Fax.Enabled          := false;
    Edit_Descripcion_Movil.Enabled        := false;
end;

procedure Tform_visitas_001.No_Tocar_Por_Planificacion;
begin
    No_Tocar_Cliente;

    Boton_Elegir_Contacto.Enabled             := false;
    Edit_Descripcion_Contacto.Enabled         := false;
    DBCheckBox_Presupuesto_Realizado.Enabled  := false;
    Boton_Elegir_Visita_Resultado.Enabled     := false;
    Edit_Descripcion_Visita_Resultado.Enabled := false;
    DBCheckBox_IVA_Pedido_Realizado.Enabled   := false;
    DBDateTimePicker_Visita_Proxima.Enabled   := false;
end;

procedure Tform_visitas_001.No_Tocar_Representante;
begin
    Boton_Elegir_Representante.Enabled     := False;
    Edit_Descripcion_Representante.Enabled := False;
end;

procedure Tform_visitas_001.no_Tocar;
begin
    No_Tocar_Cliente;
    No_Tocar_Representante;

    DBDateTimePicker_Visita.Enabled           := False;
    Boton_Elegir_Visita_Tipo.Enabled          := False;
    Edit_Descripcion_Visita_Tipo.Enabled      := False;

    DBMemo1.Enabled                           := False;

    Boton_Elegir_Contacto.Enabled             := False;
    Edit_Descripcion_Contacto.Enabled         := False;
    DBCheckBox_Presupuesto_Realizado.Enabled  := False;

    Boton_Elegir_Visita_Resultado.Enabled     := False;
    Edit_Descripcion_Visita_Resultado.Enabled := False;
    DBCheckBox_IVA_Pedido_Realizado.Enabled   := False;

    DBDateTimePicker_Visita_Proxima.Enabled   := False;
end;

procedure Tform_visitas_001.Boton_Elegir_ClienteClick(Sender: TObject);
var var_Registro         : TRecord_Rgtro_Comun;
    var_Registro_Cliente : TClientes;
    var_msg              : TStrings;
begin
  if UTI_USR_Permiso_SN(50, '', True) = true then
  begin
      jerofa desde que quité los filtros no puedes hacer esto
    { jerofa desde que quité los filtros no puedes hacer esto

                if Trim(form_visitas_000.public_llamado_desde) <> '' then
                begin
                    if Trim(form_visitas_000.public_llamado_desde) = 'form_visitas_por_actividad_000' then
                    begin
                        f_clientes_000.Edit_Filtro_id_Actividad.Text          := form_visitas_000.public_llamado_desde_id;
                        f_clientes_000.Edit_Filtro_Descripcion_Actividad.Text := form_visitas_000.public_llamado_desde_Descripcion;
                    end;

                    if Trim(form_visitas_000.public_llamado_desde) = 'form_visitas_por_provincia_000' then
                    begin
                        f_clientes_000.Edit_Filtro_id_provincias.Text         := form_visitas_000.public_llamado_desde_id;
                        f_clientes_000.Edit_Filtro_Descripcion_Provincia.Text := form_visitas_000.public_llamado_desde_Descripcion;
                    end;

                    if Trim(form_visitas_000.public_llamado_desde) = 'form_visitas_por_tipo_cliente_000' then
                    begin
                        f_clientes_000.Edit_id_clientes_tipos.Text          := form_visitas_000.public_llamado_desde_id;
                        f_clientes_000.Edit_Descripcion_clientes_tipos.Text := form_visitas_000.public_llamado_desde_Descripcion;
                    end;

                    if Trim(form_visitas_000.public_llamado_desde) = 'Tform_visitas_por_zona_000' then
                    begin
                        f_clientes_000.Edit_Filtro_id_Ruta.Text          := form_visitas_000.public_llamado_desde_id;
                        f_clientes_000.Edit_Filtro_Descripcion_Ruta.Text := form_visitas_000.public_llamado_desde_Descripcion;
                    end;
                end;
    }
    var_Registro := UTI_Abrir_Form( true, true, 'id_clientes' );

    if var_Registro.id_1 <> '' then
    begin
      form_visitas_000.SQLQuery_Visitas.FieldByName('id_clientes').AsString := Trim(var_Registro.id_1);

      if Trim(var_Registro.descripcion_1) <> '' then
        Edit_Descripcion_Cliente.Text := var_Registro.descripcion_1
      else
        Edit_Descripcion_Cliente.Text := var_Registro.descripcion_2;

      // FieldByName('OT_descripcion_cliente').AsString := Edit_Descripcion_Cliente.Text;


      var_Registro_Cliente := Traer_Clientes_xID( Trim(var_Registro.id_1) );

      if var_Registro_Cliente.id <> '0' then
      begin
        Edit_nif.Text                      := var_Registro_Cliente.nif_cif;
        Edit_Descripcion_Cliente_Tipo.Text := var_Registro_Cliente.OT_descripcion_cliente_tipo;
        Edit_Descripcion_Ruta.Text         := var_Registro_Cliente.OT_descripcion_ruta;
        Edit_Descripcion_Provincia.Text    := var_Registro_Cliente.OT_descripcion_provincia;
        Edit_Descripcion_Actividad.Text    := var_Registro_Cliente.OT_descripcion_actividad;
        Edit_Descripcion_Poblacion.Text    := var_Registro_Cliente.OT_descripcion_poblacion;
        Edit_Descripcion_Pais.Text         := var_Registro_Cliente.OT_descripcion_pais;
        Edit_Descripcion_Tfno1.Text        := var_Registro_Cliente.Tfno_Fijo_1;
        Edit_Descripcion_Tfno2.Text        := var_Registro_Cliente.Tfno_Fijo_2;
        Edit_Descripcion_Fax.Text          := var_Registro_Cliente.FAX;
        Edit_Descripcion_Movil.Text        := var_Registro_Cliente.Movil;
      end;
    end;

  end;
end;

function Tform_visitas_001.Traer_Clientes_xID( param_id : ShortString ) : TClientes;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y le pasamos el SQLConnector                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Name     := 'SQLQuery_Traer_Clientes_xID';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT cl.*,' + ' ' +

                                            'act.descripcion AS OT_descripcion_actividad,' + ' ' +
                                            'rt.descripcion AS OT_descripcion_ruta,' + ' ' +

                                            'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                            'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                            'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                            'ct.descripcion AS OT_descripcion_cliente_tipo,' + ' ' +
                                            'ct.Cuenta_Contable AS OT_Cuenta_Contable_cliente_tipo,' + ' ' +

                                            'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                            'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                            'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                            'fp.descripcion AS OT_descripcion_forma_pago,' + ' ' +
                                            'fp.Vencimientos_Cantidad AS OT_Vencimientos_Cantidad,' + ' ' +
                                            'fp.Vencimientos_1_Dias AS OT_Vencimientos_1_Dias,' + ' ' +
                                            'fp.Vencimientos_Dias_Entre AS OT_Vencimientos_Dias_Entre,' + ' ' +

                                            'tf.descripcion AS OT_descripcion_tarifa,' + ' ' +

                                            'prv.nombre_propietario AS OT_descripcion_agencia_transporte,' + ' ' +
                                            'prv.Tfno_Fijo_1 AS OT_Tfno_Fijo_1_agencia_transporte,' + ' ' +
                                            'prv.Movil AS OT_Movil_agencia_transporte,' + ' ' +

                                            'rp.nombre_propietario AS OT_descripcion_representante,' + ' ' +
                                            'rp.Tfno_Fijo_1 AS OT_Tfno_Fijo_1_representante,' + ' ' +
                                            'rp.Movil AS OT_Movil_representante' + ' ' +

                                     'FROM clientes AS cl' + ' ' +

                                     'LEFT JOIN poblaciones AS pb' + ' ' +
                                     'ON cl.id_poblaciones = pb.id' + ' ' +

                                     'LEFT JOIN provincias AS pr' + ' ' +
                                     'ON cl.id_provincias = pr.id' + ' ' +

                                     'LEFT JOIN paises AS ps' + ' ' +
                                     'ON cl.id_paises = ps.id' + ' ' +

                                     'LEFT JOIN clientes_tipos AS ct' + ' ' +
                                     'ON cl.id_clientes_tipos = ct.id' + ' ' +

                                     'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                                     'ON cl.id_Cta_Bco_poblaciones = ct_pb.id' + ' ' +

                                     'LEFT JOIN provincias AS ct_pr' + ' ' +
                                     'ON cl.id_Cta_Bco_provincias = ct_pr.id' + ' ' +

                                     'LEFT JOIN paises AS ct_ps' + ' ' +
                                     'ON cl.id_Cta_Bco_pais = ct_ps.id' + ' ' +

                                     'LEFT JOIN formas_pago AS fp' + ' ' +
                                     'ON cl.id_formas_pago = fp.id' + ' ' +

                                     'LEFT JOIN tarifas AS tf' + ' ' +
                                     'ON cl.id_tarifas = tf.id' + ' ' +

                                     'LEFT JOIN proveedores AS prv' + ' ' +
                                     'ON cl.id_Agencias_Transporte = prv.id' + ' ' +

                                     'LEFT JOIN actividades AS act' + ' ' +
                                     'ON cl.id_actividades = act.id' + ' ' +

                                     'LEFT JOIN rutas AS rt' + ' ' +
                                     'ON cl.id_rutas = rt.id' + ' ' +

                                     'LEFT JOIN representantes AS rp' + ' ' +
                                     'ON cl.id_Representantes = rp.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE cl.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY cl.id ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = 0 aclarara que no existe el registro buscado por su id                     ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount = 0 then
             Result.id := '0' // No encontremos este registro
        else begin
             with var_SQLQuery do
             begin
                 Result.id                                := FieldByName('id').AsString;
                 Result.nombre_propietario                := FieldByName('nombre_propietario').AsString;
                 Result.nombre_comercial                  := FieldByName('nombre_comercial').AsString;
                 Result.nif_cif                           := FieldByName('nif_cif').AsString;
          	 Result.Fecha_Nacimiento                  := FieldByName('Fecha_Nacimiento').AsString;
                 Result.Tfno_Fijo_1                       := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2                       := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX                               := FieldByName('FAX').AsString;
                 Result.Movil                             := FieldByName('Movil').AsString;
                 Result.eMail                             := FieldByName('eMail').AsString;
                 Result.pagina_web                        := FieldByName('pagina_web').AsString;
                 Result.Direccion                         := FieldByName('Direccion').AsString;
                 Result.Direccion_Numero                  := FieldByName('Direccion_Numero').AsString;
                 Result.Direccion_Piso_Letra              := FieldByName('Direccion_Piso_Letra').AsString;
                 Result.Codigo_Postal                     := FieldByName('Codigo_Postal').AsString;
                 Result.id_poblaciones                    := FieldByName('id_poblaciones').AsString;
                 Result.id_provincias                     := FieldByName('id_provincias').AsString;
                 Result.id_paises                         := FieldByName('id_paises').AsString;
                 Result.id_clientes_tipos                 := FieldByName('id_clientes_tipos').AsString;
                 Result.Cta_Bco_Entidad                   := FieldByName('Cta_Bco_Entidad').AsString;
                 Result.Cta_Bco_Sucursal                  := FieldByName('Cta_Bco_Sucursal').AsString;
                 Result.Cta_Bco_Digito_Control            := FieldByName('Cta_Bco_Digito_Control').AsString;
                 Result.Cta_Bco_Cuenta                    := FieldByName('Cta_Bco_Cuenta').AsString;
                 Result.Cta_Bco_IBAN                      := FieldByName('Cta_Bco_IBAN').AsString;
                 Result.Cta_Bco_BIC_SWIFT                 := FieldByName('Cta_Bco_BIC_SWIFT').AsString;
                 Result.Cta_Bco_Mandato_Fecha_de_Firma    := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
                 Result.Cta_Bco_Mandato_Ref               := FieldByName('Cta_Bco_Mandato_Ref').AsString;
                 Result.Cta_Bco_Direccion                 := FieldByName('Cta_Bco_Direccion').AsString;
                 Result.Cta_Bco_Direccion_Numero          := FieldByName('Cta_Bco_Direccion_Numero').AsString;
                 Result.Cta_Bco_Direccion_Piso_Letra      := FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
                 Result.Cta_Bco_Codigo_Postal             := FieldByName('Cta_Bco_Codigo_Postal').AsString;
                 Result.id_Cta_Bco_poblaciones            := FieldByName('id_Cta_Bco_poblaciones').AsString;
                 Result.id_Cta_Bco_provincias             := FieldByName('id_Cta_Bco_provincias').AsString;
                 Result.id_Cta_Bco_pais                   := FieldByName('id_Cta_Bco_pais').AsString;
                 Result.id_formas_pago                    := FieldByName('id_formas_pago').AsString;
                 Result.Forma_pago_Dia_1                  := FieldByName('Forma_pago_Dia_1').AsString;
                 Result.Forma_pago_Dia_2                  := FieldByName('Forma_pago_Dia_2').AsString;
                 Result.Vencimientos_automaticos_SN       := FieldByName('Vencimientos_automaticos_SN').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Inicio  := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Inicio  := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Fin     := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Fin     := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;
                 Result.IVA_con_Recargo_SN                := FieldByName('IVA_con_Recargo_SN').AsString;
                 Result.IVA_Excluido_SN                   := FieldByName('IVA_Excluido_SN').AsString;
                 Result.id_tarifas                        := FieldByName('id_tarifas').AsString;
                 Result.Descuento_Comercial_1             := FieldByName('Descuento_Comercial_1').AsString;
                 Result.Descuento_Comercial_2             := FieldByName('Descuento_Comercial_2').AsString;
                 Result.Descuento_Pronto_Pago             := FieldByName('Descuento_Pronto_Pago').AsString;
                 Result.Descuento_Final                   := FieldByName('Descuento_Final').AsString;
                 Result.Retencion                         := FieldByName('Retencion').AsString;
                 Result.Riesgo_Autorizado                 := FieldByName('Riesgo_Autorizado').AsString;
                 Result.Riesgo_Acumulado                  := FieldByName('Riesgo_Acumulado').AsString;
                 Result.Agrupar_Albaranes_SN              := FieldByName('Agrupar_Albaranes_SN').AsString;
                 Result.Activar_Proximidad_SN             := FieldByName('Activar_Proximidad_SN').AsString;
                 Result.Cuenta_Contable                   := FieldByName('Cuenta_Contable').AsString;
                 Result.id_Agencias_Transporte            := FieldByName('id_Agencias_Transporte').AsString;
                 Result.Portes_Pagados_SN                 := FieldByName('Portes_Pagados_SN').AsString;
                 Result.id_Representantes                 := FieldByName('id_Representantes').AsString;
                 Result.Observaciones_Comentarios         := FieldByName('Observaciones_Comentarios').AsString;
                 Result.Estudia_SN                        := FieldByName('Estudia_SN').AsString;
                 Result.Trabaja_SN                        := FieldByName('Trabaja_SN').AsString;
                 Result.Estudios_Trabajos                 := FieldByName('Estudios_Trabajos').AsString;
                 Result.Cantidad_Hermanos                 := FieldByName('Cantidad_Hermanos').AsString;
                 Result.id_rutas                          := FieldByName('id_rutas').AsString;
                 Result.id_actividades                    := FieldByName('id_actividades').AsString;

                 Result.Insert_WHEN                       := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                    := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                          := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                       := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                           := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                       := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                    := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_actividad          := FieldByName('OT_descripcion_actividad').AsString;
                 Result.OT_descripcion_ruta               := FieldByName('OT_descripcion_ruta').AsString;
                 Result.OT_descripcion_poblacion          := FieldByName('OT_descripcion_poblacion').AsString;
                 Result.OT_descripcion_provincia          := FieldByName('OT_descripcion_provincia').AsString;
                 Result.OT_descripcion_pais               := FieldByName('OT_descripcion_pais').AsString;
                 Result.OT_descripcion_cliente_tipo       := FieldByName('OT_descripcion_cliente_tipo').AsString;
                 Result.OT_Cuenta_Contable_cliente_tipo   := FieldByName('OT_Cuenta_Contable_cliente_tipo').AsString;
                 Result.OT_Cta_Bco_descripcion_poblacion  := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
                 Result.OT_Cta_Bco_descripcion_provincia  := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
                 Result.OT_Cta_Bco_descripcion_pais       := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;
                 Result.OT_descripcion_forma_pago         := FieldByName('OT_descripcion_forma_pago').AsString;
                 Result.OT_Vencimientos_Cantidad          := FieldByName('OT_Vencimientos_Cantidad').AsString;
                 Result.OT_Vencimientos_1_Dias            := FieldByName('OT_Vencimientos_1_Dias').AsString;
                 Result.OT_Vencimientos_Dias_Entre        := FieldByName('OT_Vencimientos_Dias_Entre').AsString;

                 Result.OT_descripcion_tarifa             := FieldByName('OT_descripcion_tarifa').AsString;
                 Result.OT_descripcion_agencia_transporte := FieldByName('OT_descripcion_agencia_transporte').AsString;
                 Result.OT_Tfno_Fijo_1_agencia_transporte := FieldByName('OT_Tfno_Fijo_1_agencia_transporte').AsString;
                 Result.OT_Movil_agencia_transporte       := FieldByName('OT_Movil_agencia_transporte').AsString;
                 Result.OT_descripcion_representante      := FieldByName('OT_descripcion_representante').AsString;
                 Result.OT_Tfno_Fijo_1_representante      := FieldByName('OT_Tfno_Fijo_1_representante').AsString;
                 Result.OT_Movil_representante            := FieldByName('OT_Movil_representante').AsString;
             end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla y asi se cierra automaticamente La transacción y conexión con BD  ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del cliente con' +
                               ' la id ' + Trim(param_id) + '. La tabla ha sido ' +
                               var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name,
                               error );
            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

end.


