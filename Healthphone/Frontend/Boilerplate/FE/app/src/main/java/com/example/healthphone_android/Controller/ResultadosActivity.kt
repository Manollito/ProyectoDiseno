package com.example.healthphone_android.Controller


import android.os.Bundle
import android.util.Log
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.lifecycle.lifecycleScope
import com.example.healthphone_android.ConnectionToEndpoint.CommunicationFromSNS
import com.example.healthphone_android.Models.ResponseData
import com.example.healthphone_android.Models.Resultados
import com.example.healthphone_android.R
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import retrofit2.Response

class ResultadosActivity : AppCompatActivity() {
    private val communicationFromSNS = CommunicationFromSNS()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        obtenerResultados("tu_organization", "tu_site")
        setContentView(R.layout.activity_resultados)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

    // Llama al método para obtener los resultados

    }

    private fun obtenerResultados(organization: String, site: String) {
        lifecycleScope.launch {
            val response = withContext(Dispatchers.IO) {
                communicationFromSNS.apiService.categorizePatient()
            }

            if (response.isSuccessful) {
                val resultadosResponse = response.body() // Obtenemos el cuerpo de la respuesta
                Log.d("API Response", "Response Body: $resultadosResponse")

                // Asegúrate de que los resultadosResponse no sean nulos
                resultadosResponse?.let {
                    // Aquí accedemos al objeto ResponseData
                    val resultados = it.response // Accediendo a la propiedad "response"
                    mostrarResultados(resultados) // Pasamos el objeto ResponseData a mostrarResultados
                    Log.d("API Result", "Resultado: ${resultados.result}")  // Imprime el resultado en Logcat
                } ?: run {
                    mostrarResultados("No se encontraron resultados.")
                }
            } else {
                mostrarResultados("Error en la respuesta: ${response.message()}")
            }
        }
    }

    private fun mostrarResultados(resultados: ResponseData) {
        val categorizacionResultTextView = findViewById<TextView>(R.id.categorizaciónResult)
        categorizacionResultTextView.text = resultados.result // Muestra el resultado
        val temperatureResultTextView = findViewById<TextView>(R.id.temperaturaResult)
        temperatureResultTextView.text = ("${resultados.measures.Temperatura.cantidad} ${resultados.measures.Temperatura.unidad}")
        val weightResultTextView = findViewById<TextView>(R.id.pesoResult)
        weightResultTextView.text = ("${resultados.measures.Peso.cantidad} ${resultados.measures.Peso.unidad}")
        val heightResultTextView = findViewById<TextView>(R.id.alturaResult)
        heightResultTextView.text = ("${resultados.measures.Altura.cantidad} ${resultados.measures.Altura.unidad}")

    }

    // Sobrecarga de mostrarResultados para manejar el caso de error
    private fun mostrarResultados(mensaje: String) {
        val categorizacionResultTextView = findViewById<TextView>(R.id.categorizaciónResult)
        categorizacionResultTextView.text = mensaje
    }
}
