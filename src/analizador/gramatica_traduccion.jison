  /* Definición Léxica */
%lex

%options case-sensitive

%%

\s+											                // espacios en blanco
"//".*										              // comentario simple
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]			// comentario multiple líneas

//Palabras reservadas
'string' return 'string';
'number' return 'number';
'boolean' return 'boolean';
'void' return 'void';
'type' return 'type';
'cam' return 'cam';
'inv' return 'const';
'muestra' return 'muestra';
'log' return 'log';
'metodo' return 'metodo';
'retorna' return 'return';
'null' return 'null';
'push' return 'push';
'length' return 'length';
'pop' return 'pop';
'siempreq' return 'siempreq';
'siempreqn' return 'siempreqn';
'true' return 'true';
'false' return 'false';
'break' return 'break';
'switch' return 'switch';
'case' return 'case';
'default' return 'default';
'continue' return 'continue';
'durante' return 'while';
'haz' return 'do';
'recorre' return 'for';
'in' return 'in';
'of' return 'of';
'graficar_ts' return 'graficar_ts';
'Array' return 'Array';

//Signos
';' return 'punto_coma';
',' return 'coma';
':' return 'dos_puntos';
'{' return 'llave_izq';
'}' return 'llave_der';
'(' return 'par_izq';
')' return 'par_der';
'[' return 'cor_izq';
']' return 'cor_der';
'.' return 'punto';
'#incr' return 'mas_mas'
'#mas#' return 'mas';
'#desc' return 'menos_menos'
'#menos#' return 'menos';
'#pot#' return 'potencia';
'#por#' return 'por';
'#div#' return 'div';
'#mod#' return 'mod';
'#<=' return 'menor_igual';
'#>=' return 'mayor_igual';
'#>' return 'mayor';
'#<' return 'menor';
'#==' return 'igual_que';
'#=' return 'igual';
'#!=' return 'dif_que';
'#ademas#' return 'ademas';
'#oquizas#' return 'o_quizas';
'#no#' return 'no';
'?' return 'interrogacion';



