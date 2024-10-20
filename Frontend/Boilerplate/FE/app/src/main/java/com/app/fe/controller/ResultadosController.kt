package com.app.fe.controller

import com.app.fe.models.Resultados

class ResultadosController {
    private var resultados: Resultados? = null

    //Método para setear los resultados
    fun setResultados(resultados: Resultados){
        this.resultados = resultados
    }

    //Métodos para acceder a los resultados desde la vista
    fun getClasificacion(): String{
        return resultados?.getClasificacion() ?: "No datos obtenidos"
    }

    fun getResultado(key: String): Any? {
        return resultados?.getResultados(key)
    }

    fun getResultadoKeys(): List<String> {
        return resultados?.getKeys() ?: emptyList();
    }
}