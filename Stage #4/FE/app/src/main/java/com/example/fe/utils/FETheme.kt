package com.example.fe.utils

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable

@Composable
fun FETheme(content: @Composable () -> Unit) {
    val colors = lightColorScheme(
        primary = androidx.compose.ui.graphics.Color(0xFF6200EE),
        secondary = androidx.compose.ui.graphics.Color(0xFF03DAC6)
    )

    MaterialTheme(
        colorScheme = colors,
        content = content
    )
}