package com.example.libshare

class Greeting {
    private val platform: Platform = getPlatform()

    fun greet(): String {
        return "Helllo, ${platform.name}!"
    }
}