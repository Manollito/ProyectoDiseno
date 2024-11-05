package com.example.healthphone_android.Views

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.provider.MediaStore
import android.provider.MediaStore.Video
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.lifecycleScope
import com.amazonaws.auth.BasicAWSCredentials
import com.amazonaws.services.s3.AmazonS3Client
import com.amazonaws.services.s3.model.ObjectMetadata
import com.example.healthphone_android.ConnectionToEndpoint.CommunicationFromSNS
import com.example.healthphone_android.Controller.CameraScreen
import com.example.healthphone_android.Controller.VideoActivity
import com.example.healthphone_android.Models.Resultados
import kotlinx.coroutines.launch
import retrofit2.HttpException
import retrofit2.Retrofit
import java.io.File
import java.io.FileInputStream
import java.io.IOException

class CameraActivity : ComponentActivity() {
    private var videoUri = mutableStateOf<Uri?>(null)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            CameraScreen(
                videoUri = videoUri.value,
                onCaptureVideo = { openCamera() },
                onUploadVideo = { uri -> uploadVideoToS3(uri) },
                isVideoCaptured = videoUri.value != null // Indica si un video ha sido grabado
            )
        }
    }

    // Método para abrir la cámara
    private fun openCamera() {
        val takeVideoIntent = Intent(MediaStore.ACTION_VIDEO_CAPTURE)
        startActivityForResult(takeVideoIntent, REQUEST_VIDEO_CAPTURE)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_VIDEO_CAPTURE && resultCode == RESULT_OK) {
            // Almacena el URI del video grabado
            videoUri.value = data?.data
            // Actualiza la UI después de grabar el video
            setContent {
                CameraScreen(
                    videoUri = videoUri.value,
                    onCaptureVideo = { openCamera() },
                    onUploadVideo = { uri -> uploadVideoToS3(uri) },
                    isVideoCaptured = true // Cambiar a verdadero porque se ha grabado un video
                )
            }
        }
    }

    private fun uploadVideoToS3(uri: Uri?) {
        uri?.let { videoUri ->
            val filePath = getRealPathFromURI(videoUri)
            val file = File(filePath)

            // Crear credenciales directamente
            val accessKey = "" // Reemplaza con tu Access Key
            val secretKey = "" // Reemplaza con tu Secret Key

            val awsCredentials = BasicAWSCredentials(accessKey, secretKey)
            val s3Client = AmazonS3Client(awsCredentials)

            // Crear un metadato para el archivo
            val metadata = ObjectMetadata().apply {
                contentLength = file.length()
            }

            // Nombre del archivo en S3
            val s3Key = "videos/${file.name}"

            // Subir archivo
            Thread {
                try {
                    s3Client.putObject("", s3Key, FileInputStream(file), metadata)
                    runOnUiThread {
                        Toast.makeText(this, "Video subido con éxito!", Toast.LENGTH_SHORT).show()
                        // Abrir VideoActivity después de subir el video
                        val intent = Intent(this, VideoActivity::class.java)
                        startActivity(intent)
                    }
                } catch (e: Exception) {
                    runOnUiThread {
                        Toast.makeText(this, "Error al subir el video: ${e.message}", Toast.LENGTH_SHORT).show()
                    }
                }
                val intent = Intent(this, VideoActivity::class.java)
                startActivity(intent)
            }.start()
        }
    }



    private fun getRealPathFromURI(contentUri: Uri): String? {
        val cursor = contentResolver.query(contentUri, null, null, null, null)
        return if (cursor != null) {
            cursor.moveToFirst()
            val index = cursor.getColumnIndexOrThrow(MediaStore.Video.Media.DATA)
            val path = cursor.getString(index)
            cursor.close()
            path
        } else {
            null
        }
    }



    companion object {
        private const val REQUEST_VIDEO_CAPTURE = 1
    }
}
