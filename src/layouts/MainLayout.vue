<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar class="bg-light-blue-8">
        <div class="q-pa-md q-gutter-sm">
    <q-btn label="Instrucciones" color="dark" @click="basic = true" />

    <q-dialog v-model="basic" transition-show="rotate" transition-hide="rotate">
      <q-card>
        <q-card-section>
          <div class="text-h5" align="center">INSTRUCCIONES</div>
          <div class="text-h7" align="center">Puede mostrar datos por consola con el método ' muestra.log() '</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          <div class="q-pa-md" style="width: 500px">
    <q-list bordered class="rounded-borders">

      <q-expansion-item
        expand-separator
        icon="toc"
        label="Asignaciones"
      >
        <q-card>
          <q-card-section>
            Los asignaciones tienen la siguiente forma: ' #= '<br>
            &nbsp;&nbsp; · Ejemplos:<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1) n #= 55; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2) total #= 786; <br>
          </q-card-section>
        </q-card>
      </q-expansion-item>

      <q-expansion-item
        expand-separator
        icon="toc"
        label="Variables y Constantes"
      >
        <q-card>
          <q-card-section>
            Para declarar variables se usa la palabra reservada ' cam '<br>
            &nbsp;&nbsp; · Ejemplos:<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1) cam n; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2) cam sum #= 55; <br><br>
            Para declarar constantes se usa la palabra reservada ' inv '<br>
            &nbsp;&nbsp; · Ejemplos:<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1) inv n #= 20; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2) inv sum #= 55; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;« necesario inicializar las constantes con un valor »<br>
          </q-card-section>
        </q-card>
      </q-expansion-item>

      <q-expansion-item
        expand-separator
        icon="toc"
        label="Operadores"
      >
        <q-card>
          <q-card-section>
            <div class="q-pa-md" style="width: 450px">
            <q-list bordered class="rounded-borders">

              <q-expansion-item
                expand-separator
                icon="toc"
                label="Aritméticos"
              >
                <q-card>
                  <q-card-section>
                    &nbsp;&nbsp;  Para la «suma» se usa: ' #mas# '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplos:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1) 5 #mas# 7; <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2) muestra.log(17 #mas# 31); <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para la «resta» se usa: ' #menos# '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplos:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1) 20 #menos# 13; <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2) cam n #= 5 #menos# 7; <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para la «multiplicación» se usa: ' #por# '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplos:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1) 20 #por# 13; <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2) cam n #= 5 #por# 7; <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para la «división» se usa: ' #div# '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplos:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1) 21 #div# 7; <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2) muestra.log(90 #div# 10); <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para la «potencia» se usa: ' #pot# '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplos:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1) 21 #pot# 7; <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2) muestra.log(2 #pot# 4); <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para el «módulo» se usa: ' #mod# '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplos:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1) 21 #mod# 2; <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2) inv par #= 4 #mod# 2; <br>
                  </q-card-section>
                </q-card>
              </q-expansion-item>

              <q-expansion-item
                expand-separator
                icon="toc"
                label="Relacionales"
              >
                <q-card>
                  <q-card-section>
                    &nbsp;&nbsp;  Para comparar con «igual que» se usa: ' #== '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplo:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siempreq ( 15 #== 15) {...}<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para comparar con «diferente que» se usa: ' #!= '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplo:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siempreq ( 6 #!= 2) {...}<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para comparar con «menor que» se usa: ' #&lt; '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplo:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siempreq ( 8 #&lt; 12) {...}<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para comparar con «mayor que» se usa: ' #> '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplo:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siempreq ( 55 #> 2) {...}<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para comparar con «menor o igual que» se usa: ' #&lt;= '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplo:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siempreq ( 81 #&lt;= 82) {...}<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para comparar con «mayor o igual que» se usa: ' #>= '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplo:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siempreq ( 43 #>= 43) {...}<br>
                    
                  </q-card-section>
                </q-card>
              </q-expansion-item>

              <q-expansion-item
                expand-separator
                icon="toc"
                label="Lógicos"
              >
                <q-card>
                  <q-card-section>
                    &nbsp;&nbsp;  Para «Y - AND» se usa: ' #ademas# '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplo:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siempreq ( 15 #> 12 #ademas# 12 #> 1) {...}<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para «O - OR» se usa: ' #oquizas# '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplo:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siempreq ( 25 #> 112 #oquizas# 22 #> 21) {...}<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - - - - - - - - - <br>
                    &nbsp;&nbsp;  Para la «NEGACIÓN - NOT» se usa: ' #no# '<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; · Ejemplo:<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siempreq (#no# i#>6) {...}<br>
                  </q-card-section>
                </q-card>
              </q-expansion-item>
            </q-list>
          </div>
          </q-card-section>
        </q-card>
      </q-expansion-item>

      <q-expansion-item
        expand-separator
        icon="toc"
        label="Condicionales"
      >
        <q-card>
          <q-card-section>
            Los condicionales tienen la siguiente forma: <br>
            siempreq ( --condición-- ) {<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- Instruciones si la condición es verdadera -- <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...  <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;« necesario incluir por lo menos una instrucción »<br>
            } -- cierre de Instrucciones <br>
            siempreqn { <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- Instruciones si la condición es falsa -- <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...  <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;« necesario incluir por lo menos una instrucción »<br>
            } -- cierre de Instrucciones<br>
            - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -<br>
             · Ejemplos:<br>
            (1) cam n #= 4;<br> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;siempreq ( n #> 10 ) {<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log(n, "es mayor que 10");<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;siempreqn { <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log(n, "no es mayor que 10");<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
            - - - - - - - - - - - - - <br>
            (2) cam n #= 7;<br> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;siempreq ( n #mod# 2 #== 0) {<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log(n, "es par");<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;siempreqn { <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log(n, "no es par");<br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;siempreq ( n #> 6 ) {<br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log("y es mayor que 6");<br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;siempreqn { <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log("y no es mayor que 6");<br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
          </q-card-section>
        </q-card>
      </q-expansion-item>

      <q-expansion-item
        expand-separator
        icon="toc"
        label="Ciclos"
      >
        <q-card>
          <q-card-section>
            <div class="q-pa-md" style="width: 450px">
            <q-list bordered class="rounded-borders">

              <q-expansion-item
                expand-separator
                icon="toc"
                label="Recorre (ciclo for)"
              >
                <q-card>
                  <q-card-section>
                    Los ciclos (for) tienen la siguiente forma:<br>
                    recorre ( estado inicial ; condicion ; incremento de variable ){<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- Instruciones -- <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ... <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;« necesario incluir por lo menos una instrucción »<br>
                    } -- cierre de ciclo<br>
                    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -<br>
                    · Ejemplos:<br>
                    (1) recorre ( cam i #= 0 ; i #&lt; 5 ; i #incr) {<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log("Hola mundo");<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: ' #incr ' se usa para hacer incrementos de 1 */<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
                    - - - - - - - - - - - - - <br>
                    (2) recorre ( cam i #= 6 ; i #> 0 ; i #desc) {<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: ' #desc ' se usa para disminuir en 1 */<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;recorre ( cam j #= 0 ; j #&lt; 6 ; j #= j #mas# 2) { <br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log("Hola mundo");<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: j se aumenta de 2 en 2 */<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
                    
                  </q-card-section>
                </q-card>
              </q-expansion-item>

              <q-expansion-item
                expand-separator
                icon="toc"
                label="Durante (ciclo while)"
              >
                <q-card>
                  <q-card-section>
                    Los ciclos (while) tienen la siguiente forma:<br>
                    durante ( --condición-- ){<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- Instruciones -- <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ... <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;« necesario incluir por lo menos una instrucción »<br>
                    } -- cierre de ciclo<br>
                    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -<br>
                    · Ejemplos:<br>
                    (1) cam n #= 4;<br> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;durante ( n #&lt; 8 ) {<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log("Hola mundo");<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;n #incr;<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: ' #incr ' se usa para hacer incrementos de 1 */<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
                    - - - - - - - - - - - - - <br>
                    (2) cam i #= 12;<br> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;durante ( i #> 7) {<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i #desc;<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cam j #= 0;<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: ' #desc ' se usa para disminuir en 1 */<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;durante ( j #&lt; 9) { <br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log("Hola mundo");<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;j #= j #mas# 3;<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: j se aumenta de 3 en 3 */<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
                    
                  </q-card-section>
                </q-card>
              </q-expansion-item>

              <q-expansion-item
                expand-separator
                icon="toc"
                label="Haz durante (ciclo do while)"
              >
                <q-card>
                  <q-card-section>
                    Los ciclos (do while) tienen la siguiente forma:<br>
                    haz{<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- Instruciones -- <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ... <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;« necesario incluir por lo menos una instrucción »<br>
                    } ( --condición-- );<br>
                    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -<br>
                    · Ejemplos:<br>
                    (1) cam n #= 0;<br> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;haz {<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log("Hola mundo");<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;n #incr;<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: ' #incr ' se usa para hacer incrementos de 1 */<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} durante (n #&lt; 5);<br>
                    - - - - - - - - - - - - - <br>
                    (2) cam i #= 0;<br> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;haz {<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i #incr;<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cam j #= 5;<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: ' #incr ' se usa para hacer incrementos de 1 */<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;haz { <br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;j #desc;<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log("Hola mundo");<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: ' #desc ' se usa para disminuir en 1 */<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} durante (j #> 0);<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}durante (i #&lt; 5);<br>
                    
                  </q-card-section>
                </q-card>
              </q-expansion-item>
            </q-list>
          </div>
          </q-card-section>
        </q-card>
      </q-expansion-item>

      <q-expansion-item
        expand-separator
        icon="toc"
        label="Funciones"
      >
        <q-card>
          <q-card-section>
            Las fuciones tienen las siguiente forma: <br>
            metodo nombre (par 1 : tipo , par n : tipo ) : tipo de retorno {<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- Instruciones -- <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...  <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;« para retornar se usa la palabra reservada ' retorna ' »<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;« necesario incluir por lo menos una instrucción »<br>
            } -- cierre de Instrucciones <br>
            - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -<br>
             · Ejemplos:<br>
            (1) metodo sumar (a : number , b : number) : number {<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;retorna a #mas# b;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// ... <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log(sumar(5,7)); <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: number es un tipo de dato que se usa para cualquier <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clase de número (entero,flotante,etc) */ <br>
            - - - - - - - - - - - - - <br>
            (2) metodo ajustar (n : number) : number {<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;retorna n #menos# 16.4;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// ... <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;muestra.log(ajustar(44)); <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Nota: number es un tipo de dato que se usa para cualquier <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clase de número (entero,flotante,etc) */ <br>
          </q-card-section>
        </q-card>
      </q-expansion-item>
      
    </q-list>
  </div>
  <div class="text-h7" align="center">« para finalizar cada instrucción debe colocar ' ; ' (punto y coma) »</div>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="ok" color="dark" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>

    
  </div>
        <q-toolbar-title>
          Act 7 - Compiladores
        </q-toolbar-title>

        <div>Foronda Cristian - Gustavo Solano - Jorge Villarreal</div>
      </q-toolbar>
    </q-header>

    <q-page-container class="bg-grey-1">
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>

export default {
  data () {
    return {
      basic: false,
      fixed: false
    }
  }
}
</script>
