unit FyPTFicheroAdeudosSEPA;

interface

uses
  Windows, Classes, ADODB;

type
  {CABECERA DE PRESENTADOR}
  TCabeceraPresentadorSEPA = class
  private
    FCodigoRegistro: String;            // [2]
    FVersionCuaderno: String;           // [5]
    FNumeroDato: String;                // [3]

    // CIF
    FIdentificadorPresentador: String;  // [35]
    FNombrePresentador: String;         // [70]

    FRemesaID: String;                  // [3]
//    FFechaCreacionFichero: String;      // [8]
    FIdentificacionFichero: String;     // [35]

    FEntidadReceptora: String;          // [4]
    FOficinaReceptora: String;          // [4]

    FTextoLibre: WideString;            // [434]

    ////////////////// Total.........   // [600]

    // [2]
    function GetCodigoRegistro: String;
//    procedure SetCodigoRegistro(Value: String);

    // [5]
    function GetVersionCuaderno: String;
//    procedure SetVersionCuaderno(Value: String);

    // [3]
    function GetNumeroDato: String;
//    procedure SetNumeroDato(Value: String);

    // [35]
    function GetIdentificadorPresentador: String;
    procedure SetIdentificadorPresentador(Value: String);

    // [70]
    function GetNombrePresentador: String;
    procedure SetNombrePresentador(Value: String);

    // [35]
    function GetIdentificacionFichero: String;
//    procedure SetIdentificacionFichero(Value: String);

    // [8]
    function GetFechaCreacionFichero: String;
//    procedure SetFechaCreacionFichero(Value: String);

    // [4]
    function GetEntidadReceptora: String;
//    procedure SetEntidadReceptora(Value: String);

    // [4]
    function GetOficinaReceptora: String;
//    procedure SetOficinaReceptora(Value: String);

    // [434]
    function GetTextoLibre: WideString;
    procedure SetTextoLibre(Value: WideString);

    // [600]
    function GetAllToStringLine: WideString;
  protected
  public
    constructor Create;
  published
    // [5] RemesaID, Esto es a nivel interno que representa al numero de remesa
    // para poder buscarlo en los fichero de Remesas no forma parte
    // del fichero SEPA

    property CodigoRegistro: String read GetCodigoRegistro; // write SetCodigoRegistro;
    property VersionCuaderno: String read GetVersionCuaderno; // write SetVersionCuaderno;
    property NumeroDato: String read GetNumeroDato; // write SetNumeroDato;
    property IdentificadorPresentador: String read GetIdentificadorPresentador write SetIdentificadorPresentador;
    property NombrePresentador: String read GetNombrePresentador write SetNombrePresentador;
    property RemesaID: String read FRemesaID write FRemesaID;
    property IdentificacionFichero: String read GetIdentificacionFichero; // write SetIdentificacionFichero;
    property FechaCreacionFichero: String read GetFechaCreacionFichero; // write SetFechaCreacionFichero;
    property EntidadReceptora: String read GetEntidadReceptora; // write SetEntidadReceptora;
    property OficinaReceptora: String read GetOficinaReceptora; // write SetOficinaReceptora;
    property TextoLibre: WideString read GetTextoLibre write SetTextoLibre;

    property TodoTexto: WideString read GetAllToStringLine;
  end;

  {REGISTRO DE CABECERA DE ACRREDOR POR FECHA DE COBRO}
  TCabeceraAcreedorFechaCobroSEPA = class
  private
    FpCabeceraPresentadorSEPA: TCabeceraPresentadorSEPA;

    FCodigoRegistro: String;            // [2]
//    FVersionCuaderno: String;           // [5]
    FNumeroDato: String;                // [3]

    // CIF
    FIdentificadorAcreedor: String;     // [35]
    FFechaCobro: String;                // [8]
    FNombreAcreedor: String;            // [70]
    FDireccionAcreedorD1: String;       // [50]
    FDireccionAcreedorD2: String;       // [50]
    FDireccionAcreedorD3: String;       // [40]
    FPaisAcreedor: String;              // [2]

    FCuentaAcreedor: String;            // [34]

    FTextoLibre: WideString;            // [301]

    ////////////////// Total.........   // [600]

    // [2]
    function GetCodigoRegistro: String;
//    procedure SetCodigoRegistro(Value: String);

    // [5]
    function GetVersionCuaderno: String;
//    procedure SetVersionCuaderno(Value: String);

    // [3]
    function GetNumeroDato: String;
//    procedure SetNumeroDato(Value: String);

    // [35]
    function GetIdentificadorAcreedor: String;
    procedure SetIdentificadorAcreedor(Value: String);

    // [8]
    function GetFechaCobro: String;
    procedure SetFechaCobro(Value: String);

    // [70]
    function GetNombreAcreedor: String;
    procedure SetNombreAcreedor(Value: String);

    // [50]
    function GetDireccionAcreedorD1: String;
    procedure SetDireccionAcreedorD1(Value: String);

    // [50]
    function GetDireccionAcreedorD2: String;
    procedure SetDireccionAcreedorD2(Value: String);

    // [40]
    function GetDireccionAcreedorD3: String;
    procedure SetDireccionAcreedorD3(Value: String);

    // [2]
    function GetPaisAcreedor: String;
    procedure SetPaisAcreedor(Value: String);

    // [34]
    function GetCuentaAcreedor: String;
    procedure SetCuentaAcreedor(Value: String);

    // [301]
    function GetTextoLibre: WideString;
    procedure SetTextoLibre(Value: WideString);

    // [600]
    function GetAllToStringLine: WideString;
  protected
  public
    constructor Create(lpCabeceraPresentadorSEPA: TCabeceraPresentadorSEPA);
  published
    property CodigoRegistro: String read GetCodigoRegistro; // write SetCodigoRegistro;
    property VersionCuaderno: String read GetVersionCuaderno; // write SetVersionCuaderno;
    property NumeroDato: String read GetNumeroDato; // write SetNumeroDato;
    property IdentificadorAcreedor: String read GetIdentificadorAcreedor write SetIdentificadorAcreedor;
    property FechaCobro: String read GetFechaCobro write SetFechaCobro;
    property NombreAcreedor: String read GetNombreAcreedor write SetNombreAcreedor;
    property DireccionAcreedorD1: String read GetDireccionAcreedorD1 write SetDireccionAcreedorD1;
    property DireccionAcreedorD2: String read GetDireccionAcreedorD2 write SetDireccionAcreedorD2;
    property DireccionAcreedorD3: String read GetDireccionAcreedorD3 write SetDireccionAcreedorD3;
    property PaisAcreedor: String read GetPaisAcreedor write SetPaisAcreedor;
    property CuentaAcreedor: String read GetCuentaAcreedor write SetCuentaAcreedor;
    property TextoLibre: WideString read GetTextoLibre write SetTextoLibre;

    property TodoTexto: WideString read GetAllToStringLine;
  end;

  {REGISTROS INDIVIDUALES DE ADEUDOS, REGISTRO 1º INDIVIDUAL OBLIGATORIO}
  TRegistroIndividualAdeudoOEMSEPA = class
  private
    FpCabeceraAcreedorFechaCobroSEPA: TCabeceraAcreedorFechaCobroSEPA;

    FCodigoRegistro: String;              // [2]
//    FVersionCuaderno: String;             // [5]
    FNumeroDato: String;                  // [3]

    FReferenciaAdeudo: String;            // [35]
    FReferenciaUnicaMandato: String;      // [35]
    FTipoAdeudo: String;                  // [4]
    FCategoriaProposito: String;          // [4]
    FImporteAdeudo: String;               // [11]
    FFechaFirmaMandato: String;           // [8]
    FEntidadDeudor: String;               // [11]
    FNombreDeudor: String;                // [70]
    FDireccionDeudorD1: String;           // [50]
    FDireccionDeudorD2: String;           // [50]
    FDireccionDeudorD3: String;           // [40]
    FPaisDeudor: String;                  // [2]
    FTipoIdentificacionDeudor: String;    // [1]
    FIdentificacionDeudor: String;        // [36]
    FIdentificacionDeudorEmisor: String;  // [35]
    FIdentificadorCuentaDeudor: String;   // [1]
    FCuentaDeudor: String;                // [34]
    FPropositoAdeudo: String;             // [4]
    FConcepto: String;                    // [140]
    FTextoLibre: String;                  // [19]

    //////////////////// Total.........   // [600]

    // [2]
    function GetCodigoRegistro: String;
//    procedure SetCodigoRegistro(Value: String);

    // [5]
    function GetVersionCuaderno: String;
//    procedure SetVersionCuaderno(Value: String);

    // [3]
    function GetNumeroDato: String;
