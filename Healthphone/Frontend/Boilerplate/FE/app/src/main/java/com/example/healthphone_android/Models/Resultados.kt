package com.example.healthphone_android.Models

data class Resultados(
    val response: ResponseData // Cambiamos para que contenga un objeto ResponseData
)

data class ResponseData(
    val result: String,
    val measures: Measures
)

data class Measures(
    val Temperatura: MeasureDetail,
    val Peso: MeasureDetail,
    val Altura: MeasureDetail
)

data class MeasureDetail(
    val cantidad: Double,
    val unidad: String
)