//Patrones (Expresiones regulares)
\"[^\"]*\"			{ yytext = yytext.substr(0,yyleng-0); return 'string'; }
\'[^\']*\'			{ yytext = yytext.substr(0,yyleng-0); return 'string'; }
\`[^\`]*\`			{ yytext = yytext.substr(0,yyleng-0); return 'string'; }
[0-9]+("."[0-9]+)?\b  	return 'number';
([a-zA-Z])[a-zA-Z0-9_]* return 'id';

//Fin del archivo
<<EOF>>				return 'EOF';
//Errores lexicos
.					{
  const er = new error_1.Error({ tipo: 'lexico', linea: `${yylineno + 1}`, descripcion: `El valor "${yytext}" no es valido, columna: ${yylloc.first_column + 1}` });
  errores_1.Errores.getInstance().push(er);
  }
/lex

//Imports
%{
  const { NodoAST } = require('../arbol/nodoAST');
  const error_1 = require("../arbol/error");
  const errores_1 = require("../arbol/errores");
%}

/* Asociación de operadores y precedencia */
// https://entrenamiento-python-basico.readthedocs.io/es/latest/leccion3/operadores_aritmeticos.html
%left 'interrogacion'
%left 'o_quizas'
%left 'ademas'
%left 'no'
%left 'igual_que' 'dif_que'
%left 'mayor' 'menor' 'mayor_igual' 'menor_igual'
%left 'mas' 'menos'
%left 'por' 'div' 'mod'
%left 'umenos'
%right 'potencia'
%left 'mas_mas' 'menos_menos'

%start S

%%

//Definición de la Grámatica

/*-->TR - EJ<--*/
S
  : INSTRUCCIONES EOF { return new NodoAST({label: 'S', hijos: [$1], linea: yylineno}); }
;

/*-->TR - EJ<--*/
INSTRUCCIONES
  : INSTRUCCIONES INSTRUCCION  { $$ = new NodoAST({label: 'INSTRUCCIONES', hijos: [...$1.hijos, ...$2.hijos], linea: yylineno}); }
  | INSTRUCCION                { $$ = new NodoAST({label: 'INSTRUCCIONES', hijos: [...$1.hijos], linea: yylineno}); }
;

INSTRUCCION
  : DECLARACION_VARIABLE /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | DECLARACION_METODO /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | DECLARACION_TYPE /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | ASIGNACION /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | PUSH_ARREGLO /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | MUESTRA_LOG /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | INSTRUCCION_SIEMPREQ /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | SWITCH /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | BREAK /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | RETURN /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | CONTINUE /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | WHILE /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | DO_WHILE /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | FOR /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | FOR_OF /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | FOR_IN /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | GRAFICAR_TS /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | LLAMADA_METODO /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  | INCREMENTO_DECREMENTO { $$ = new NodoAST({label: 'INSTRUCCION', hijos: [$1], linea: yylineno}); }
  // | error { MUESTRA.error('Este es un error sintáctico: ' + yytext + ', en la linea: ' + this._$.first_line + ', en la columna: ' + this._$.first_column); }
;

LLAMADA_METODO /*-->TR - EJ<--*/
  : id par_izq par_der punto_coma { $$ = new NodoAST({label: 'LLAMADA_METODO', hijos: [$1,$2,$3,$4], linea: yylineno}); }
  | id par_izq LISTA_EXPRESIONES par_der punto_coma { $$ = new NodoAST({label: 'LLAMADA_METODO', hijos: [$1,$2,$3,$4,$5], linea: yylineno}); }
;

LLAMADA_METODO_EXP /*-->TR - EJ<--*/
  : id par_izq par_der { $$ = new NodoAST({label: 'LLAMADA_METODO_EXP', hijos: [$1,$2,$3], linea: yylineno}); }
  | id par_izq LISTA_EXPRESIONES par_der { $$ = new NodoAST({label: 'LLAMADA_METODO_EXP', hijos: [$1,$2,$3,$4], linea: yylineno}); }
;

GRAFICAR_TS /*-->TR - EL<--*/
  : graficar_ts par_izq par_der punto_coma { $$ = new NodoAST({label: 'GRAFICAR_TS', hijos: [$1,$2,$3,$4], linea: yylineno}); }
;

WHILE /*-->TR - EJ<--*/
  : while par_izq EXP par_der llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'WHILE', hijos: [$1,$2,$3,$4,$5,$6,$7], linea: yylineno}); }
;

DO_WHILE /*-->TR - EJ<--*/
  : do llave_izq INSTRUCCIONES llave_der while par_izq EXP par_der punto_coma { $$ = new NodoAST({label: 'DO_WHILE', hijos: [$1,$2,$3,$4,$5,$6,$7,$8,$9], linea: yylineno}); }
;

FOR /*-->TR - EJ<--*/
  : for par_izq DECLARACION_VARIABLE EXP punto_coma ASIGNACION_FOR par_der llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'FOR', hijos: [$1,$2,$3,$4,$5,$6,$7,$8,$9,$10], linea: yylineno}); }
  | for par_izq ASIGNACION EXP punto_coma ASIGNACION_FOR par_der llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'FOR', hijos: [$1,$2,$3,$4,$5,$6,$7,$8,$9,$10], linea: yylineno}); }
;

FOR_OF /*-->TR - EJ<--*/
  : for par_izq TIPO_DEC_VARIABLE id of EXP par_der llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'FOR_OF', hijos: [$1,$2,$3,$4,$5,$6,$7,$8,$9,$10], linea: yylineno}); }
;

FOR_IN /*-->TR - EJ<--*/
  : for par_izq TIPO_DEC_VARIABLE id in EXP par_der llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'FOR_IN', hijos: [$1,$2,$3,$4,$5,$6,$7,$8,$9,$10], linea: yylineno}); }
;

ASIGNACION /*-->TR - EJ<--*/
  //variable = EXP ;
  /*-->TR - EJ <--*/
  : id TIPO_IGUAL EXP punto_coma { $$ = new NodoAST({label: 'ASIGNACION', hijos: [$1,$2,$3,$4], linea: yylineno}); }

  // type.accesos = EXP ; || type.accesos[][] = EXP;
  /*-->TR - EJ<--*/
  | id LISTA_ACCESOS_TYPE TIPO_IGUAL EXP punto_coma { $$ = new NodoAST({label: 'ASIGNACION', hijos: [$1,$2,$3,$4,$5], linea: yylineno}); }

  //variable[][] = EXP ;
  /*-->TR - EJ<--*/
  | ACCESO_ARREGLO TIPO_IGUAL EXP punto_coma { $$ = new NodoAST({label: 'ASIGNACION', hijos: [$1,$2,$3,$4], linea: yylineno}); }
;

TIPO_IGUAL /*-->TR - EJ<--*/
  : igual { $$ = new NodoAST({label: 'TIPO_IGUAL', hijos: [$1], linea: yylineno}); }
  | mas igual { $$ = new NodoAST({label: 'TIPO_IGUAL', hijos: [$1,$2], linea: yylineno}); }
  | menos igual { $$ = new NodoAST({label: 'TIPO_IGUAL', hijos: [$1,$2], linea: yylineno}); }
;

ASIGNACION_FOR /*-->TR - EJ<--*/
  : id TIPO_IGUAL EXP { $$ = new NodoAST({label: 'ASIGNACION_FOR', hijos: [$1,$2,$3], linea: yylineno}); }
  | id mas_mas { $$ = new NodoAST({label: 'ASIGNACION_FOR', hijos: [$1,$2], linea: yylineno}); }
  | id menos_menos { $$ = new NodoAST({label: 'ASIGNACION_FOR', hijos: [$1,$2], linea: yylineno}); }
;

SWITCH /*-->TR - EJ<--*/
  : switch par_izq EXP par_der llave_izq LISTA_CASE llave_der { $$ = new NodoAST({label: 'SWITCH', hijos: [$1,$2,$3,$4,$5,$6,$7], linea: yylineno}); }
;

LISTA_CASE /*-->TR - EJ<--*/
  : LISTA_CASE CASE { $$ = new NodoAST({label: 'LISTA_CASE', hijos: [...$1.hijos,$2], linea: yylineno}); }
  | CASE { $$ = new NodoAST({label: 'LISTA_CASE', hijos: [$1], linea: yylineno}); }
  | DEFAULT { $$ = new NodoAST({label: 'LISTA_CASE', hijos: [$1], linea: yylineno}); }
  | LISTA_CASE DEFAULT { $$ = new NodoAST({label: 'LISTA_CASE', hijos: [...$1.hijos,$2], linea: yylineno}); }
;

CASE /*-->TR - EJ<--*/
  : case EXP dos_puntos INSTRUCCIONES { $$ = new NodoAST({label: 'CASE', hijos: [$1,$2,$3,$4], linea: yylineno}); }
;

DEFAULT /*-->TR - EJ<--*/
  : default dos_puntos INSTRUCCIONES { $$ = new NodoAST({label: 'DEFAULT', hijos: [$1,$2,$3], linea: yylineno}); }
;

CONTINUE /*-->TR - EJ<--*/
  : continue punto_coma { $$ = new NodoAST({label: 'CONTINUE', hijos: [$1, $2], linea: yylineno}); }
;

BREAK /*-->TR - EJ<--*/
  : break punto_coma { $$ = new NodoAST({label: 'BREAK', hijos: [$1,$2], linea: yylineno}); }
;

RETURN /*-->TR - EJ<--*/
  : return EXP punto_coma { $$ = new NodoAST({label: 'RETURN', hijos: [$1,$2,$3], linea: yylineno}); }
  | return punto_coma { $$ = new NodoAST({label: 'RETURN', hijos: [$1,$2], linea: yylineno}); }
;

INSTRUCCION_SIEMPREQ /*-->TR - EJ<--*/
  : SIEMPREQ /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION_SIEMPREQ', hijos: [$1], linea: yylineno}); }
  | SIEMPREQ SIEMPREQN /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION_SIEMPREQ', hijos: [$1,$2], linea: yylineno}); }
  | SIEMPREQ LISTA_SIEMPREQN_SIEMPREQ /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION_SIEMPREQ', hijos: [$1,$2], linea: yylineno}); }
  | SIEMPREQ LISTA_SIEMPREQN_SIEMPREQ SIEMPREQN /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'INSTRUCCION_SIEMPREQ', hijos: [$1,$2,$3], linea: yylineno}); }
;

SIEMPREQ /*-->TR - EJ<--*/
  : siempreq par_izq EXP par_der llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'SIEMPREQ', hijos: [$1,$2,$3,$4,$5,$6,$7], linea: yylineno}); }
;

SIEMPREQN /*-->TR - EJ<--*/
  : siempreqn llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'SIEMPREQN', hijos: [$1,$2,$3,$4], linea: yylineno}); }
;

SIEMPREQN_SIEMPREQUE /*-->TR - EJ<--*/
  : siempreqn siempreq par_izq EXP par_der llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'SIEMPREQN_SIEMPREQ', hijos: [$1,$2,$3,$4,$5,$6,$7,$8], linea: yylineno}); }
;

LISTA_SIEMPREQN_SIEMPREQ /*-->TR - EJ<--*/
  : LISTA_SIEMPREQN_SIEMPREQ SIEMPREQN_SIEMPREQ /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_SIEMPREQN_SIEMPREQ', hijos: [...$1.hijos, $2], linea: yylineno}); }
  | SIEMPREQN_SIEMPREQ /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_SIEMPREQN_SIEMPREQ', hijos: [$1], linea: yylineno}); }
;

PUSH_ARREGLO /*-->TR - EJ<--*/
  : id punto push par_izq EXP par_der punto_coma /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'PUSH_ARREGLO', hijos: [$1,$2,$3,$4,$5,$6,$7], linea: yylineno}); }
  | id LISTA_ACCESOS_TYPE punto push par_izq EXP par_der punto_coma /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'PUSH_ARREGLO', hijos: [$1,$2,$3,$4,$5,$6,$7,$8], linea: yylineno}); }
;

DECLARACION_METODO /*-->TR - EJ<--*/
  //Metodo sin parametros y con tipo -> metodo test() : TIPO { INSTRUCCIONES }
  /*-->TR - EJ<--*/
  : metodo id par_izq par_der dos_puntos TIPO_VARIABLE_NATIVA llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'DECLARACION_METODO', hijos: [$1, $2, $3, $4, $5, $6, $7, $8, $9], linea: yylineno}); }

   //Metodo sin parametros y con tipo -> metodo test() : TIPO[][] { INSTRUCCIONES }
  | metodo id par_izq par_der dos_puntos TIPO_VARIABLE_NATIVA LISTA_CORCHETES llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'DECLARACION_METODO', hijos: [$1, $2, $3, $4, $5, $6, $7, $8, $9, $10], linea: yylineno}); }

  //Metodo sin parametros y sin tipo -> metodo test() { INSTRUCCIONES }
  /*-->TR - EJ<--*/
  | metodo id par_izq par_der llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'DECLARACION_METODO', hijos: [$1, $2, $3, $4, $5, $6, $7], linea: yylineno}); }

  //Metodo con parametros y con tipo -> metodo test ( LISTA_PARAMETROS ) : TIPO { INSTRUCCIONES }
  /*-->TR - EJ<--*/
  | metodo id par_izq LISTA_PARAMETROS par_der dos_puntos TIPO_VARIABLE_NATIVA llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'DECLARACION_METODO', hijos: [$1, $2, $3, $4, $5, $6, $7, $8, $9, $10], linea: yylineno}); }

  //Metodo con parametros y con tipo -> metodo test ( LISTA_PARAMETROS ) : TIPO[][] { INSTRUCCIONES }
  | metodo id par_izq LISTA_PARAMETROS par_der dos_puntos TIPO_VARIABLE_NATIVA LISTA_CORCHETES llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'DECLARACION_METODO', hijos: [$1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11], linea: yylineno}); }

  //Metodo con parametros y sin tipo -> metodo test ( LISTA_PARAMETROS ) { INSTRUCCIONES }
  /*-->TR - EJ<--*/
  | metodo id par_izq LISTA_PARAMETROS par_der llave_izq INSTRUCCIONES llave_der { $$ = new NodoAST({label: 'DECLARACION_METODO', hijos: [$1, $2, $3, $4, $5, $6, $7, $8], linea: yylineno}); }

;

LISTA_PARAMETROS /*-->TR - EJ<--*/
  : LISTA_PARAMETROS coma PARAMETRO { $$ = new NodoAST({label: 'LISTA_PARAMETROS', hijos: [...$1.hijos,$2,$3], linea: yylineno}); } //Revisar si agrego o no coma
  | PARAMETRO { $$ = new NodoAST({label: 'LISTA_PARAMETROS', hijos: [$1], linea: yylineno}); }
;

PARAMETRO /*-->TR - EJ<--*/
  : id dos_puntos TIPO_VARIABLE_NATIVA { $$ = new NodoAST({label: 'PARAMETRO', hijos: [$1, $2, $3], linea: yylineno}); }
  | id dos_puntos TIPO_VARIABLE_NATIVA LISTA_CORCHETES { $$ = new NodoAST({label: 'PARAMETRO', hijos: [$1, $2, $3, $4], linea: yylineno}); }
  | id dos_puntos Array menor TIPO_VARIABLE_NATIVA mayor { $$ = new NodoAST({label: 'PARAMETRO', hijos: [$1,$2,$3,$4,$5,$6], linea: yylineno}); }
;

DECLARACION_TYPE /*-->TR - EJ<--*/
  : type id igual llave_izq LISTA_ATRIBUTOS llave_der { $$ = new NodoAST({label: 'DECLARACION_TYPE', hijos: [$1, $2, $3, $4, $5, $6], linea: yylineno}); }
  | type id igual llave_izq LISTA_ATRIBUTOS llave_der punto_coma { $$ = new NodoAST({label: 'DECLARACION_TYPE', hijos: [$1, $2, $3, $4, $5, $6, $7], linea: yylineno}); }
;

LISTA_ATRIBUTOS /*-->TR -- EJ<--*/
  : ATRIBUTO coma LISTA_ATRIBUTOS { $$ = new NodoAST({label: 'LISTA_ATRIBUTOS', hijos: [$1,$2,...$3.hijos], linea: yylineno}); } //Revisar si agrego o no coma
  | ATRIBUTO { $$ = new NodoAST({label: 'LISTA_ATRIBUTOS', hijos: [$1], linea: yylineno}); }
;

ATRIBUTO /*-->TR - EJ<--*/
  : id dos_puntos TIPO_VARIABLE_NATIVA { $$ = new NodoAST({label: 'ATRIBUTO', hijos: [$1, $2, $3], linea: yylineno}); }
  | id dos_puntos TIPO_VARIABLE_NATIVA LISTA_CORCHETES { $$ = new NodoAST({label: 'ATRIBUTO', hijos: [$1,$2,$3,$4], linea: yylineno}); }
;

DECLARACION_VARIABLE /*-->TR - EJ<--*/
  : TIPO_DEC_VARIABLE LISTA_DECLARACIONES punto_coma { $$ = new NodoAST({label: 'DECLARACION_VARIABLE', hijos: [$1,$2,$3], linea: yylineno});  }
;

//TODO: REVISAR DEC_ID_COR Y DEC_ID_COR_EXP
LISTA_DECLARACIONES /*-->TR - EJ<--*/
  : LISTA_DECLARACIONES coma DEC_ID /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [...$1.hijos,$3], linea: yylineno}); } //No utilice las comas
  | LISTA_DECLARACIONES coma DEC_ID_TIPO /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [...$1.hijos,$3], linea: yylineno}); }
  | LISTA_DECLARACIONES coma DEC_ID_TIPO_CORCHETES /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [...$1.hijos,$3], linea: yylineno}); }
  | LISTA_DECLARACIONES coma DEC_ID_EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [...$1.hijos,$3], linea: yylineno}); }
  | LISTA_DECLARACIONES coma DEC_ID_TIPO_EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [...$1.hijos,$3], linea: yylineno}); }
  | LISTA_DECLARACIONES coma DEC_ID_TIPO_CORCHETES_EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [...$1.hijos,$3], linea: yylineno}); }
  | DEC_ID /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [$1], linea: yylineno}); }
  | DEC_ID_TIPO /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [$1], linea: yylineno}); }
  | DEC_ID_TIPO_CORCHETES /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [$1], linea: yylineno}); }
  | DEC_ID_EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [$1], linea: yylineno}); }
  | DEC_ID_TIPO_EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [$1], linea: yylineno}); }
  | DEC_ID_TIPO_CORCHETES_EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'LISTA_DECLARACIONES', hijos: [$1], linea: yylineno}); }
;

//let id : TIPO_VARIABLE_NATIVA LISTA_CORCHETES = EXP ;
DEC_ID_TIPO_CORCHETES_EXP /*-->TR - EJ<--*/
  : id dos_puntos TIPO_VARIABLE_NATIVA LISTA_CORCHETES igual EXP { $$ = new NodoAST({label: 'DEC_ID_TIPO_CORCHETES_EXP', hijos: [$1,$2,$3,$4,$5,$6], linea: yylineno}); }
;

//let id : TIPO_VARIABLE_NATIVA = EXP;
DEC_ID_TIPO_EXP /*-->TR - EJ<--*/
  : id dos_puntos TIPO_VARIABLE_NATIVA igual EXP { $$ = new NodoAST({label: 'DEC_ID_TIPO_EXP', hijos: [$1,$2,$3,$4,$5], linea: yylineno}); }
;

//let id = EXP ;
DEC_ID_EXP /*-->TR - EJ<--*/
  : id igual EXP { $$ = new NodoAST({label: 'DEC_ID_EXP', hijos: [$1,$2,$3], linea: yylineno}); }
;

//let id : TIPO_VARIABLE_NATIVA ;
DEC_ID_TIPO  /*-->TR - EJ<--*/
  : id dos_puntos TIPO_VARIABLE_NATIVA { $$ = new NodoAST({label: 'DEC_ID_TIPO', hijos: [$1,$2,$3], linea: yylineno}); }
;

//let id ;
DEC_ID  /*-->TR - EJ<--*/
  : id  { $$ = new NodoAST({label: 'DEC_ID', hijos: [$1], linea: yylineno}); }
;

//let id : TIPO_VARIABLE_NATIVA LISTA_CORCHETES ;
DEC_ID_TIPO_CORCHETES /*-->TR - EJ<--*/
  : id dos_puntos TIPO_VARIABLE_NATIVA LISTA_CORCHETES { $$ = new NodoAST({label: 'DEC_ID_TIPO_CORCHETES', hijos: [$1,$2,$3,$4], linea: yylineno}); }
;

LISTA_CORCHETES /*-->TR - EJ<--*/
  : LISTA_CORCHETES cor_izq cor_der { $$ = new NodoAST({label: 'LISTA_CORCHETES', hijos: [...$1.hijos, '[]'], linea: yylineno}); }
  | cor_izq cor_der { $$ = new NodoAST({label: 'LISTA_CORCHETES', hijos: ['[]'], linea: yylineno}); }
;

INCREMENTO_DECREMENTO
  : id mas_mas punto_coma { $$ = new NodoAST({label: 'INCREMENTO_DECREMENTO', hijos: [$1,$2,$3], linea: yylineno}); }
  | id menos_menos punto_coma { $$ = new NodoAST({label: 'INCREMENTO_DECREMENTO', hijos: [$1,$2,$3], linea: yylineno}); }
;

EXP
  //Operaciones Aritmeticas
  : menos EXP %prec umenos /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2], linea: yylineno}); }
  | EXP mas EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP menos EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP por EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP div EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP mod EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP potencia EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | id mas_mas /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2], linea: yylineno}); }
  | id menos_menos /*-->TR- EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2], linea: yylineno}); }
  | par_izq EXP par_der /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  //Operaciones de Comparacion
  | EXP mayor EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP menor EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP mayor_igual EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP menor_igual EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP igual_que EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP dif_que EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  //Operaciones Lógicas
  | EXP ademas EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | EXP o_quizas EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2, $3], linea: yylineno}); }
  | no EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1, $2], linea: yylineno}); }
  //Valores Primitivos
  | number /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [new NodoAST({label: 'NUMBER', hijos: [$1], linea: yylineno})], linea: yylineno}); }
  | string /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [new NodoAST({label: 'STRING', hijos: [$1], linea: yylineno})], linea: yylineno}); }
  | id /*-->TR - EJ<--*/  { $$ = new NodoAST({label: 'EXP', hijos: [new NodoAST({label: 'ID', hijos: [$1], linea: yylineno})], linea: yylineno}); }
  | true /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [new NodoAST({label: 'BOOLEAN', hijos: [$1], linea: yylineno})], linea: yylineno}); }
  | false /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [new NodoAST({label: 'BOOLEAN', hijos: [$1], linea: yylineno})], linea: yylineno}); }
  | null /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [new NodoAST({label: 'NULL', hijos: [$1], linea: yylineno})], linea: yylineno}); }
  //Arreglos
  | cor_izq LISTA_EXPRESIONES cor_der /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1,$2,$3], linea: yylineno}); }
  | cor_izq cor_der /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1,$2], linea: yylineno}); }
  | ACCESO_ARREGLO /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1], linea: yylineno}); }
  | ARRAY_LENGTH /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1], linea: yylineno}); }
  | ARRAY_POP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1], linea: yylineno}); }
  //Types - accesos
  | ACCESO_TYPE /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1], linea: yylineno}); }
  | TYPE /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1], linea: yylineno}); }
  //Ternario
  | TERNARIO /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1], linea: yylineno}); }
  //Metodos
  | LLAMADA_METODO_EXP /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'EXP', hijos: [$1], linea: yylineno}); }
;

TYPE /*-->TR - EJ<--*/
  : llave_izq ATRIBUTOS_TYPE llave_der { $$ = new NodoAST({label: 'TYPE', hijos: [$1,$2,$3], linea: yylineno}); }
;

ATRIBUTOS_TYPE /*-->TR - EJ<--*/
  : ATRIBUTO_TYPE coma ATRIBUTOS_TYPE { $$ = new NodoAST({label: 'ATRIBUTOS_TYPE', hijos: [$1,$2,...$3.hijos], linea: yylineno}); }
  | ATRIBUTO_TYPE { $$ = new NodoAST({label: 'ATRIBUTOS_TYPE', hijos: [$1], linea: yylineno}); }
;

ATRIBUTO_TYPE /*-->TR - EJ<--*/
  : id dos_puntos EXP { $$ = new NodoAST({label: 'ATRIBUTO_TYPE', hijos: [$1,$2,$3], linea: yylineno}); }
;

ARRAY_LENGTH /*-->TR - EJ<--*/
  : id punto length /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'ARRAY_LENGTH', hijos: [$1,$2,$3], linea: yylineno}); }
  | id LISTA_ACCESOS_ARREGLO punto length /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'ARRAY_LENGTH', hijos: [$1,$2,$3,$4], linea: yylineno}); }
  | id LISTA_ACCESOS_TYPE punto length /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'ARRAY_LENGTH', hijos: [$1,$2,$3,$4], linea: yylineno}); }
;

ARRAY_POP /*-->TR - EJ<--*/
  : id punto pop par_izq par_der /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'ARRAY_POP', hijos: [$1,$2,$3,$4,$5], linea: yylineno}); }
  | id LISTA_ACCESOS_ARREGLO punto pop par_izq par_der /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'ARRAY_POP', hijos: [$1,$2,$3,$4,$5,$6], linea: yylineno}); }
  | id LISTA_ACCESOS_TYPE punto pop par_izq par_der /*-->TR - EJ<--*/ { $$ = new NodoAST({label: 'ARRAY_POP', hijos: [$1,$2,$3,$4,$5,$6], linea: yylineno}); }
;

TERNARIO /*-->TR - EJ<--*/
  : EXP interrogacion EXP dos_puntos EXP { $$ = new NodoAST({label: 'TERNARIO', hijos: [$1,$2,$3,$4,$5], linea: yylineno}); }
;

ACCESO_ARREGLO /*-->TR - EJ<--*/
  : id LISTA_ACCESOS_ARREGLO { $$ = new NodoAST({label: 'ACCESO_ARREGLO', hijos: [$1, $2], linea: yylineno}); }
;

ACCESO_TYPE /*-->TR - EJ<--*/
  : id LISTA_ACCESOS_TYPE { $$ = new NodoAST({label: 'ACCESO_TYPE', hijos: [$1, $2], linea: yylineno}); }
;

LISTA_ACCESOS_TYPE /*-->TR - EJ<--*/
  : LISTA_ACCESOS_TYPE punto id { $$ = new NodoAST({label: 'LISTA_ACCESOS_TYPE', hijos: [...$1.hijos,$2,$3], linea: yylineno}); }
  | punto id { $$ = new NodoAST({label: 'LISTA_ACCESOS_TYPE', hijos: [$1,$2], linea: yylineno}); }
  | LISTA_ACCESOS_TYPE punto id LISTA_ACCESOS_ARREGLO { $$ = new NodoAST({label: 'LISTA_ACCESOS_TYPE', hijos: [...$1.hijos,$2,$3,$4], linea: yylineno}); }
  | punto id LISTA_ACCESOS_ARREGLO { $$ = new NodoAST({label: 'LISTA_ACCESOS_TYPE', hijos: [$1,$2,$3], linea: yylineno}); }
;

LISTA_ACCESOS_ARREGLO /*-->TR - EJ<--*/
  : LISTA_ACCESOS_ARREGLO cor_izq EXP cor_der { $$ = new NodoAST({label: 'LISTA_ACCESOS_ARREGLO', hijos: [...$1.hijos,$2,$3,$4], linea: yylineno}); }
  | cor_izq EXP cor_der { $$ = new NodoAST({label: 'LISTA_ACCESOS_ARREGLO', hijos: [$1,$2,$3], linea: yylineno}); }
;

LISTA_EXPRESIONES /*-->TR - EJ<--*/
  : LISTA_EXPRESIONES coma EXP { $$ = new NodoAST({label: 'LISTA_EXPRESIONES', hijos: [...$1.hijos,$2,$3], linea: yylineno}); }
  | EXP { $$ = new NodoAST({label: 'LISTA_EXPRESIONES', hijos: [$1], linea: yylineno}); }
;

/*TR - EJ*/
TIPO_DEC_VARIABLE
  : cam       { $$ = new NodoAST({label: 'TIPO_DEC_VARIABLE', hijos: [$1], linea: yylineno}); }
  | const     { $$ = new NodoAST({label: 'TIPO_DEC_VARIABLE', hijos: [$1], linea: yylineno}); }
;

/*TR - EJ*/
TIPO_VARIABLE_NATIVA
  : string  { $$ = new NodoAST({label: 'TIPO_VARIABLE_NATIVA', hijos: [$1], linea: yylineno}); }
  | number  { $$ = new NodoAST({label: 'TIPO_VARIABLE_NATIVA', hijos: [$1], linea: yylineno}); }
  | boolean { $$ = new NodoAST({label: 'TIPO_VARIABLE_NATIVA', hijos: [$1], linea: yylineno}); }
  | void    { $$ = new NodoAST({label: 'TIPO_VARIABLE_NATIVA', hijos: [$1], linea: yylineno}); }
  | id      { $$ = new NodoAST({label: 'TIPO_VARIABLE_NATIVA', hijos: [new NodoAST({label: 'ID', hijos: [$1], linea: yylineno})], linea: yylineno}); }
;

MUESTRA_LOG /*-->TR - EJ<--*/
  : muestra punto log par_izq LISTA_EXPRESIONES par_der punto_coma { $$ = new NodoAST({label: 'MUESTRA_LOG', hijos: [$1,$2,$3,$4,$5,$6,$7], linea: yylineno}); }
;
