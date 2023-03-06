package com.example.libshare

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform