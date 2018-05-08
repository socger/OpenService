unit cuentas_pagos_cobros_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  utilidades_usuarios, utilidades_general, utilidades_rgtro, utilidades_bd, DBGrids, DbCtrls,
  ExtCtrls, Grids;

type

  { Tform_cuentas_pagos_cobros_000 }

  Tform_cuentas_pagos_cobros_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    DataSource_CtasPC: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Image_Confirmado: TImage;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Cuentas_Pagos_Cobros: TSQLQuery;
    SQLQuery_Cuentas_Pagos_CobrosChange_Id_User: TLargeintField;
    SQLQuery_Cuentas_Pagos_CobrosChange_WHEN: TDateTimeField;
    SQLQuery_Cuentas_Pagos_CobrosDel_Id_User: TLargeintField;
    SQLQuery_Cuentas_Pagos_CobrosDel_WHEN: TDateTimeField;
    SQLQuery_Cuentas_Pagos_CobrosDel_WHY: TStringField;
    SQLQuery_Cuentas_Pagos_Cobrosdescripcion: TStringField;
    SQLQuery_Cuentas_Pagos_Cobrosid: TLargeintField;
    SQLQuery_Cuentas_Pagos_CobrosInsert_Id_User: TLargeintField;
    SQLQuery_Cuentas_Pagos_CobrosInsert_WHEN: TDateTimeField;

    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure Presentar_Datos;
    procedure Cerramos_Tablas_Ligadas;
    procedure Cerramos_Tablas;
    procedure Seleccionado_Rgtro;
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure no_Tocar;
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalTitleClick(Column: TColumn);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_Cuentas_Pagos_CobrosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Cuentas_Pagos_CobrosAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_Cuentas_Pagos_CobrosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Cuentas_Pagos_CobrosBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Cuentas_Pagos_CobrosCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    private_Salir_OK    : Boolean;
    private_Last_Column : TColumn;
    private_Order_By    : array of TOrder_By;
  public
    { public declarations }
    public_Solo_Ver           : Boolean;
    public_Elegimos           : Boolean;
    public_Menu_Worked        : Integer;
    public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_cuentas_pagos_cobros_000: Tform_cuentas_pagos_cobros_000;

implementation

{$R *.lfm}

uses dm_cuentas_pagos_cobros, menu, informe, cuentas_pagos_cobros_001;

{ Tform_cuentas_pagos_cobros_000 }

procedure Tform_cuentas_pagos_cobros_000.SQLQuery_Cuentas_Pagos_CobrosCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Cuentas_Pagos_Cobros do
    begin
        if Trim(FieldByName('Modalidad').AsString) = '1' then FieldByName('OT_Modalidad_Descripcion').AsString := 'Efectivo';
        if Trim(FieldByName('Modalidad').AsString) = '2' then FieldByName('OT_Modalidad_Descripcion').AsString := 'Tarjeta de crédito';
        if Trim(FieldByName('Modalidad').AsString) = '3' then FieldByName('OT_Modalidad_Descripcion').AsString := 'Efecto bancario';

        if Trim(FieldByName('Tipo_Cuenta').AsString) = '1' then FieldByName('OT_Tipo_Cuenta_Descripcion').AsString := 'Pago';
        if Trim(FieldByName('Tipo_Cuenta').AsString) = '2' then FieldByName('OT_Tipo_Cuenta_Descripcion').AsString := 'Cobro';
        if Trim(FieldByName('Tipo_Cuenta').AsString) = '3' then FieldByName('OT_Tipo_Cuenta_Descripcion').AsString := 'Pago/Cobro';
        if Trim(FieldByName('Tipo_Cuenta').AsString) = '4' then FieldByName('OT_Tipo_Cuenta_Descripcion').AsString := 'Impagado';
    end;
end;

procedure Tform_cuentas_pagos_cobros_000.FormActivate(Sender: TObject);
begin
    If public_Elegimos = true then
    begin
         BitBtn_Seleccionar.Visible := True;
         BitBtn_Imprimir.Visible  := False;
    end;

    if public_Solo_Ver = true then no_Tocar;