//    procedure SetNumeroDato(Value: String);

    // [35]
    function GetReferenciaAdeudo: String;
    procedure SetReferenciaAdeudo(Value: String);

    // [35]
    function GetReferenciaUnicaMandato: String;
    procedure SetReferenciaUnicaMandato(Value: String);

    // [4]
    function GetTipoAdeudo: String;
    procedure SetTipoAdeudo(Value: String);

    // [4]
    function GetCategoriaProposito: String;
    procedure SetCategoriaProposito(Value: String);

    // [11]
    function GetImporteAdeudo: String;
    procedure SetImporteAdeudo(Value: String);

    // [8]
    function GetFechaFirmaMandato: String;
    procedure SetFechaFirmaMandato(Value: String);

    // [11]
    function GetEntidadDeudor: String;
    procedure SetEntidadDeudor(Value: String);

    // [70]
    function GetNombreDeudor: String;
    procedure SetNombreDeudor(Value: String);

    // [50]
    function GetDireccionDeudorD1: String;
    procedure SetDireccionDeudorD1(Value: String);

    // [50]
    function GetDireccionDeudorD2: String;
    procedure SetDireccionDeudorD2(Value: String);

    // [40]
    function GetDireccionDeudorD3: String;
    procedure SetDireccionDeudorD3(Value: String);

    // [2]
    function GetPaisDeudor: String;
    procedure SetPaisDeudor(Value: String);

    // [1]
    function GetTipoIdentificacionDeudor: String;
    procedure SetTipoIdentificacionDeudor(Value: String);

    // [36]
    function GetIdentificacionDeudor: String;
    procedure SetIdentificacionDeudor(Value: String);

    // [35]
    function GetIdentificacionDeudorEmisor: String;
    procedure SetIdentificacionDeudorEmisor(Value: String);

    // [1]
    function GetIdentificadorCuentaDeudor: String;
    procedure SetIdentificadorCuentaDeudor(Value: String);

    // [34]
    function GetCuentaDeudor: String;
    procedure SetCuentaDeudor(Value: String);

    // [4]
    function GetPropositoAdeudo: String;
    procedure SetPropositoAdeudo(Value: String);

    // [140]
    function GetConcepto: String;
    procedure SetConcepto(Value: String);

    // [19]
    function GetTextoLibre: String;
    procedure SetTextoLibre(Value: String);

    // [600]
    function GetAllToStringLine: WideString;
  protected
  public
    constructor Create(lpCabeceraAcreedorFechaCobroSEPA: TCabeceraAcreedorFechaCobroSEPA);
  published
    property CodigoRegistro: String read GetCodigoRegistro; // write SetCodigoRegistro;
    property VersionCuaderno: String read GetVersionCuaderno; // write SetVersionCuaderno;
    property NumeroDato: String read GetNumeroDato; // write SetNumeroDato;
    property ReferenciaAdeudo: String read GetReferenciaAdeudo write SetReferenciaAdeudo;
    property ReferenciaUnicaMandato: String read GetReferenciaUnicaMandato write SetReferenciaUnicaMandato;
    property TipoAdeudo: String read GetTipoAdeudo write SetTipoAdeudo;
    property CategoriaProposito: String read GetCategoriaProposito write SetCategoriaProposito;
    property ImporteAdeudo: String read GetImporteAdeudo write SetImporteAdeudo;
    property FechaFirmaMandato: String read GetFechaFirmaMandato write SetFechaFirmaMandato;
    property EntidadDeudor: String read GetEntidadDeudor write SetEntidadDeudor;
    property NombreDeudor: String read GetNombreDeudor write SetNombreDeudor;
    property DireccionDeudorD1: String read GetDireccionDeudorD1 write SetDireccionDeudorD1;
    property DireccionDeudorD2: String read GetDireccionDeudorD2 write SetDireccionDeudorD2;
    property DireccionDeudorD3: String read GetDireccionDeudorD3 write SetDireccionDeudorD3;
    property PaisDeudor: String read GetPaisDeudor write SetPaisDeudor;
    property TipoIdentificacionDeudor: String read GetTipoIdentificacionDeudor write SetTipoIdentificacionDeudor;
    property IdentificacionDeudor: String read GetIdentificacionDeudor write SetIdentificacionDeudor;
    property IdentificacionDeudorEmisor: String read GetIdentificacionDeudorEmisor write SetIdentificacionDeudorEmisor;
    property IdentificadorCuentaDeudor: String read GetIdentificadorCuentaDeudor write SetIdentificadorCuentaDeudor;
    property CuentaDeudor: String read GetCuentaDeudor write SetCuentaDeudor;
    property PropositoAdeudo: String read GetPropositoAdeudo write SetPropositoAdeudo;
    property Concepto: String read GetConcepto write SetConcepto;
    property TextoLibre: String read GetTextoLibre write SetTextoLibre;

    property TodoTexto: WideString read GetAllToStringLine;
  end;

  TRegistroIndividualAdeudoSEPA = class(TRegistroIndividualAdeudoOEMSEPA)
  private
    FRegistroIndividualAdeudo: TList;
    FpCabeceraAcreedorFechaCobroSEPA: TCabeceraAcreedorFechaCobroSEPA;

    function GetCount: Integer;
    function GetCountToString: String;
    function GetTotalAmount: Extended;
    function GetTotalAmountToString: String;

    function GetAllToStringLine: WideString;
  protected
  public
    constructor Create(lpCabeceraAcreedorFechaCobroSEPA: TCabeceraAcreedorFechaCobroSEPA);
    destructor Destroy; override;

    function Add: TRegistroIndividualAdeudoOEMSEPA;
    procedure Append(ReferenciaAdeudo, ReferenciaUnicaMandato, ImporteAdeudo,
      FechaFirmaMandato, EntidadDeudor, NombreDeudor, DireccionDeudorD1,
      DireccionDeudorD2, DireccionDeudorD3, IdentificacionDeudor, CuentaDeudor,
      Concepto, TextoLibre: String);
  published
    property Count: Integer read GetCount;
    property CountToString: String read GetCountToString;
    property TotalAmount: Extended read GetTotalAmount;
    property TotalAmountToString: String read GetTotalAmountToString;

    property TodoTexto: WideString read GetAllToStringLine;
  end;

  {REGISTROS DE TOTALES DE ACREEDOR POR FECHA DE COBRO}
  TRegistrosTotalesAcreedorFechaCobroSEPA = class
  private
    FpRegistroIndividualAdeudoSEPA: TRegistroIndividualAdeudoSEPA;

    FCodigoRegistro: String;              // [2]

//    FIdentificadorAcreedor: String;       // [35]
//    FFechaCobro: String;                  // [8]
//    FTotalImportes: String;               // [17]
//    FNumeroAdeudos: String;               // [8]
//    FTotalRegistros: String;              // [10]
    FTextoLibre: WideString;              // [520]

    //////////////////// Total.........   // [600]

    // [2]
    function GetCodigoRegistro: String;
//    procedure SetCodigoRegistro(Value: String);

    // [35]
    function GetIdentificadorAcreedor: String;
//    procedure SetIdentificadorAcreedor(Value: String);

    // [8]
    function GetFechaCobro: String;
//    procedure SetFechaCobro(Value: String);

    // [17]
    function GetTotalImportes: String;
//    procedure SetTotalImportes(Value: String);

    // [8]
    function GetNumeroAdeudos: String;
//    procedure SetNumeroAdeudos(Value: String);

    // [10]
    function GetTotalRegistros: String;
//    procedure SetTotalRegistros(Value: String);

    // [520]
    function GetTextoLibre: WideString;
    procedure SetTextoLibre(Value: WideString);

    // [600]
    function GetAllToStringLine: WideString;
  protected
  public
    constructor Create(lpRegistroIndividualAdeudoSEPA: TRegistroIndividualAdeudoSEPA);
  published
    property CodigoRegistro: String read GetCodigoRegistro; // write SetCodigoRegistro;
    property IdentificadorAcreedor: String read GetIdentificadorAcreedor; // write SetIdentificadorAcreedor;
    property FechaCobro: String read GetFechaCobro; // write SetFechaCobro;
    property TotalImportes: String read GetTotalImportes; // write SetTotalImportes;
    property NumeroAdeudos: String read GetNumeroAdeudos; // write SetNumeroAdeudos;
    property TotalRegistros: String read GetTotalRegistros; // write SetTotalRegistros;
    property TextoLibre: WideString read GetTextoLibre write SetTextoLibre;

    property TodoTexto: WideString read GetAllToStringLine;
  end;

  {REGISTROS DE TOTALES DE ACREEDOR}
  TRegistrosTotalesAcreedorSEPA = class
  private
    FpRegistrosTotalesAcreedorFechaCobro: TRegistrosTotalesAcreedorFechaCobroSEPA;

    FCodigoRegistro: String;          // [2]

//    FIdentificadorAcreedor: String;   // [35]
//    FTotalImportes: String;           // [17]
//    FNumeroAdeudos: String;           // [8]
//    FTotalRegistros: String;          // [10]
    FTextoLibre: String;              // [528]

    //////////////// Total.........   // [600]

    // [2]
    function GetCodigoRegistro: String;
//    procedure SetCodigoRegistro(Value: String);

    // [35]
    function GetIdentificadorAcreedor: String;
//    procedure SetIdentificadorAcreedor(Value: String);

    // [17]
    function GetTotalImportes: String;
//    procedure SetTotalImportes(Value: String);

    // [8]
    function GetNumeroAdeudos: String;
//    procedure SetNumeroAdeudos(Value: String);

    // [10]
    function GetTotalRegistros: String;
//    procedure SetTotalRegistros(Value: String);

    // [528]
    function GetTextoLibre: String;
    procedure SetTextoLibre(Value: String);

    // [600]
    function GetAllToStringLine: WideString;
  protected
  public
    constructor Create(lpRegistrosTotalesAcreedorFechaCobro: TRegistrosTotalesAcreedorFechaCobroSEPA);
  published
    property CodigoRegistro: String read GetCodigoRegistro; // write SetCodigoRegistro;
    property IdentificadorAcreedor: String read GetIdentificadorAcreedor; // write SetIdentificadorAcreedor;
    property TotalImportes: String read GetTotalImportes; // write SetTotalImportes;
    property NumeroAdeudos: String read GetNumeroAdeudos; // write SetNumeroAdeudos;
    property TotalRegistros: String read GetTotalRegistros; // write SetTotalRegistros;
    property TextoLibre: String read GetTextoLibre write SetTextoLibre;

    property TodoTexto: WideString read GetAllToStringLine;
  end;

  {REGISTRO DE TOTALES GENERAL}
  TRegistroTotalesGeneralSEPA = class
  private
    FpRegistrosTotalesAcreedor: TRegistrosTotalesAcreedorSEPA;

    FCodigoRegistro: String;          // [2]
//    FTotalImportesGeneral: String;    // [17]
//    FNumeroRegistros: String;         // [8]
//    FTotalRegistros: String;          // [10]
    FTextoLibre: WideString;          // [563]

    //////////////// Total.........   // [600]

    // [2]
    function GetCodigoRegistro: String;
//    procedure SetCodigoRegistro(Value: String);

    // [17]
    function GetTotalImportesGeneral: String;
//    procedure SetTotalImportesGeneral(Value: String);

    // [8]
    function GetNumeroRegistros: String;
//    procedure SetNumeroRegistros(Value: String);

    // [10]
    function GetTotalRegistros: String;
//    procedure SetTotalRegistros(Value: String);

    // [563]
    function GetTextoLibre: WideString;
    procedure SetTextoLibre(Value: WideString);

    // [600]
    function GetAllToStringLine: WideString;
  protected
  public
    constructor Create(lpRegistrosTotalesAcreedor: TRegistrosTotalesAcreedorSEPA);
  published
    property CodigoRegistro: String read GetCodigoRegistro; // write SetCodigoRegistro;
    property TotalImportesGeneral: String read GetTotalImportesGeneral; // write SetTotalImportesGeneral;
    property NumeroRegistros: String read GetNumeroRegistros; // write SetNumeroRegistros;
    property TotalRegistros: String read GetTotalRegistros; // write SetTotalRegistros;
    property TextoLibre: WideString read GetTextoLibre write SetTextoLibre;

    property TodoTexto: WideString read GetAllToStringLine;
  end;

  {FICHERO SEPA OEM}
  TFicheroSEPAOEM = class
  private
    FCabeceraPresentador: TCabeceraPresentadorSEPA;
    FCabeceraAcreedorFechaCobro: TCabeceraAcreedorFechaCobroSEPA;
    FIndividualAdeudo: TRegistroIndividualAdeudoSEPA;
    FTotalesAcreedorFechaCobro: TRegistrosTotalesAcreedorFechaCobroSEPA;
    FTotalesAcreedor: TRegistrosTotalesAcreedorSEPA;
    FTotalesGeneral: TRegistroTotalesGeneralSEPA;

    procedure SetIdentificadorPresentador(Value: String);
    procedure SetNombrePresentador(Value: String);
//    procedure SetIdentificacionFichero(Value: String);

    procedure SetIdentificadorAcreedor(Value: String);
    procedure SetNombreAcreedor(Value: String);
    procedure SetDireccionAcreedorD1(Value: String);
    procedure SetDireccionAcreedorD2(Value: String);
    procedure SetDireccionAcreedorD3(Value: String);
    procedure SetFechaCobro(Value: String);
    procedure SetCuentaAcreedor(Value: String);
  protected
  public
    constructor Create;
    destructor Destroy; override;

    procedure SaveToFileSEPA(FileName: WideString);

    function AddIndividualAdeudo: TRegistroIndividualAdeudoOEMSEPA;
    procedure AppendIndividualAdeudo(ReferenciaAdeudo, ReferenciaUnicaMandato,
      ImporteAdeudo, FechaFirmaMandato, EntidadDeudor, NombreDeudor,
      DireccionDeudorD1, DireccionDeudorD2, DireccionDeudorD3,
      IdentificacionDeudor, CuentaDeudor, Concepto, TextoLibre: String);

  published
    property IdentificadorPresentador: String write SetIdentificadorPresentador;
    property NombrePresentador: String write SetNombrePresentador;

    property IdentificadorAcreedor: String write SetIdentificadorAcreedor;
    property NombreAcreedor: String write SetNombreAcreedor;
    property DireccionAcreedorD1: String write SetDireccionAcreedorD1;
    property DireccionAcreedorD2: String write SetDireccionAcreedorD2;
    property DireccionAcreedorD3: String write SetDireccionAcreedorD3;
    property FechaCobro: String write SetFechaCobro;
    property CuentaAcreedor: String write SetCuentaAcreedor;

    property CabeceraPresentador: TCabeceraPresentadorSEPA read FCabeceraPresentador write FCabeceraPresentador;
    property CabeceraAcreedorFechaCobro: TCabeceraAcreedorFechaCobroSEPA read FCabeceraAcreedorFechaCobro write FCabeceraAcreedorFechaCobro;
    property IndividualAdeudo: TRegistroIndividualAdeudoSEPA read FIndividualAdeudo write FIndividualAdeudo;
    property TotalesAcreedorFechaCobro: TRegistrosTotalesAcreedorFechaCobroSEPA read FTotalesAcreedorFechaCobro write FTotalesAcreedorFechaCobro;
    property TotalesAcreedor: TRegistrosTotalesAcreedorSEPA read FTotalesAcreedor write FTotalesAcreedor;
    property TotalesGeneral: TRegistroTotalesGeneralSEPA read FTotalesGeneral write FTotalesGeneral;
  end;

  {FICHERO SEPA OEM}
  TFicheroSEPA = class(TFicheroSEPAOEM)
  private
  protected
  public
    constructor CreateRemittance(IDRemittance,
      IDBankRemittanceSEPA: Integer; ConnectionString: WideString);
  published
    property IdentificadorPresentador;
    property NombrePresentador;

    property IdentificadorAcreedor;
    property NombreAcreedor;
    property DireccionAcreedorD1;
    property DireccionAcreedorD2;
    property DireccionAcreedorD3;
    property FechaCobro;
    property CuentaAcreedor;

    property CabeceraPresentador;
    property CabeceraAcreedorFechaCobro;
    property IndividualAdeudo;
    property TotalesAcreedorFechaCobro;
    property TotalesAcreedor;
    property TotalesGeneral;
  end;

implementation

uses SysUtils;

function Space(SpcAlign: TAlignment; Spc: SmallInt; const Value: WideString): WideString;
var
  nI: SmallInt;
  AValue: WideString;
begin
  Result := '';

  AValue := Value;
  if (Length(AValue) > Spc) then
    AValue := Copy(AValue, 1, Spc);

  for nI := 1 to (Spc - Length(AValue)) do
    Result := Result + ' ';

  // Espacio a la Derecha
  if (SpcAlign = taRightJustify) then
    Result := AValue + Result;

  // Espacio a la Izquierda
  if (SpcAlign = taLeftJustify) then
    Result := Result + AValue;
end;

function ZeroLR(ZroAlign: TAlignment; const Zr: Byte; Value: String): String;
var
  nI: Byte;
begin
  Result := '';

  for nI := 1 to (Zr - Length(Value)) do
    Result := Result + '0';

  // Ceros a la Derecha
  if (ZroAlign = taRightJustify) then
    Result := Value + Result;

  // Ceros a la Izquierda
  if (ZroAlign = taLeftJustify) then
    Result := Result + Value;
end;

{TCabeceraPresentadorSEPA}
constructor TCabeceraPresentadorSEPA.Create;
begin
  inherited Create;

  // ALGUNOS DATOS SON FIJOS (SOLO LECTURA) Y OTROS SE PUEDEN MODIFICAR
  FCodigoRegistro           := '01';      // [2] --> SOLO LECTURA
  FVersionCuaderno          := '19143';   // [5] --> SOLO LECTURA
  FNumeroDato               := '001';     // [3] --> SOLO LECTURA

  FIdentificadorPresentador := '';  // [35]
  FNombrePresentador        := '';  // [70]

  // el %s contiene el numero de remesa de 5 caracteres.
  FIdentificacionFichero    := FormatDateTime('"PRE"yyyymmddhhnnss"%sRMS"', now);  // [35]
//  FFechaCreacionFichero     := Copy(FIdentificacionFichero, 4, 8);               // [8]

  FRemesaID                 := '';

  FEntidadReceptora         := '';  // [4]
  FOficinaReceptora         := '';  // [4]

  FTextoLibre               := '';  // [434]
end;

// [2]
function TCabeceraPresentadorSEPA.GetCodigoRegistro: String;
begin
  Result := FCodigoRegistro;
end;

{
procedure TCabeceraPresentadorSEPA.SetCodigoRegistro(Value: String);
begin
  FCodigoRegistro := Value;
end;
}

// [5]
function TCabeceraPresentadorSEPA.GetVersionCuaderno: String;
begin
  Result := FVersionCuaderno;
end;

{
procedure TCabeceraPresentadorSEPA.SetVersionCuaderno(Value: String);
begin
  FVersionCuaderno := Value;
end;
}

// [3]
function TCabeceraPresentadorSEPA.GetNumeroDato: String;
begin
  Result := FNumeroDato;
end;

{
procedure TCabeceraPresentadorSEPA.SetNumeroDato(Value: String);
begin
  FNumeroDato := Value;
end;
}

// [35]
function TCabeceraPresentadorSEPA.GetIdentificadorPresentador: String;
var
  X, Y, Z: String;
begin
  X := FIdentificadorPresentador;
  Y := Format('%d%s142800', [(Ord(X[1]) - 55), Copy(X, 2, Length(X))]);
  Z := FormatFloat('"ES"00"000"' + QuotedStr(X), (98 - (StrToInt64(Y) mod 97)));
    Z := Space(taRightJustify, 35, Z);
  Result := Z;
end;

procedure TCabeceraPresentadorSEPA.SetIdentificadorPresentador(Value: String);
begin
  FIdentificadorPresentador := Value;
end;

// [70]
function TCabeceraPresentadorSEPA.GetNombrePresentador: String;
begin
  Result := Space(taRightJustify, 70, FNombrePresentador);
end;

procedure TCabeceraPresentadorSEPA.SetNombrePresentador(Value: String);
begin
  FNombrePresentador := Value;
end;

// [35]
function TCabeceraPresentadorSEPA.GetIdentificacionFichero: String;
var
  xRms: String;
  xFile: String;
begin
  xRms  := ZeroLR(taLeftJustify, 5, FRemesaID);
  xFile := Format(FIdentificacionFichero, [xRms]);
    xFile := Space(taRightJustify, 35, xFile);
  Result := xFile;
end;

{
procedure TCabeceraPresentadorSEPA.SetIdentificacionFichero(Value: String);
begin
  FIdentificacionFichero := Value;
end;
}

// [8]
function TCabeceraPresentadorSEPA.GetFechaCreacionFichero: String;
begin
  Result := Copy(FIdentificacionFichero, 4, 8);
end;

{
procedure TCabeceraPresentadorSEPA.SetFechaCreacionFichero(Value: String);
begin
  FFechaCreacionFichero := Value;
end;
}

// [4]
function TCabeceraPresentadorSEPA.GetEntidadReceptora: String;
begin
  Result := ZeroLR(taLeftJustify, 4, FEntidadReceptora);
end;

{
procedure TCabeceraPresentadorSEPA.SetEntidadReceptora(Value: String);
begin
  FEntidadReceptora := Value;
end;
}

// [4]
function TCabeceraPresentadorSEPA.GetOficinaReceptora: String;
begin
  Result := ZeroLR(taLeftJustify, 4, FOficinaReceptora);
end;

{
procedure TCabeceraPresentadorSEPA.SetOficinaReceptora(Value: String);
begin
  FOficinaReceptora := Value;
end;
}

