package com.example.fe.models

class Resultados (resultados: Map<String, Any>){
    private val resultados: Map<String, Any> = resultados.filterKeys { it != "clasificacion" };

    fun getResultados(key: String): Any? {
        return resultados[key]
    };

}