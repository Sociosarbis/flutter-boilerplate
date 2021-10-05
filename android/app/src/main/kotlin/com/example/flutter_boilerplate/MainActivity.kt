package com.example.flutter_boilerplate

import android.app.NotificationChannel
import android.app.NotificationManager
import io.flutter.embedding.android.FlutterActivity
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Build
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;
import com.example.flutter_boilerplate.widgets.NativeVideoViewFactory
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;




class MainActivity: FlutterActivity() {
  companion object {
    @JvmStatic var methodChannel: MethodChannel? = null
    const val NOTIFICATION_ID = "CLIENT_ID"
    const val NOTIFICATION_NAME = "COUNTER_OP"
  }
  private val channelName = "notification"
  var notificationManager: NotificationManagerCompat? = null

  protected override fun onCreate(@Nullable savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    notificationManager = NotificationManagerCompat.from(this)
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      createChannel()
    }
  }

  @RequiresApi(Build.VERSION_CODES.O)
  private fun createChannel() {
    notificationManager?.createNotificationChannel(NotificationChannel(NOTIFICATION_ID, NOTIFICATION_NAME, NotificationManager.IMPORTANCE_DEFAULT))
  }

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName)
    methodChannel!!.setMethodCallHandler { call, result ->
      when(call.method) {
        "create" -> {
          val builder: NotificationCompat.Builder = NotificationCompat.Builder(
                  this, NOTIFICATION_ID)
                  .setContentTitle("计数器")
                  .setContentText("加减")
                  .setSmallIcon(R.mipmap.ic_launcher)
                  .setOngoing(false)
                  .addAction(R.mipmap.ic_launcher, "Increase", getIntent(true))
                  .addAction(R.mipmap.ic_launcher, "Decrease", getIntent(false))

          notificationManager!!.notify(0, builder.build())
          result.success(null)
        }
        "destroy" -> {
          notificationManager!!.cancel(0)
          result.success(null)
        }
      }
    }

    flutterEngine.platformViewsController.registry.registerViewFactory(NativeVideoViewFactory.VIEW_TYPE, NativeVideoViewFactory(flutterEngine.dartExecutor.binaryMessenger))
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