// [434]
function TCabeceraPresentadorSEPA.GetTextoLibre: WideString;
begin
  if (Length(FTextoLibre) > 0) then
    Result := Space(taRightJustify, 434, FTextoLibre)
  else
    Result := '.' + Space(taRightJustify, 433, FTextoLibre);
end;

procedure TCabeceraPresentadorSEPA.SetTextoLibre(Value: WideString);
begin
  FTextoLibre := Value;
end;

// [600]
function TCabeceraPresentadorSEPA.GetAllToStringLine: WideString;
begin
  Result :=
    CodigoRegistro +
    VersionCuaderno +
    NumeroDato +
    IdentificadorPresentador +
    NombrePresentador +
    FechaCreacionFichero +
    IdentificacionFichero +
    EntidadReceptora +
    OficinaReceptora +
    TextoLibre;
end;

{TCabeceraAcreedorFechaCobroSEPA}
constructor TCabeceraAcreedorFechaCobroSEPA.Create(lpCabeceraPresentadorSEPA: TCabeceraPresentadorSEPA);
begin
  Inherited Create;

  FpCabeceraPresentadorSEPA := lpCabeceraPresentadorSEPA;

  // ALGUNOS DATOS SON FIJOS (SOLO LECTURA) Y OTROS SE PUEDEN MODIFICAR
  FCodigoRegistro         := '02';      // [2] --> SOLO LECTURA
//  FVersionCuaderno        := '19143';   // [5] --> SOLO LECTURA
  FNumeroDato             := '002';     // [3] --> SOLO LECTURA
  FIdentificadorAcreedor  := '';        // [35]
  FFechaCobro             := '';        // [8]
  FNombreAcreedor         := '';        // [70]
  FDireccionAcreedorD1    := '';        // [50]
  FDireccionAcreedorD2    := '';        // [50]
  FDireccionAcreedorD3    := '';        // [40]
  FPaisAcreedor           := 'ES';      // [2]
  FCuentaAcreedor         := '';        // [34]
  FTextoLibre             := '';        // [301]
end;

// [2]
function TCabeceraAcreedorFechaCobroSEPA.GetCodigoRegistro: String;
begin
  Result := FCodigoRegistro;
end;

{
procedure TCabeceraAcreedorFechaCobroSEPA.SetCodigoRegistro(Value: String);
begin
  FCodigoRegistro := Value;
end;
}

// [5]
function TCabeceraAcreedorFechaCobroSEPA.GetVersionCuaderno: String;
begin
  Result := FpCabeceraPresentadorSEPA.VersionCuaderno;
end;

{
procedure TCabeceraAcreedorFechaCobroSEPA.SetVersionCuaderno(Value: String);
begin
  FVersionCuaderno := Value;
end;
}

// [3]
function TCabeceraAcreedorFechaCobroSEPA.GetNumeroDato: String;
begin
  Result := FNumeroDato;
end;

{
procedure TCabeceraAcreedorFechaCobroSEPA.SetNumeroDato(Value: String);
begin
  FNumeroDato := Value;
end;
}

// [35]
function TCabeceraAcreedorFechaCobroSEPA.GetIdentificadorAcreedor: String;
var
  X, Y, Z: String;
begin
  X := FIdentificadorAcreedor;
  Y := Format('%d%s142800', [(Ord(X[1]) - 55), Copy(X, 2, Length(X))]);
  Z := FormatFloat('"ES"00"000"' + QuotedStr(X), (98 - (StrToInt64(Y) mod 97)));
    Z := Space(taRightJustify, 35, Z);
  Result := Z;
end;

procedure TCabeceraAcreedorFechaCobroSEPA.SetIdentificadorAcreedor(Value: String);
begin
  FIdentificadorAcreedor := Value;
end;

// [8]
function TCabeceraAcreedorFechaCobroSEPA.GetFechaCobro: String;
begin
  Result := FFechaCobro;
end;

procedure TCabeceraAcreedorFechaCobroSEPA.SetFechaCobro(Value: String);
begin
  FFechaCobro := Value;
end;

// [70]
function TCabeceraAcreedorFechaCobroSEPA.GetNombreAcreedor: String;
begin
  Result := Space(taRightJustify, 70, FNombreAcreedor);
end;

procedure TCabeceraAcreedorFechaCobroSEPA.SetNombreAcreedor(Value: String);
begin
  FNombreAcreedor := Value;
end;

// [50]
function TCabeceraAcreedorFechaCobroSEPA.GetDireccionAcreedorD1: String;
begin
  Result := Space(taRightJustify, 50, FDireccionAcreedorD1);
end;

procedure TCabeceraAcreedorFechaCobroSEPA.SetDireccionAcreedorD1(Value: String);
begin
  FDireccionAcreedorD1 := Value;
end;

// [50]
function TCabeceraAcreedorFechaCobroSEPA.GetDireccionAcreedorD2: String;
begin
  Result := Space(taRightJustify, 50, FDireccionAcreedorD2);
end;

procedure TCabeceraAcreedorFechaCobroSEPA.SetDireccionAcreedorD2(Value: String);
begin
  FDireccionAcreedorD2 := Value;
end;

// [40]
function TCabeceraAcreedorFechaCobroSEPA.GetDireccionAcreedorD3: String;
begin
  Result := Space(taRightJustify, 40, FDireccionAcreedorD3);
end;

procedure TCabeceraAcreedorFechaCobroSEPA.SetDireccionAcreedorD3(Value: String);
begin
  FDireccionAcreedorD3 := Value;
end;

// [2]
function TCabeceraAcreedorFechaCobroSEPA.GetPaisAcreedor: String;
begin
  Result := FPaisAcreedor;
end;

procedure TCabeceraAcreedorFechaCobroSEPA.SetPaisAcreedor(Value: String);
begin
  FPaisAcreedor := Value;
end;

// [34]
function TCabeceraAcreedorFechaCobroSEPA.GetCuentaAcreedor: String;
begin
  Result := Space(taRightJustify, 34, FCuentaAcreedor);
end;

procedure TCabeceraAcreedorFechaCobroSEPA.SetCuentaAcreedor(Value: String);
begin
  FCuentaAcreedor := Value;

  FpCabeceraPresentadorSEPA.FEntidadReceptora := Copy(Value, 5, 4);
  FpCabeceraPresentadorSEPA.FOficinaReceptora := Copy(Value, 9, 4);
end;

// [301]
function TCabeceraAcreedorFechaCobroSEPA.GetTextoLibre: WideString;
begin
  if (Length(FTextoLibre) > 0) then
    Result := Space(taRightJustify, 301, FTextoLibre)
  else
    Result := '.' + Space(taRightJustify, 300, FTextoLibre);
end;

procedure TCabeceraAcreedorFechaCobroSEPA.SetTextoLibre(Value: WideString);
begin
  FTextoLibre := Value;
end;

// [600]
function TCabeceraAcreedorFechaCobroSEPA.GetAllToStringLine: WideString;
begin
  Result :=
    CodigoRegistro +
    VersionCuaderno +
    NumeroDato +
    IdentificadorAcreedor +
    FechaCobro +
    NombreAcreedor +
    DireccionAcreedorD1 +
    DireccionAcreedorD2 +
    DireccionAcreedorD3 +
    PaisAcreedor +
    CuentaAcreedor +
    TextoLibre;
end;

{TRegistroIndividualAdeudoOEMSEPA}
constructor TRegistroIndividualAdeudoOEMSEPA.Create(lpCabeceraAcreedorFechaCobroSEPA: TCabeceraAcreedorFechaCobroSEPA);
begin
  inherited Create;

  FpCabeceraAcreedorFechaCobroSEPA := lpCabeceraAcreedorFechaCobroSEPA;

  // ALGUNOS DATOS SON FIJOS (SOLO LECTURA) Y OTROS SE PUEDEN MODIFICAR
  FCodigoRegistro              := '03';     // [2] --> SOLO LECTURA
//  FVersionCuaderno             := '19143';  // [5] --> SOLO LECTURA
  FNumeroDato                  := '003';    // [3] --> SOLO LECTURA
//  FReferenciaAdeudo            := 'PRE2014030109453112345RMS-00000001';  // [35]
//  FReferenciaUnicaMandato      := '01U1';   // [35]
  FTipoAdeudo                  := 'RCUR';   // [4] --> SOLO LECTURA
  FCategoriaProposito          := 'SUPP';   // [4] --> SOLO LECTURA
//  FImporteAdeudo               := '10550';  // [11]
//  FFechaFirmaMandato           := '20140101';  // [8]
//  FEntidadDeudor               := 'INGDESMMXXX';  // [11]
//  FNombreDeudor                := 'SALVADOR VERDU GARCIA';  // [70]
//  FDireccionDeudorD1           := 'C/ ISAAC ALBENIZ, 14';  // [50]
//  FDireccionDeudorD2           := '30720 - SANTIAGO DE LA RIBERA';  // [50]
//  FDireccionDeudorD3           := 'MURCIA - (San Javier)';  // [40]
  FPaisDeudor                  := 'ES'; // [2]
  FTipoIdentificacionDeudor    := '1';      // [1] --> SOLO LECTURA
//  FIdentificacionDeudor        := 'I52804095M';  // [36]
  FIdentificacionDeudorEmisor  := 'NIF';    // [35] --> SOLO LECTURA
  FIdentificadorCuentaDeudor   := 'A';      // [1] --> SOLO LECTURA
//  FCuentaDeudor                := 'ES8114650100921708236908';  // [34]
  FPropositoAdeudo             := 'TRAD';   // [4] --> SOLO LECTURA
//  FConcepto                    := 'Esto es un concepto';  // [140]
//  FTextoLibre                  := 'Esto es texto libre';  // [19]
end;

// [2]
function TRegistroIndividualAdeudoOEMSEPA.GetCodigoRegistro: String;
begin
  Result := FCodigoRegistro;
end;

{
procedure TRegistroIndividualAdeudoOEMSEPA.SetCodigoRegistro(Value: String);
begin
  FCodigoRegistro := Value;
end;
}

// [5]
function TRegistroIndividualAdeudoOEMSEPA.GetVersionCuaderno: String;
begin
  Result := FpCabeceraAcreedorFechaCobroSEPA.VersionCuaderno;
end;

