package com.app.fe.vista

import android.os.Bundle
import android.content.Intent //Librería encargada de cambiar de pantallas
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge

import androidx.compose.material3.Scaffold

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.background
import androidx.compose.foundation.Image
import androidx.compose.foundation.border
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import android.util.Log
import com.app.fe.ui.theme.FETheme
import com.app.fe.R

class CamaraVista : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            FETheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    CameraMockup(modifier = Modifier.padding(innerPadding))
                }
            }
        }
    }
    @Preview(showBackground = true)
    @Composable
    fun CameraMockup(modifier: Modifier = Modifier){
        //Variable de estados para tomar el estado de escaneo
        var isScanning by remember { mutableStateOf(false) }


        Box (
            modifier = modifier
                .fillMaxSize()
                .background(Color.Black),
            contentAlignment = Alignment.BottomCenter,
        ) {

            //Metemos la imagen y borders juntos en un Box (entiendo funciona similar a un Div)
            Box (
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(2f/3f)
                    .background(Color.Transparent)
                    .border(5.dp, Color.Red)
                    .align(Alignment.Center)
            ){
                //Colocamos la imagen como tal
                Image(
                    painter = painterResource(id = R.drawable.persona),
                    contentDescription = "Persona siendo escaneada",
                    modifier = Modifier
                        .fillMaxSize()
                )
            }

            // Show the scanning status as text
            Text(
                text = if (isScanning) "Scanning..." else "",
                color = Color.White,
                modifier = Modifier
                    .align(Alignment.TopCenter)
                    .padding(top = 16.dp)
            )

            //Botón de escaneo
            Button(
                onClick = {
                    //Desactivamos el botón como tal
                    isScanning = !isScanning;
                    Log.d("Camara Vista", "Boton clickeado, isScanning: $isScanning")

                    //Navegamos a ResultadosVista cuando el escaneo termine
                    if (isScanning) {
                        val intent = Intent(this@CamaraVista, ResultadosVista::class.java)
                        startActivity(intent)
                    }
                },
                shape = CircleShape,
                colors = androidx.compose.material3.ButtonDefaults.buttonColors(
                    containerColor = if (isScanning) Color.DarkGray else Color.White,
                ),
                modifier = Modifier
                    .padding(bottom = 32.dp)
                    .size(80.dp)
                    .border(
                        width = 4.dp,
                        color = Color.Gray,
                        shape = CircleShape
                    )
            ) {}
        }
    }

}



