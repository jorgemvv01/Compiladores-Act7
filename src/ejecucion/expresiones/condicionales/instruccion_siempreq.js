"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.InstruccionSiempreq = void 0;
const break_1 = require("../../break");
const continue_1 = require("../../continue");
const entorno_1 = require("../../entorno");
const instruccion_1 = require("../../instruccion");
const return_1 = require("../../return");
class InstruccionSiempreq extends instruccion_1.Instruccion {
    constructor(linea, lista_siempreqs) {
        super(linea);
        Object.assign(this, { lista_siempreqs });
    }
    ejecutar(e) {
        for (let inst_siempreq of this.lista_siempreqs) {
            const condicion = inst_siempreq.condicion;
            const instrucciones = inst_siempreq.instrucciones;
            //Si la condicion es verdadera
            if (condicion.ejecutar(e)) {
                //Entorno generado por el if
                const entorno = new entorno_1.Entorno(e);
                //Ejecuto las instrucciones
                for (let instruccion of instrucciones) {
                    const resp = instruccion.ejecutar(entorno);
                    //Validacion de sentencias Break, Continue o Return
                    if (resp instanceof break_1.Break || resp instanceof continue_1.Continue || resp instanceof return_1.Return) {
                        return resp;
                    }
                }
                //Finalizo la ejecucion de la instruccion if
                return;
            }
        }
    }
}
exports.InstruccionSiempreq = InstruccionSiempreq;