{
procedure TRegistroIndividualAdeudoOEMSEPA.SetVersionCuaderno(Value: String);
begin
  FVersionCuaderno := Value;
end;
}

// [3]
function TRegistroIndividualAdeudoOEMSEPA.GetNumeroDato: String;
begin
  Result := FNumeroDato;
end;

{
procedure TRegistroIndividualAdeudoOEMSEPA.SetNumeroDato(Value: String);
begin
  FNumeroDato := Value;
end;
}

// [35]
function TRegistroIndividualAdeudoOEMSEPA.GetReferenciaAdeudo: String;
var
  IDFile: String;
begin
  with FpCabeceraAcreedorFechaCobroSEPA.FpCabeceraPresentadorSEPA do
    IDFile := TrimRight(IdentificacionFichero);

  IDFile := IDFile + '-' + ZeroLR(taLeftJustify, 8, FReferenciaAdeudo);
    IDFile := Space(taRightJustify, 35, IDFile);

  Result := IDFile;
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetReferenciaAdeudo(Value: String);
begin
  FReferenciaAdeudo := Value;
end;

// [35]
function TRegistroIndividualAdeudoOEMSEPA.GetReferenciaUnicaMandato: String;
begin
  Result := Space(taRightJustify, 35, FReferenciaUnicaMandato);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetReferenciaUnicaMandato(Value: String);
begin
  FReferenciaUnicaMandato := Value;
end;

// [4]
function TRegistroIndividualAdeudoOEMSEPA.GetTipoAdeudo: String;
begin
  Result := FTipoAdeudo;
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetTipoAdeudo(Value: String);
begin
  FTipoAdeudo := Value;
end;

// [4]
function TRegistroIndividualAdeudoOEMSEPA.GetCategoriaProposito: String;
begin
  Result := FCategoriaProposito;
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetCategoriaProposito(Value: String);
begin
  FCategoriaProposito := Value;
end;

// [11]
function TRegistroIndividualAdeudoOEMSEPA.GetImporteAdeudo: String;
var
  nPos: Byte;
  X: String;
begin
  X := FImporteAdeudo;
  nPos := (Pos(',', X) + Pos('.', X));
  if (nPos > 0) then
    Delete(X, nPos, 1);

  X := ZeroLR(taLeftJustify, 11, X);
  Result := X;
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetImporteAdeudo(Value: String);
begin
  FImporteAdeudo := Value;
end;

// [8]
function TRegistroIndividualAdeudoOEMSEPA.GetFechaFirmaMandato: String;
begin
  Result := FFechaFirmaMandato;
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetFechaFirmaMandato(Value: String);
begin
  FFechaFirmaMandato := Value;
end;

// [11]
function TRegistroIndividualAdeudoOEMSEPA.GetEntidadDeudor: String;
begin
  Result := Space(taRightJustify, 11, FEntidadDeudor);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetEntidadDeudor(Value: String);
begin
  FEntidadDeudor := Value;
end;

// [70]
function TRegistroIndividualAdeudoOEMSEPA.GetNombreDeudor: String;
begin
  Result := Space(taRightJustify, 70, FNombreDeudor);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetNombreDeudor(Value: String);
begin
  FNombreDeudor := Value;
end;

// [50]
function TRegistroIndividualAdeudoOEMSEPA.GetDireccionDeudorD1: String;
begin
  Result := Space(taRightJustify, 50, FDireccionDeudorD1);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetDireccionDeudorD1(Value: String);
begin
  FDireccionDeudorD1 := Value;
end;

// [50]
function TRegistroIndividualAdeudoOEMSEPA.GetDireccionDeudorD2: String;
begin
  Result := Space(taRightJustify, 50, FDireccionDeudorD2);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetDireccionDeudorD2(Value: String);
begin
  FDireccionDeudorD2 := Value;
end;

// [40]
function TRegistroIndividualAdeudoOEMSEPA.GetDireccionDeudorD3: String;
begin
  Result := Space(taRightJustify, 40, FDireccionDeudorD3);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetDireccionDeudorD3(Value: String);
begin
  FDireccionDeudorD3 := Value;
end;

// [2]
function TRegistroIndividualAdeudoOEMSEPA.GetPaisDeudor: String;
begin
  Result := FPaisDeudor;
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetPaisDeudor(Value: String);
begin
  FPaisDeudor := Value;
end;

// [1]
function TRegistroIndividualAdeudoOEMSEPA.GetTipoIdentificacionDeudor: String;
begin
  Result := FTipoIdentificacionDeudor;
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetTipoIdentificacionDeudor(Value: String);
begin
  FTipoIdentificacionDeudor := Value;
end;

// [36]
function TRegistroIndividualAdeudoOEMSEPA.GetIdentificacionDeudor: String;
var
  tid: Char;
begin
  if (FTipoIdentificacionDeudor = '1') then
    tid := 'I'
  else
    tid := 'J';

  Result := Space(taRightJustify, 36, tid + FIdentificacionDeudor);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetIdentificacionDeudor(Value: String);
begin
  FIdentificacionDeudor := Value;
end;

// [35]
function TRegistroIndividualAdeudoOEMSEPA.GetIdentificacionDeudorEmisor: String;
begin
  Result := Space(taRightJustify, 35, FIdentificacionDeudorEmisor);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetIdentificacionDeudorEmisor(Value: String);
begin
  FIdentificacionDeudorEmisor := Value;
end;

// [1]
function TRegistroIndividualAdeudoOEMSEPA.GetIdentificadorCuentaDeudor: String;
begin
  Result := FIdentificadorCuentaDeudor;
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetIdentificadorCuentaDeudor(Value: String);
begin
  FIdentificadorCuentaDeudor := Value;
end;

// [34]
function TRegistroIndividualAdeudoOEMSEPA.GetCuentaDeudor: String;
begin
  Result := Space(taRightJustify, 34, FCuentaDeudor);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetCuentaDeudor(Value: String);
begin
  FCuentaDeudor := Value;
end;

// [4]
function TRegistroIndividualAdeudoOEMSEPA.GetPropositoAdeudo: String;
begin
  Result := FPropositoAdeudo;
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetPropositoAdeudo(Value: String);
begin
  FPropositoAdeudo := Value;
end;

// [140]
function TRegistroIndividualAdeudoOEMSEPA.GetConcepto: String;
begin
  Result := Space(taRightJustify, 140, FConcepto);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetConcepto(Value: String);
begin
  FConcepto := Value;
end;

// [19]
function TRegistroIndividualAdeudoOEMSEPA.GetTextoLibre: String;
begin
  if (Length(FTextoLibre) > 0) then
    Result := Space(taRightJustify, 19, FTextoLibre)
  else
    Result := '.' + Space(taRightJustify, 18, FTextoLibre);
end;

procedure TRegistroIndividualAdeudoOEMSEPA.SetTextoLibre(Value: String);
begin
  FTextoLibre := Value;
end;

// [600]
function TRegistroIndividualAdeudoOEMSEPA.GetAllToStringLine: WideString;
begin
  Result :=
    CodigoRegistro +
    VersionCuaderno +
    NumeroDato +
    ReferenciaAdeudo +
    ReferenciaUnicaMandato +
    TipoAdeudo +
    CategoriaProposito +
    ImporteAdeudo +
    FechaFirmaMandato +
    EntidadDeudor +
    NombreDeudor +
    DireccionDeudorD1 +
    DireccionDeudorD2 +
    DireccionDeudorD3 +
    PaisDeudor +
    TipoIdentificacionDeudor +
    IdentificacionDeudor +
    IdentificacionDeudorEmisor +
    IdentificadorCuentaDeudor +
    CuentaDeudor +
    PropositoAdeudo +
    Concepto +
    TextoLibre;
end;

{TRegistroIndividualAdeudoSEPA}
constructor TRegistroIndividualAdeudoSEPA.Create(lpCabeceraAcreedorFechaCobroSEPA: TCabeceraAcreedorFechaCobroSEPA);
begin
  inherited Create(lpCabeceraAcreedorFechaCobroSEPA);

  FpCabeceraAcreedorFechaCobroSEPA := lpCabeceraAcreedorFechaCobroSEPA;

  FRegistroIndividualAdeudo := TList.Create;
end;

destructor TRegistroIndividualAdeudoSEPA.Destroy;
var
  nI: Integer;
  FItem: TRegistroIndividualAdeudoOEMSEPA;
begin
  for nI := 0 to (FRegistroIndividualAdeudo.Count -1) do
  begin
    FItem := FRegistroIndividualAdeudo[nI];
    FreeAndNil(FItem);
  end;

  FreeAndNil(FRegistroIndividualAdeudo);
end;

function TRegistroIndividualAdeudoSEPA.Add: TRegistroIndividualAdeudoOEMSEPA;
var
  Index: Integer;
begin
  with FRegistroIndividualAdeudo do
    Index := Add(TRegistroIndividualAdeudoOEMSEPA.Create(FpCabeceraAcreedorFechaCobroSEPA));

  Result := FRegistroIndividualAdeudo[Index];
end;

procedure TRegistroIndividualAdeudoSEPA.Append(ReferenciaAdeudo,
  ReferenciaUnicaMandato, ImporteAdeudo, FechaFirmaMandato, EntidadDeudor,
  NombreDeudor, DireccionDeudorD1, DireccionDeudorD2, DireccionDeudorD3,
  IdentificacionDeudor, CuentaDeudor, Concepto, TextoLibre: String);
var
  NodeSEPA: TRegistroIndividualAdeudoOEMSEPA;
begin
  NodeSEPA := Add;
    NodeSEPA.ReferenciaAdeudo            := ReferenciaAdeudo;            // [35]
    NodeSEPA.ReferenciaUnicaMandato      := ReferenciaUnicaMandato;      // [35]
    NodeSEPA.ImporteAdeudo               := ImporteAdeudo;               // [11]
    NodeSEPA.FechaFirmaMandato           := FechaFirmaMandato;           // [8]
    NodeSEPA.EntidadDeudor               := EntidadDeudor;               // [11]
    NodeSEPA.NombreDeudor                := NombreDeudor;                // [70]
    NodeSEPA.DireccionDeudorD1           := DireccionDeudorD1;           // [50]
    NodeSEPA.DireccionDeudorD2           := DireccionDeudorD2;           // [50]
    NodeSEPA.DireccionDeudorD3           := DireccionDeudorD3;           // [40]
    NodeSEPA.PaisDeudor                  := PaisDeudor;                  // [2]
    NodeSEPA.IdentificacionDeudor        := IdentificacionDeudor;        // [36]
    NodeSEPA.CuentaDeudor                := CuentaDeudor;                // [34]
    NodeSEPA.Concepto                    := Concepto;                    // [140]
    NodeSEPA.TextoLibre                  := TextoLibre;                  // [19]
