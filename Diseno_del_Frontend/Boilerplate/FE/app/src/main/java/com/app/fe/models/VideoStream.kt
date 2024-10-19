package com.app.fe.models

import java.util.UUID
import android.net.Uri

class VideoStream (
    private val id: String = UUID.randomUUID().toString(),
    private val video: Uri,
){
    //Funciones getters y setters
    fun getId(): String {
        return this.id
    }

    fun getVideo(): Uri {
        return this.video
    }
}