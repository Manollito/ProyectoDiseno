package com.app.fe.models

class Resultados (resultados: Map<String, Any>){
    //Filtramos fuera clasificación y mantenemos el resto de datos
    private val resultados: Map<String, Any> = resultados.filterKeys { it != "clasificacion" };
    private val clasificacion: String = resultados["clasificacion"] as? String?: "Desconocido";

    //Metodo para obtener una llave o tipo de dato específico
    fun getResultados(key: String): Any? {
        return resultados[key]
    };

    fun getClasificacion() : String {
        return this.clasificacion
    }

    fun getKeys(): List<String> {
        return resultados.keys.toList();
    }

}