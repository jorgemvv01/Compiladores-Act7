import { Instruccion } from "./instruccion";

export class Siempreq {
  condicion: Instruccion;
  instrucciones: Array<Instruccion>;

  constructor(condicion: Instruccion, instrucciones: Array<Instruccion>){
    Object.assign(this, {condicion, instrucciones});
  }
}
