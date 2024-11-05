package com.example.healthphone_android.ConnectionToEndpoint

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

class CommunicationFromSNS {
    private val BASE_URL = "engrok/endpoint" //URL del endpoint a usar;

    val apiService: ApiService by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(ApiService::class.java)
    }
}