end;

procedure Tform_cuentas_pagos_cobros_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     if private_Salir_OK = False then
         begin
           { ********************************************************************
             Intento BitBtn_SALIR de la aplicación de un modo no permitido.
             ********************************************************************
             Pero si desde el menu principal está a true la variable
             public_Salir_Ok, significa que hay que salir si o si pues se pulsó
             cancelar al preguntar otra vez por la contraseña
             ******************************************************************** }
             if form_Menu.public_Salir_OK = False then CloseAction := caNone;
         end
     else
         begin
           { ********************************************************************
             Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
             ******************************************************************** }
         end;
end;

procedure Tform_cuentas_pagos_cobros_000.FormDestroy(Sender: TObject);
begin
     Cerramos_Tablas;
end;

procedure Tform_cuentas_pagos_cobros_000.SQLQuery_Cuentas_Pagos_CobrosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'cuentas_pagos_cobros',
                      DataModule_Cuentas_Pagos_Cobros.SQLTransaction,
                      SQLQuery_Cuentas_Pagos_Cobros );

    Refrescar_Registros;
end;

procedure Tform_cuentas_pagos_cobros_000.SQLQuery_Cuentas_Pagos_CobrosAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_cuentas_pagos_cobros_000.SQLQuery_Cuentas_Pagos_CobrosBeforePost(DataSet: TDataSet);
begin
     UTI_RGTRO_param_assign_value( SQLQuery_Cuentas_Pagos_Cobros );
end;

procedure Tform_cuentas_pagos_cobros_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
end;

procedure Tform_cuentas_pagos_cobros_000.RadioGroup_BajasClick(Sender: TObject);
begin
     Refrescar_Registros;
end;

procedure Tform_cuentas_pagos_cobros_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_cuentas_pagos_cobros_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_cuentas_pagos_cobros_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_cuentas_pagos_cobros_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Cuentas_Pagos_Cobros, Rect, DataCol, Column, State );
end;

procedure Tform_cuentas_pagos_cobros_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_cuentas_pagos_cobros_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_cuentas_pagos_cobros_000.DBGrid_PrincipalTitleClick(Column: TColumn);
begin
    private_Last_Column := UTI_GEN_Ordenar_dbGrid( private_Last_Column,
                                                   Column,
                                                   SQLQuery_Cuentas_Pagos_Cobros );
end;

procedure Tform_cuentas_pagos_cobros_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbInsert : begin
            Insertar_Registro;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro;
            Abort;
        end;

        nbDelete : begin
            if UTI_usr_Permiso_SN(public_Menu_Worked, 'B', True) = True then
            begin
                UTI_RGTRO_Borrar( SQLQuery_Cuentas_Pagos_Cobros,
                                  public_Solo_Ver,
                                  public_Menu_Worked );
            end;
            Abort;
        end;

        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_cuentas_pagos_cobros_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_usr_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Cuentas_Pagos_Cobros.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'cuentas_pagos_cobros',
                                           SQLQuery_Cuentas_Pagos_Cobros,
                                           DataSource_CtasPC,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_cuentas_pagos_cobros_000.BitBtn_ImprimirClick(Sender: TObject);
var var_msg          : TStrings;
    var_form_Informe : Tform_Informe;
begin
    if UTI_usr_Permiso_SN(public_Menu_Worked, 'I', True) = True then
    begin
        if public_Solo_Ver = True then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('Sólo se puede visualizar.');
            UTI_GEN_Aviso(var_msg, 'SOLO PARA OBSERVAR', True, False);
            var_msg.Free;
            Exit;
        end;

        var_form_Informe := Tform_Informe.Create(nil);
        var_form_Informe.frDBDataSet1.DataSource := DataSource_CtasPC;
        var_form_Informe.public_Menu_Worked      := public_Menu_Worked;
        var_form_Informe.public_informe          := 'informes/cuentas_pagos_cobros.lrf';
        var_form_Informe.ShowModal;
        var_form_Informe.Free;
    end;
end;

procedure Tform_cuentas_pagos_cobros_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