end;

function TRegistroIndividualAdeudoSEPA.GetCount: Integer;
begin
  Result := FRegistroIndividualAdeudo.Count;
end;

function TRegistroIndividualAdeudoSEPA.GetCountToString: String;
begin
  Result := IntToStr(GetCount);
end;

function TRegistroIndividualAdeudoSEPA.GetTotalAmount: Extended;
var
  nI: Integer;
  T: Extended;
  Item: TRegistroIndividualAdeudoOEMSEPA;
begin
  T := 0.00;
  for nI := 0 to (FRegistroIndividualAdeudo.Count -1) do
  begin
    Item := FRegistroIndividualAdeudo[nI];
    T := T + StrToInt(Item.ImporteAdeudo);
  end;

  Result := (T / 100.00);
end;

function TRegistroIndividualAdeudoSEPA.GetTotalAmountToString: String;
var
  nPos: Integer;
  X: String;
begin
  X := FormatFloat('0.00', GetTotalAmount);
  nPos := Pos('.', X) + Pos(',', X);
  Delete(X, nPos, 1);
  Result := X;
end;

function TRegistroIndividualAdeudoSEPA.GetAllToStringLine: WideString;
var
  nI: Integer;
  Item: TRegistroIndividualAdeudoOEMSEPA;
begin
  Result := '';

  for nI := 0 to (FRegistroIndividualAdeudo.Count -1) do
  begin
    Item := FRegistroIndividualAdeudo.Items[nI];
    if (nI = 0) then
      Result := Item.TodoTexto
    else
      Result := Result + #13#10 + Item.TodoTexto;
  end;
end;

{TRegistrosTotalesAcreedorFechaCobroSEPA}
constructor TRegistrosTotalesAcreedorFechaCobroSEPA.Create(lpRegistroIndividualAdeudoSEPA: TRegistroIndividualAdeudoSEPA);
begin
  inherited Create;

  FpRegistroIndividualAdeudoSEPA := lpRegistroIndividualAdeudoSEPA;

  // ALGUNOS DATOS SON FIJOS (SOLO LECTURA) Y OTROS SE PUEDEN MODIFICAR
  FCodigoRegistro         := '04';  // [2] --> SOLO LECTURA

//  FIdentificadorAcreedor  := '';    // [35]
//  FFechaCobro             := '';    // [8]
//  FTotalImportes          := '';    // [17]
//  FNumeroAdeudos          := '';    // [8]
//  FTotalRegistros         := '';    // [10]
  FTextoLibre             := '';    // [520]
end;

// [2]
function TRegistrosTotalesAcreedorFechaCobroSEPA.GetCodigoRegistro: String;
begin
  Result := FCodigoRegistro;
end;

{
procedure TRegistrosTotalesAcreedorFechaCobroSEPA.SetCodigoRegistro(Value: String);
begin
  FCodigoRegistro := Value;
end;
}

// [35]
function TRegistrosTotalesAcreedorFechaCobroSEPA.GetIdentificadorAcreedor: String;
begin
  with FpRegistroIndividualAdeudoSEPA.FpCabeceraAcreedorFechaCobroSEPA do
    Result := Space(taRightJustify, 35, IdentificadorAcreedor);
end;

{
procedure TRegistrosTotalesAcreedorFechaCobroSEPA.SetIdentificadorAcreedor(Value: String);
begin
  FIdentificadorAcreedor := Value;
end;
}

// [8]
function TRegistrosTotalesAcreedorFechaCobroSEPA.GetFechaCobro: String;
begin
  with FpRegistroIndividualAdeudoSEPA.FpCabeceraAcreedorFechaCobroSEPA do
    Result := FechaCobro;
end;

{
procedure TRegistrosTotalesAcreedorFechaCobroSEPA.SetFechaCobro(Value: String);
begin
  FFechaCobro := Value;
end;
}

// [17]
function TRegistrosTotalesAcreedorFechaCobroSEPA.GetTotalImportes: String;
begin
  with FpRegistroIndividualAdeudoSEPA do
    Result := ZeroLR(taLeftJustify, 17, TotalAmountToString);
end;

{
procedure TRegistrosTotalesAcreedorFechaCobroSEPA.SetTotalImportes(Value: String);
begin
  FTotalImportes := Value;
end;
}

// [8]
function TRegistrosTotalesAcreedorFechaCobroSEPA.GetNumeroAdeudos: String;
begin
  with FpRegistroIndividualAdeudoSEPA do
    Result := ZeroLR(taLeftJustify, 8, CountToString);
end;

{
procedure TRegistrosTotalesAcreedorFechaCobroSEPA.SetNumeroAdeudos(Value: String);
begin
  FNumeroAdeudos := Value;
end;
}

// [10]
function TRegistrosTotalesAcreedorFechaCobroSEPA.GetTotalRegistros: String;
begin
  with FpRegistroIndividualAdeudoSEPA do
    Result := ZeroLR(taLeftJustify, 10, IntToStr(2 + Count));
end;

{
procedure TRegistrosTotalesAcreedorFechaCobroSEPA.SetTotalRegistros(Value: String);
begin
  FTotalRegistros := Value;
end;
}

// [520]
function TRegistrosTotalesAcreedorFechaCobroSEPA.GetTextoLibre: WideString;
begin
  if (Length(FTextoLibre) > 0) then
    Result := Space(taRightJustify, 520, FTextoLibre)
  else
    Result := '.' + Space(taRightJustify, 519, FTextoLibre);
end;

procedure TRegistrosTotalesAcreedorFechaCobroSEPA.SetTextoLibre(Value: WideString);
begin
  FTextoLibre := Value;
end;

// [600]
function TRegistrosTotalesAcreedorFechaCobroSEPA.GetAllToStringLine: WideString;
begin
  Result :=
    CodigoRegistro +
    IdentificadorAcreedor +
    FechaCobro +
    TotalImportes +
    NumeroAdeudos +
    TotalRegistros +
    TextoLibre;
end;

{TRegistrosTotalesAcreedorSEPA}
constructor TRegistrosTotalesAcreedorSEPA.Create(lpRegistrosTotalesAcreedorFechaCobro: TRegistrosTotalesAcreedorFechaCobroSEPA);
begin
  inherited Create;

  FpRegistrosTotalesAcreedorFechaCobro := lpRegistrosTotalesAcreedorFechaCobro;

  // ALGUNOS DATOS SON FIJOS (SOLO LECTURA) Y OTROS SE PUEDEN MODIFICAR
  FCodigoRegistro         := '05';  // [2] --> SOLO LECTURA

//  FIdentificadorAcreedor  := lpCabeceraAcreedorFechaCobroSEPA.FIdentificadorAcreedor; // [35]
//  FTotalImportes          := '';    // [17]
//  FNumeroAdeudos          := '';    // [8]
//  FTotalRegistros         := '';    // [10]
  FTextoLibre             := '';    // [520]
end;

// [2]
function TRegistrosTotalesAcreedorSEPA.GetCodigoRegistro: String;
begin
  Result := FCodigoRegistro;
end;

{
procedure TRegistrosTotalesAcreedorSEPA.SetCodigoRegistro(Value: String);
begin
  FCodigoRegistro := Value;
end;
}

// [35]
function TRegistrosTotalesAcreedorSEPA.GetIdentificadorAcreedor: String;
begin
  with FpRegistrosTotalesAcreedorFechaCobro do
    with FpRegistroIndividualAdeudoSEPA.FpCabeceraAcreedorFechaCobroSEPA do
      Result := Space(taRightJustify, 35, IdentificadorAcreedor);
end;

{
procedure TRegistrosTotalesAcreedorSEPA.SetIdentificadorAcreedor(Value: String);
begin
  FIdentificadorAcreedor := Value;
end;
}

// [17]
function TRegistrosTotalesAcreedorSEPA.GetTotalImportes: String;
begin
  with FpRegistrosTotalesAcreedorFechaCobro.FpRegistroIndividualAdeudoSEPA do
    Result := ZeroLR(taLeftJustify, 17, TotalAmountToString);
end;

{
procedure TRegistrosTotalesAcreedorSEPA.SetTotalImportes(Value: String);
begin
  FTotalImportes := Value;
end;
}

// [8]
function TRegistrosTotalesAcreedorSEPA.GetNumeroAdeudos: String;
begin
  with FpRegistrosTotalesAcreedorFechaCobro.FpRegistroIndividualAdeudoSEPA do
    Result := ZeroLR(taLeftJustify, 8, CountToString);
end;

{
procedure TRegistrosTotalesAcreedorSEPA.SetNumeroAdeudos(Value: String);
begin
  FNumeroAdeudos := Value
end;
}

// [10]
function TRegistrosTotalesAcreedorSEPA.GetTotalRegistros: String;
begin
  with FpRegistrosTotalesAcreedorFechaCobro.FpRegistroIndividualAdeudoSEPA do
    Result := ZeroLR(taLeftJustify, 10, IntToStr(Count +3));
end;

{
procedure TRegistrosTotalesAcreedorSEPA.SetTotalRegistros(Value: String);
begin
  FTotalRegistros := Value;
end;
}

// [528]
function TRegistrosTotalesAcreedorSEPA.GetTextoLibre: String;
begin
  if (Length(FTextoLibre) > 0) then
    Result := Space(taRightJustify, 528, FTextoLibre)
  else
    Result := '.' + Space(taRightJustify, 527, FTextoLibre);
end;

procedure TRegistrosTotalesAcreedorSEPA.SetTextoLibre(Value: String);
begin
  FTextoLibre := Value;
end;

// [600]
function TRegistrosTotalesAcreedorSEPA.GetAllToStringLine: WideString;
begin
  Result :=
    CodigoRegistro +
    IdentificadorAcreedor +
    TotalImportes +
    NumeroAdeudos +
    TotalRegistros +
    TextoLibre;
