package com.app.fe.service_calls

import com.app.fe.models.Resultados
import org.json.JSONObject

class CommunicationFromSNS {
    //Recibimos el JSON como tal del SNS
    fun receiveResultadosJSON(jsonString: String): Resultados{
        //Parseamos el JSON String
        val jsonObject = JSONObject(jsonString);

        //Extraemos los datos necesarios en un mapa
        val resultsMap = mutableMapOf<String, Any>()
        jsonObject.keys().forEach { key ->
            resultsMap[key] =jsonObject.get(key)
        }

        //Creamos y retornamos un objeto tipo Resultados
        return Resultados(resultsMap);
    }
}