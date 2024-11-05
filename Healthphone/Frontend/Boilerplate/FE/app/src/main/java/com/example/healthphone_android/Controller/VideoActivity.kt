package com.example.healthphone_android.Controller

import android.content.Intent
import android.media.MediaPlayer
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.widget.VideoView
import androidx.appcompat.app.AppCompatActivity
import com.example.healthphone_android.R


class VideoActivity : AppCompatActivity() {

    private lateinit var videoView: VideoView
    private val delayMillis: Long = 7000 // Tiempo de espera en milisegundos (7 segundos)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_video)

        videoView = findViewById(R.id.videoView)
        val videoUri: Uri = Uri.parse("android.resource://" + packageName + "/" + R.raw.video_scaneo)

        videoView.setVideoURI(videoUri)
        videoView.setOnPreparedListener { mediaPlayer: MediaPlayer ->
            mediaPlayer.isLooping = true // Opcional: para que el video se repita
            mediaPlayer.setVolume(0f, 0f) // Establecer el volumen a 0 para quitar el audio
        }
        videoView.start() // Inicia la reproducción del video

        // Manejo para iniciar la siguiente actividad después de un retraso
        Handler().postDelayed({
            // Iniciar la siguiente actividad
            val intent = Intent(this, ResultadosActivity::class.java) // Cambia ResultadosActivity a la actividad deseada
            startActivity(intent)
            finish() // Opcional: cierra esta actividad
        }, delayMillis)

    }
}