end;

{TRegistroTotalesGeneralSEPA}
constructor TRegistroTotalesGeneralSEPA.Create(lpRegistrosTotalesAcreedor: TRegistrosTotalesAcreedorSEPA);
begin
  inherited Create;

  FpRegistrosTotalesAcreedor := lpRegistrosTotalesAcreedor;

  // ALGUNOS DATOS SON FIJOS (SOLO LECTURA) Y OTROS SE PUEDEN MODIFICAR
  FCodigoRegistro         := '99';  // [2] --> SOLO LECTURA
//  FTotalImportesGeneral   := FpRegistrosTotalesAcreedor.FTotalImportes;    // [17]
//  FNumeroRegistros        := '';    // [8]
//  FTotalRegistros         := '';    // [10]
  FTextoLibre             := '';    // [563]
end;

// [2]
function TRegistroTotalesGeneralSEPA.GetCodigoRegistro: String;
begin
  Result := FCodigoRegistro;
end;

{
procedure TRegistroTotalesGeneralSEPA.SetCodigoRegistro(Value: String);
begin
  FCodigoRegistro := Value;
end;
}

// [17]
function TRegistroTotalesGeneralSEPA.GetTotalImportesGeneral: String;
begin
  with FpRegistrosTotalesAcreedor.FpRegistrosTotalesAcreedorFechaCobro.FpRegistroIndividualAdeudoSEPA do
    Result := ZeroLR(taLeftJustify, 17, TotalAmountToString);
end;

{
procedure TRegistroTotalesGeneralSEPA.SetTotalImportesGeneral(Value: String);
begin
  FTotalImportesGeneral := Value;
end;
}

// [8]
function TRegistroTotalesGeneralSEPA.GetNumeroRegistros: String;
begin
  with FpRegistrosTotalesAcreedor.FpRegistrosTotalesAcreedorFechaCobro.FpRegistroIndividualAdeudoSEPA do
    Result := ZeroLR(taLeftJustify, 8, CountToString);
end;

{
procedure TRegistroTotalesGeneralSEPA.SetNumeroRegistros(Value: String);
begin
  FNumeroRegistros := Value;
end;
}

// [10]
function TRegistroTotalesGeneralSEPA.GetTotalRegistros: String;
begin
  with FpRegistrosTotalesAcreedor.FpRegistrosTotalesAcreedorFechaCobro.FpRegistroIndividualAdeudoSEPA do
    Result := ZeroLR(taLeftJustify, 10, IntToStr(Count +5));
end;

{
procedure TRegistroTotalesGeneralSEPA.SetTotalRegistros(Value: String);
begin
  FTotalRegistros := Value;
end;
}

// [563]
function TRegistroTotalesGeneralSEPA.GetTextoLibre: WideString;
begin
  if (Length(FTextoLibre) > 0) then
    Result := Space(taRightJustify, 563, FTextoLibre)
  else
    Result := '.' + Space(taRightJustify, 562, FTextoLibre);
end;

procedure TRegistroTotalesGeneralSEPA.SetTextoLibre(Value: WideString);
begin
  FTextoLibre := Value;
end;

// [600]
function TRegistroTotalesGeneralSEPA.GetAllToStringLine: WideString;
begin
  Result :=
    CodigoRegistro +
    TotalImportesGeneral +
    NumeroRegistros +
    TotalRegistros +
    TextoLibre;
end;

{TFicheroSEPA}
constructor TFicheroSEPAOEM.Create;
begin
  inherited;

  FCabeceraPresentador := TCabeceraPresentadorSEPA.Create;

  FCabeceraAcreedorFechaCobro := TCabeceraAcreedorFechaCobroSEPA.Create(FCabeceraPresentador);

  FIndividualAdeudo := TRegistroIndividualAdeudoSEPA.Create(FCabeceraAcreedorFechaCobro);

  FTotalesAcreedorFechaCobro := TRegistrosTotalesAcreedorFechaCobroSEPA.Create(FIndividualAdeudo);

  FTotalesAcreedor := TRegistrosTotalesAcreedorSEPA.Create(FTotalesAcreedorFechaCobro);

  FTotalesGeneral := TRegistroTotalesGeneralSEPA.Create(FTotalesAcreedor);
end;

destructor TFicheroSEPAOEM.Destroy;
begin
  FreeAndNil(FCabeceraPresentador);
  FreeAndNil(FCabeceraAcreedorFechaCobro);
  FreeAndNil(FIndividualAdeudo);
  FreeAndNil(FTotalesAcreedorFechaCobro);
  FreeAndNil(FTotalesAcreedor);
  FreeAndNil(FTotalesGeneral);

  inherited;
end;

procedure TFicheroSEPAOEM.SaveToFileSEPA(FileName: WideString);
begin
  with TStringList.Create do
  begin
    Add(FCabeceraPresentador.TodoTexto);
    Add(FCabeceraAcreedorFechaCobro.TodoTexto);
    Add(FIndividualAdeudo.TodoTexto);
    Add(FTotalesAcreedorFechaCobro.TodoTexto);
    Add(FTotalesAcreedor.TodoTexto);
    Add(FTotalesGeneral.TodoTexto);

    SaveToFile(FileName);
  end;
end;

function TFicheroSEPAOEM.AddIndividualAdeudo: TRegistroIndividualAdeudoOEMSEPA;
begin
  Result := FIndividualAdeudo.Add;
end;

procedure TFicheroSEPAOEM.AppendIndividualAdeudo(ReferenciaAdeudo,
  ReferenciaUnicaMandato, ImporteAdeudo, FechaFirmaMandato, EntidadDeudor,
  NombreDeudor, DireccionDeudorD1, DireccionDeudorD2, DireccionDeudorD3,
  IdentificacionDeudor, CuentaDeudor, Concepto, TextoLibre: String);
begin
  FIndividualAdeudo.Append
    (
      ReferenciaAdeudo
      ,ReferenciaUnicaMandato
      ,ImporteAdeudo
      ,FechaFirmaMandato
      ,EntidadDeudor
      ,NombreDeudor
      ,DireccionDeudorD1
      ,DireccionDeudorD2
      ,DireccionDeudorD3
      ,IdentificacionDeudor
      ,CuentaDeudor
      ,Concepto
      ,TextoLibre
    );
end;

{TCabeceraPresentador}
procedure TFicheroSEPAOEM.SetIdentificadorPresentador(Value: String);
begin
  FCabeceraPresentador.IdentificadorPresentador := Value;
end;

procedure TFicheroSEPAOEM.SetNombrePresentador(Value: String);
begin
  FCabeceraPresentador.NombrePresentador := Value;
end;

{
procedure TFicheroSEPAOEM.SetIdentificacionFichero(Value: String);
begin
  FCabeceraPresentador.IdentificacionFichero := Value;
end;
}

{TCabeceraAcreedorFechaCobro}
procedure TFicheroSEPAOEM.SetIdentificadorAcreedor(Value: String);
begin
  FCabeceraAcreedorFechaCobro.IdentificadorAcreedor := Value;
end;

procedure TFicheroSEPAOEM.SetNombreAcreedor(Value: String);
begin
  FCabeceraAcreedorFechaCobro.NombreAcreedor := Value;
end;

procedure TFicheroSEPAOEM.SetDireccionAcreedorD1(Value: String);
begin
  FCabeceraAcreedorFechaCobro.DireccionAcreedorD1 := Value;
end;

procedure TFicheroSEPAOEM.SetDireccionAcreedorD2(Value: String);
begin
  FCabeceraAcreedorFechaCobro.DireccionAcreedorD2 := Value;
end;

procedure TFicheroSEPAOEM.SetDireccionAcreedorD3(Value: String);
begin
  FCabeceraAcreedorFechaCobro.DireccionAcreedorD3 := Value;
end;

procedure TFicheroSEPAOEM.SetFechaCobro(Value: String);
begin
  FCabeceraAcreedorFechaCobro.FechaCobro := Value;
end;

procedure TFicheroSEPAOEM.SetCuentaAcreedor(Value: String);
begin
  FCabeceraAcreedorFechaCobro.CuentaAcreedor := Value;
end;

constructor TFicheroSEPA.CreateRemittance(IDRemittance,
  IDBankRemittanceSEPA: Integer; ConnectionString: WideString);
var
  FadoCnn: TADOConnection;
  lGRL: Boolean;
begin
  inherited Create;

  FadoCnn := TADOConnection.Create(nil);
    FadoCnn.LoginPrompt := False;
    FadoCnn.ConnectionString := ConnectionString;

  with TADOQuery.Create(nil) do
  begin
    Connection := FadoCnn;