function Tform_cuentas_pagos_cobros_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_DeleteSQL    : String;
    var_UpdateSQL    : String;
    var_InsertSQL    : String;
    var_ctdad_Rgtros : Integer;
    var_nombre_tabla : ShortString;
    VAR_SQL_SELECT   : String;
    // VAR_SQL_ORDER_BY : String;
begin
    var_DeleteSQL    := '';

    var_UpdateSQL    := 'UPDATE cuentas_pagos_cobros' +
                          ' SET descripcion = :descripcion,' +

                              ' Cuenta_Contable = :Cuenta_Contable,' +
                              ' Modalidad = :Modalidad,' +
                              ' Tipo_Cuenta = :Tipo_Cuenta,' +

                              ' Insert_WHEN = :Insert_WHEN,' +
                              ' Insert_Id_User = :Insert_Id_User,' +
                              ' Del_WHEN = :Del_WHEN,' +
                              ' Del_Id_User = :Del_Id_User,' +
                              ' Del_WHY = :Del_WHY,' +
                              ' Change_WHEN = :Change_WHEN,' +
                              ' Change_Id_User = :Change_Id_User' +
                        ' WHERE id = :id';

    var_InsertSQL    := 'INSERT INTO cuentas_pagos_cobros' +
                          ' ( descripcion,' +

                            ' Cuenta_Contable,' +
                            ' Modalidad,' +
                            ' Tipo_Cuenta,' +

                            ' Insert_WHEN, Insert_Id_User,' +
                            ' Del_WHEN, Del_Id_User, Del_WHY,' +
                            ' Change_WHEN, Change_Id_User )' +
                       ' VALUES' +
                          ' ( :descripcion,' +

                            ' :Cuenta_Contable,' +
                            ' :Modalidad,' +
                            ' :Tipo_Cuenta,' +

                            ' :Insert_WHEN, :Insert_Id_User,' +
                            ' :Del_WHEN, :Del_Id_User, :Del_WHY,' +
                            ' :Change_WHEN, :Change_Id_User )';

    var_nombre_tabla := 'cpc';
    var_ctdad_Rgtros := 20;

    VAR_SQL_SELECT   := 'SELECT cpc.* ' +
                          'FROM cuentas_pagos_cobros AS cpc ';

    // var_SQL_ORDER_BY :=  'ORDER BY m.descripcion ASC';

    Result := UTI_TB_Filtrar( private_Order_By,

                              var_DeleteSQL,
                              var_UpdateSQL,
                              var_InsertSQL,

                              var_ctdad_Rgtros,
                              DataModule_Cuentas_Pagos_Cobros.SQLTransaction,
                              DataModule_Cuentas_Pagos_Cobros.SQLConnector,
                              SQLQuery_Cuentas_Pagos_Cobros,

                              var_nombre_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              VAR_SQL_SELECT,
                              // var_SQL_ORDER_BY,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,

                              param_Cambiamos_Filtro );

    UTI_GEN_Borrar_Imagen_Orden_Grid(private_Last_Column);

    //Filtrar_tablas_ligadas;
end;

procedure Tform_cuentas_pagos_cobros_000.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Cuentas_Pagos_Cobros.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Cuentas_Pagos_Cobros.FieldByName('descripcion').Value;
    end;

    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );

    if Trim(var_descripcion) <> '' then
    begin
        SQLQuery_Cuentas_Pagos_Cobros.Locate( 'descripcion',
                                              var_descripcion,
                                              [] );
    end;
end;

procedure Tform_cuentas_pagos_cobros_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Cuentas_Pagos_Cobros.RecordCount = 0 then Exit;

    if SQLQuery_Cuentas_Pagos_Cobros.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

  { EJEMPLO
    // ********************************************************************************************* //
    // ** CLIENTES_CONTACTOS                                                                      ** //
    // ********************************************************************************************* //
    UTI_RGTRO_Pasar_Valor_Campo( true,
                                 var_Lineas_Filtro,
                                 SQLQuery_tabla_principal.FieldByName('id').AsString,
                                 'xx.id_campo_a_pasar_valor_id_anterior',
                                 false );
    var_Lineas_OrderBy.Clear;
    Filtrar_tabla_ligada( private_Last_Column, RadioGroup_Bajas.ItemIndex, false, var_Lineas_Filtro, var_Lineas_OrderBy );
  }

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_cuentas_pagos_cobros_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_cuentas_pagos_cobros_000.Insertar_Registro;
var var_msg  : TStrings;
    var_Form : Tform_cuentas_pagos_cobros_001;
