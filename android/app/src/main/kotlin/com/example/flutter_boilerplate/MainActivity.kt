package com.example.flutter_boilerplate

import io.flutter.embedding.android.FlutterActivity
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;




class MainActivity: FlutterActivity() {
  companion object {
    @JvmStatic var methodChannel: MethodChannel? = null
    const val NOTIFICATION_ID = "Channel_ID"
  }
  private val channelName = "notification"
  var notificationManager: NotificationManagerCompat? = null

  protected override fun onCreate(@Nullable savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    notificationManager = NotificationManagerCompat.from(this)
  }

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName)

    methodChannel!!.setMethodCallHandler { call, result ->
      if (call.method == "create") {
        val builder: NotificationCompat.Builder = NotificationCompat.Builder(
                this, NOTIFICATION_ID)
                .setContentTitle("Title")
                .setContentText("Subtitle")
                .setSmallIcon(R.mipmap.ic_launcher)
                .setOngoing(false)
                .addAction(R.mipmap.ic_launcher, "Increase", getIntent(true))
                .addAction(R.mipmap.ic_launcher, "Decrease", getIntent(false))

        notificationManager!!.notify(0, builder.build())
        result.success(null)
      } else if (call.method == "destroy") {
        notificationManager!!.cancel(0)
        result.success(null)
      }
    }
  }

  private fun getIntent(isIncrease: Boolean): PendingIntent? {
    val intent = Intent(this, Notification::class.java)
    if (isIncrease) {
      intent.action = "increase"
    } else {
      intent.action = "decrease"
    }
    return PendingIntent.getBroadcast(this, 0, intent, 0)
  }
}