// Cabecera del Presentador y Acreedor
    SQL.Add('SELECT');
    SQL.Add('    EPR.CIF AS IDENTIFICADORPRESENTADOR');
    SQL.Add('    ,EPR.EMPRESA AS NOMBREPRESENTADOR');
    SQL.Add('    ,R.IDREMESA');

    SQL.Add('    ,EPR.CIF AS IDENTIFICADORACREEDOR');
    SQL.Add('    ,R.FECHACARGO AS FECHACOBRO');
    SQL.Add('    ,EPR.EMPRESA AS NOMBREACREEDOR');
    SQL.Add('    ,EPR.DIRECCION AS DIRECCIONACREEDOR1');
    SQL.Add('    ,EPR.CODIGOPOSTAL + '' - '' + EPR.POBLACION AS DIRECCIONACREEDOR2');
    SQL.Add('    ,EPR.PROVINCIA AS DIRECCIONACREEDOR3');
    SQL.Add('    ,(BRS.IBAN + BRS.ENTIDAD + BRS.OFICINA + BRS.DIGITOCONTROL + BRS.CUENTACORRIENTE) AS CUENTAACREEDOR');
    SQL.Add('  FROM Remesas AS R');
    SQL.Add('    INNER JOIN Empresas AS EPR');
    SQL.Add('      ON EPR.IDEMPRESA = R.EMPRESAID');
    SQL.Add('    INNER JOIN BancosRemesasSEPA AS BRS');
    SQL.Add('      ON BRS.IDBANCOREMESASEPA = ' + IntToStr(IDBankRemittanceSEPA));
    SQL.Add('  WHERE R.IDREMESA = ' + IntToStr(IDRemittance));

    Open;

    with CabeceraPresentador do
    begin
      IdentificadorPresentador := FieldByName('IDENTIFICADORPRESENTADOR').AsString;
      NombrePresentador        := FieldByName('NOMBREPRESENTADOR').AsString;
      RemesaID                 := IntToStr(IDRemittance);
    end;

    with CabeceraAcreedorFechaCobro do
    begin
      IdentificadorAcreedor := FieldByName('IDENTIFICADORACREEDOR').AsString;
      FechaCobro            := FormatDateTime('yyyymmdd', FieldByName('FECHACOBRO').AsDateTime);
      NombreAcreedor        := FieldByName('NOMBREACREEDOR').AsString;
      DireccionAcreedorD1   := FieldByName('DIRECCIONACREEDOR1').AsString;
      DireccionAcreedorD2   := FieldByName('DIRECCIONACREEDOR2').AsString;
      DireccionAcreedorD3   := FieldByName('DIRECCIONACREEDOR3').AsString;
      CuentaAcreedor        := FieldByName('CUENTAACREEDOR').AsString;
    end;

    FadoCnn.Close;
    SQL.Clear;

    // Comprobar si la remesa que se va a crear es libre o de usuarios de transporte
    SQL.Add('SELECT');
    SQL.Add('    REMESALIBRE');
    SQL.Add('  FROM Remesas');
    SQL.Add('  WHERE IDREMESA = ' + IntToStr(IDRemittance));

    Open;

    lGRL := (FieldByName('REMESALIBRE').AsInteger > 0);

    FadoCnn.Close;
    SQL.Clear;

    if (not lGRL) then
    begin
  // Recibos de Usuarios de transporte.
      SQL.Add('SELECT');
      SQL.Add('    RUT.IDRECIBOUSUARIOTRANSPORTE AS REFERENCIAADEUDO');
      SQL.Add('    ,REFERENCIAUNICAMANDATO =');
      SQL.Add('      CASE');
      SQL.Add('        WHEN LEN(UTT.CONTADORMANDATO) = 1 THEN ''0'' + LEFT(UTT.CONTADORMANDATO, 1)');
      SQL.Add('        ELSE LEFT(UTT.CONTADORMANDATO, 2)');
      SQL.Add('      END + ''U'' + CAST(UTT.IDUSUARIOTRANSPORTETUTOR AS varchar(10))');
      SQL.Add('    ,RUT.IMPORTERECIBO AS IMPORTEADEUDO');
      SQL.Add('    ,UTT.FECHAFIRMAMANDATO');
      SQL.Add('    ,UTTCCC.BICSWIFT AS ENTIDADDEUDOR');
      SQL.Add('    ,UTT.USUARIOTRANSPORTETUTOR AS NOMBREDEUDOR');
      SQL.Add('    ,UTT.DIRECCION AS DIRECCIONDEUDORD1');
      SQL.Add('    ,(UTT.CODIGOPOSTAL + '' - '' + UTT.POBLACION) AS DIRECCIONDEUDORD2');
      SQL.Add('    ,P.PROVINCIA AS DIRECCIONDEUDORD3');
      SQL.Add('    ,UTT.NIF AS IDENTIFICACIONDEUDOR');
      SQL.Add('    ,(UTTCCC.IBAN + UTTCCC.ENTIDAD + UTTCCC.OFICINA + UTTCCC.DIGITOCONTROL + UTTCCC.NUMEROCUENTA) AS CUENTADEUDOR');

      SQL.Add('    ,CONCEPTO =');
      SQL.Add('      CASE');
      SQL.Add('        WHEN (LEN(RUT.CONCEPTOGENERALSEPA) > 0) THEN RUT.CONCEPTOGENERALSEPA');
      SQL.Add('        ELSE (UT.USUARIOTRANSPORTE + '' - '' + RUT.CONCEPTOGENERAL + '' - '' + RUT.RECIBOUSUARIOTRANSPORTE)');
      SQL.Add('      END');

      SQL.Add('  FROM RecibosUsuariosTransporte AS RUT');
      SQL.Add('    INNER JOIN UsuariosTransporte AS UT');
      SQL.Add('      ON UT.IDUSUARIOTRANSPORTE = RUT.USUARIOTRANSPORTEID');
      SQL.Add('    INNER JOIN UsuariosTransporteTutorAsignado AS UTTA');
      SQL.Add('      ON UTTA.USUARIOTRANSPORTEID = UT.IDUSUARIOTRANSPORTE AND UTTA.PREDETERMINADO = 1');
      SQL.Add('    INNER JOIN UsuariosTransporteTutor AS UTT');
      SQL.Add('      ON UTT.IDUSUARIOTRANSPORTETUTOR = UTTA.USUARIOTRANSPORTETUTORID');
      SQL.Add('    LEFT JOIN UsuariosTransporteTutorCCC AS UTTCCC');
      SQL.Add('      ON UTTCCC.IDUSUARIOTRANSPORTETUTORCCC = RUT.USUARIOTRANSPORTETUTORCCCID  AND UTTCCC.PREDETERMINADO = 1 AND UTTCCC.ELIMINADO = 0');
      SQL.Add('    LEFT JOIN Provincias AS P');
      SQL.Add('      ON P.IDPROVINCIA = UTT.PROVINCIAID');
      SQL.Add('  WHERE RUT.REMESAID = ' + IntToStr(IDRemittance));
      SQL.Add('        AND (RUT.IMPORTERECIBO > 0)');
    end
    else begin
      SQL.Add('SELECT');
      SQL.Add('    GRL.IDGIRORECIBOLIBRE AS REFERENCIAADEUDO');
      SQL.Add('    ,REFERENCIAUNICAMANDATO =');
      SQL.Add('      CASE');
      SQL.Add('        WHEN GRL.USUARIOTRANSPORTEID > 0 THEN');
      SQL.Add('          CASE');
      SQL.Add('            WHEN LEN(UTT.CONTADORMANDATO) = 1 THEN ''0'' + LEFT(UTT.CONTADORMANDATO, 1)');
      SQL.Add('            ELSE LEFT(UTT.CONTADORMANDATO, 2)');
      SQL.Add('          END + ''U'' + CAST(UTT.IDUSUARIOTRANSPORTETUTOR AS varchar(10))');

      SQL.Add('        WHEN GRL.CLIENTEID > 0 THEN ''01C'' + CAST(CLI.IDCLIENTE AS varchar(10))');

      SQL.Add('        ELSE ''01X'' + CAST(GRL.IDGIRORECIBOLIBRE AS varchar(10))');
      SQL.Add('      END');

      SQL.Add('    ,GRL.IMPORTEGIRO AS IMPORTEADEUDO');

      SQL.Add('    ,FECHAFIRMAMANDATO =');
      SQL.Add('      CASE');
      SQL.Add('        WHEN GRL.USUARIOTRANSPORTEID > 0 THEN UTT.FECHAFIRMAMANDATO');
      SQL.Add('        WHEN GRL.CLIENTEID > 0 THEN CAST(''01/02/2014'' AS smalldatetime)');
      SQL.Add('        ELSE CAST(''01/02/2014'' AS smalldatetime)');
      SQL.Add('      END');

      SQL.Add('    ,GRL.BICSWIFT AS ENTIDADDEUDOR');
      SQL.Add('    ,GRL.NOMBRESEPA AS NOMBREDEUDOR');
      SQL.Add('    ,''.'' AS DIRECCIONDEUDORD1');
      SQL.Add('    ,''.'' AS DIRECCIONDEUDORD2');
      SQL.Add('    ,''.'' AS DIRECCIONDEUDORD3');
      SQL.Add('    ,''.'' AS IDENTIFICACIONDEUDOR');
      SQL.Add('    ,(GRL.IBAN + GRL.ENTIDAD + GRL.OFICINA + GRL.DIGITOCONTROL + GRL.NUMEROCUENTA) AS CUENTADEUDOR');
      SQL.Add('    ,GRL.CONCEPTOSEPA AS CONCEPTO');
      SQL.Add('  FROM GirosRecibosLibres AS GRL');
      SQL.Add('    LEFT JOIN UsuariosTransporte AS UT');
      SQL.Add('      ON UT.IDUSUARIOTRANSPORTE = GRL.USUARIOTRANSPORTEID');
      SQL.Add('    LEFT JOIN UsuariosTransporteTutorAsignado AS UTTA');
      SQL.Add('      ON UTTA.USUARIOTRANSPORTEID = UT.IDUSUARIOTRANSPORTE AND UTTA.PREDETERMINADO = 1');
      SQL.Add('    LEFT JOIN UsuariosTransporteTutor AS UTT');
      SQL.Add('      ON UTT.IDUSUARIOTRANSPORTETUTOR = UTTA.USUARIOTRANSPORTETUTORID');
      SQL.Add('    LEFT JOIN Clientes AS CLI');
      SQL.Add('      ON CLI.IDCLIENTE = GRL.CLIENTEID');
      SQL.Add('  WHERE GRL.REMESAID = ' + IntToStr(IDRemittance));
      SQL.Add('        AND (GRL.IMPORTEGIRO > 0)');
    end;

    Open;

    while (not Eof) do
    begin
      AppendIndividualAdeudo
        (
          FieldByName('REFERENCIAADEUDO').AsString
          ,FieldByName('REFERENCIAUNICAMANDATO').AsString
          ,FormatFloat('0.00', FieldByName('IMPORTEADEUDO').AsFloat)
          ,FormatDateTime('yyyymmdd', FieldByName('FECHAFIRMAMANDATO').AsDateTime)
          ,FieldByName('ENTIDADDEUDOR').AsString
          ,FieldByName('NOMBREDEUDOR').AsString
          ,FieldByName('DIRECCIONDEUDORD1').AsString
          ,FieldByName('DIRECCIONDEUDORD2').AsString
          ,FieldByName('DIRECCIONDEUDORD3').AsString
          ,FieldByName('IDENTIFICACIONDEUDOR').AsString
          ,FieldByName('CUENTADEUDOR').AsString
          ,FieldByName('CONCEPTO').AsString
          ,''
        );

      Next;
    end;

    FadoCnn.Close;
    Free;
  end;
end;

end.
