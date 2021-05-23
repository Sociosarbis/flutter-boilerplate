package com.example.flutter_boilerplate

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class Notification : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action ?: return
        when (action) {
            "increase" -> MainActivity.methodChannel?.invokeMethod("increase", "")
            "decrease" -> MainActivity.methodChannel?.invokeMethod("decrease", "")
        }
    }
}