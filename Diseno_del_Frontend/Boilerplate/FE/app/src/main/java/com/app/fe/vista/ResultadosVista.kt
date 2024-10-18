package com.app.fe.vista

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.*
import androidx.compose.material3.MaterialTheme

import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.Alignment
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview

import com.app.fe.ui.theme.FETheme

class ResultadosVista: ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            FETheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    ResultadosMockup(modifier = Modifier.padding(innerPadding))
                }
            }
        }
    }

    @Preview(showBackground = true)
    @Composable
    fun ResultadosMockup(modifier: Modifier = Modifier) {
        Box (
            modifier = modifier
                .fillMaxSize()
                .padding(top = 16.dp),
            contentAlignment = Alignment.TopCenter
        ) {
            Column (
                modifier = modifier
                    .fillMaxWidth()
                    .padding(vertical = 16.dp, horizontal = 6.dp), //Agregamos un padding vertical
                horizontalAlignment = Alignment.Start
            )
            {
                //Titulo
                Text(
                    text = "Resultados de Escaneo",
                    style = MaterialTheme.typography.headlineLarge.copy(
                        fontWeight = FontWeight.Bold,
                        color = Color.Black
                    )
                )
                Spacer(modifier = modifier.height(32.dp)) //Espacio entre textos

                Text(
                    text = "Clasificacion:  Verde",
                    style = MaterialTheme.typography.headlineSmall.copy(
                        fontWeight = FontWeight.Bold,
                        color = Color.Black
                    )
                )
                Spacer(modifier = modifier.height(10.dp)) //Espacio entre textos

                //Temperatura
                Text(
                    text = "Temperatura:  36.5 °C",
                    style = MaterialTheme.typography.bodyMedium.copy(
                        fontWeight = FontWeight.Medium,
                        color = Color.Black
                    )
                )
                Spacer(modifier = modifier.height(10.dp)) //Espacio entre textos

                //Frecuencia cardíaca
                Text(
                    text = "Frecuencia Cardíaca:  75 BPM",
                    style = MaterialTheme.typography.bodyMedium.copy(
                        fontWeight = FontWeight.Medium,
                        color = Color.Black
                    )
                )
                Spacer(modifier = modifier.height(8.dp)) //Espacio entre textos
            }

        }
    }
}