begin
    with SQLQuery_Cuentas_Pagos_Cobros do
    begin
        var_msg := TStringList.Create;

        if UTI_usr_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
                begin
                    var_msg.Add('Sólo se puede visualizar.');
                    UTI_GEN_Aviso(var_msg, 'SOLO PARA OBSERVAR', True, False);
                end
            else
                begin
                    Insert ;

                    var_Form := Tform_cuentas_pagos_cobros_001.Create(nil);

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            Post;
                        end
                    else Cancel;

                    var_Form.Free;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_cuentas_pagos_cobros_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_cuentas_pagos_cobros_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Cuentas_Pagos_Cobros.SQLConnector,
                      DataModule_Cuentas_Pagos_Cobros.SQLTransaction,
                      SQLQuery_Cuentas_Pagos_Cobros ) = false then UTI_GEN_Salir;

    DataModule_Cuentas_Pagos_Cobros.Free;
end;

procedure Tform_cuentas_pagos_cobros_000.Cerramos_Tablas_Ligadas;
begin
    { ESTE form NO TIENE TABLAS LIGADAS

        if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                          DataModule_Users.SQLTransaction_de_la_tabla,
                          SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
    }
end;

procedure Tform_cuentas_pagos_cobros_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_cuentas_pagos_cobros_000.FormCreate(Sender: TObject);
begin
    { ****************************************************************************
      Obligado en cada formulario para no olvidarlo
      **************************************************************************** }
      with Self do
      begin
          Position    := poScreenCenter;
          BorderIcons := [];
          BorderStyle := bsSingle;
      end;

      private_Salir_OK := false;

    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      DBGrid_Principal.TitleImageList := Form_Menu.ImageList_Grid_Sort;
      public_Solo_Ver                 := false;
      public_Elegimos                 := false;

      public_Rgtro_Seleccionado       := false;
end;

procedure Tform_cuentas_pagos_cobros_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Cuentas_Pagos_Cobros') = False then
    begin
        DataModule_Cuentas_Pagos_Cobros := TDataModule_Cuentas_Pagos_Cobros.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'cpc.descripcion ASC';

    private_Order_By[1].Titulo       := 'Por la id';
    private_Order_By[1].Memo_OrderBy := 'cpc.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

  { ****************************************************************************
    Filtramos los datos
    **************************************************************************** }
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );

    Presentar_Datos;
end;

procedure Tform_cuentas_pagos_cobros_000.SQLQuery_Cuentas_Pagos_CobrosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Cuentas_Pagos_Cobros );
end;

procedure Tform_cuentas_pagos_cobros_000.Editar_Registro;
var var_msg  : TStrings;
    var_Form : Tform_cuentas_pagos_cobros_001;
begin
    with SQLQuery_Cuentas_Pagos_Cobros do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                if UTI_usr_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    Edit;

                    var_Form := Tform_cuentas_pagos_cobros_001.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            if (Trim(Params.ParamByName('COPY_' + 'descripcion').AsString) <> Trim(FieldByName('descripcion').AsString)) or
                               (Trim(Params.ParamByName('COPY_' + 'Modalidad').AsString)   <> Trim(FieldByName('Modalidad').AsString))   or
                               (Trim(Params.ParamByName('COPY_' + 'Tipo_Cuenta').AsString) <> Trim(FieldByName('Tipo_Cuenta').AsString)) then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    Post;
                               end
                            else Cancel;
                        end
                    else Cancel;

                    var_Form.Free;
                end;
            end
        else
            begin
                var_msg.Add('No hay registros.');
                UTI_GEN_Aviso(var_msg, '¿QUE VAS A VER?', True, False);
            end;
    end;
    var_msg.Free;
end;

end.

