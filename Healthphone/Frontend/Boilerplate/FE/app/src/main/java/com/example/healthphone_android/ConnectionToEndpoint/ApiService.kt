package com.example.healthphone_android.ConnectionToEndpoint

import com.example.healthphone_android.Models.Resultados
import retrofit2.Response;
import retrofit2.http.GET;
import retrofit2.http.POST
import retrofit2.http.Query;

interface ApiService {
    @POST("categorize-patient/")
    suspend fun categorizePatient(): Response<Resultados>
}