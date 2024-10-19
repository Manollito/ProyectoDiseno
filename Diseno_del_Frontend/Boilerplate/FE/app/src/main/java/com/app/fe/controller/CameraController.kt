package com.app.fe.controller

import android.content.Context
import android.net.Uri

import com.app.fe.models.VideoStream
import com.app.fe.service_calls.CommunicationToS3

class CameraController (
    private val context: Context,
    private val communicationToS3: CommunicationToS3
){

    //Función para crear el videostream
    fun createVideoStream(videoUri: Uri): VideoStream {
        return VideoStream(video = videoUri);
    }

    //Función para subir el vídeo
    fun uploadVideo(videoStream: VideoStream){
        communicationToS3.uploadToS3(videoStream);
    }
}