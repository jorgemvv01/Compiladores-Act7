"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Metodo = void 0;
class Metodo {
    constructor(id, instrucciones, tipo_return = 5 /* VOID */, lista_parametros = null) {
        Object.assign(this, { id, instrucciones, tipo_return, lista_parametros });
    }
    hasReturn() {
        return this.tipo_return != 5 /* VOID */;
    }
    hasParametros() {
        return this.lista_parametros != null;
    }
    getParametrosSize() {
        return this.hasParametros() ? this.lista_parametros.length : 0;
    }
    toString() {
        const parametros = this.lista_parametros != null ? this.lista_parametros.length : 0;
        let salida = `Metodo: ${this.id} - Parametros: ${parametros} - Return Asignado: ${this.hasReturn() ? 'Si' : 'No'}`;
        return salida;
    }
}
exports.Metodo = Metodo;
