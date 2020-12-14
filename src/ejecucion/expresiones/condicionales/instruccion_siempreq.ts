import { Break } from "../../break";
import { Continue } from "../../continue";
import { Entorno } from "../../entorno";
import { Siempreq } from "../../siempreq";
import { Instruccion } from "../../instruccion";
import { Return } from "../../return";

export class InstruccionSiempreq extends Instruccion{
  lista_siempreqs: Array<Siempreq>;

  constructor(linea: string, lista_siempreqs: Array<Siempreq>){
    super(linea);
    Object.assign(this, {lista_siempreqs});
  }

  ejecutar(e: Entorno) {
    for(let inst_siempreq of this.lista_siempreqs){
      const condicion = inst_siempreq.condicion;
      const instrucciones = inst_siempreq.instrucciones;

      //Si la condicion es verdadera
      if(condicion.ejecutar(e)){
        //Entorno generado por el if
        const entorno = new Entorno(e);
        //Ejecuto las instrucciones
        for(let instruccion of instrucciones){
          const resp = instruccion.ejecutar(entorno);
          //Validacion de sentencias Break, Continue o Return
          if(resp instanceof Break || resp instanceof Continue || resp instanceof Return ){
            return resp;
          }
        }
        //Finalizo la ejecucion de la instruccion if
        return;
      }
    }
  }

}
