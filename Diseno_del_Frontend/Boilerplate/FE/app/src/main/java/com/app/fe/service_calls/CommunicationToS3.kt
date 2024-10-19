package com.app.fe.service_calls

//Librerías de Amazon
import android.net.Uri
import java.io.File
import com.amazonaws.mobileconnectors.s3.transferutility.TransferObserver
import com.amazonaws.mobileconnectors.s3.transferutility.TransferUtility
import com.amazonaws.services.s3.AmazonS3Client

import com.app.fe.models.VideoStream

class CommunicationToS3 (
    private val s3Client: AmazonS3Client,
    private val transferUtility: TransferUtility
){
    //Función encargada de comunicarse con el cliente de Amazon y enviar el video
    fun uploadToS3(videoStream: VideoStream): TransferObserver {
        val videoUri: Uri = videoStream.getVideo();
        val videoId: String = videoStream.getId();

        //Con un context y path hardcodeado, nos comunicamos al s3
        val videoFile = File(videoUri.path!!);
        val bucketName = "health-code-bucket";
        val objectKey = "videos/$videoId.mp4"

        //Usamos transfer para la comunicación con el archivo a S3
        return transferUtility.upload(
            bucketName,
            objectKey,
            videoFile
        )
    }
}