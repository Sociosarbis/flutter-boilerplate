package com.example.flutter_boilerplate.widgets

import android.widget.VideoView
import android.net.Uri
import android.view.View
import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.*;
import io.flutter.plugin.platform.PlatformView
import kotlinx.coroutines.*


internal class NativeVideoView(context: Context, messenger: BinaryMessenger, id: Int, creationParams: CreationParams) : PlatformView, MethodCallHandler  {
    private val videoView: VideoView = VideoView(context)
    private val methodChannelEventName = "${NativeVideoViewFactory.VIEW_TYPE}_$id"
    private val methodChannel: MethodChannel = MethodChannel(messenger, methodChannelEventName)
    private var onProgressJob: Job? = null
    private var mUrl: String = ""
    override fun getView(): View {
        return videoView
    }
    override fun dispose() {
        methodChannel.setMethodCallHandler(null)
        cancelProgressPoll()
    }
    override fun onFlutterViewAttached(flutterView: View) {
        videoView.setOnPreparedListener{ _ ->
            cancelProgressPoll()
            onProgressJob = GlobalScope.launch(Dispatchers.Main) {
                pollProgress()
            }
        }
    }

    override fun onFlutterViewDetached() {
    }

    private suspend fun pollProgress() {
        while (true) {
            val duration = videoView.duration
            val progress = videoView.currentPosition
            methodChannel.invokeMethod("progress", hashMapOf(
                    "duration" to duration,
                    "progress" to progress
            ))
            if (progress >= duration) break
            delay(500)
        }
    }

    private fun cancelProgressPoll() {
        if (onProgressJob != null) {
            onProgressJob?.cancel()
            onProgressJob = null
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when(call.method) {
            "play" -> {
                videoView.start()
            }
            "setUrl" -> {
                val url = call.arguments as String? ?: "";
                if (url != mUrl) {
                    mUrl = url
                    videoView.setVideoURI(Uri.parse(url))
                }
            }
            "pause" -> {
                videoView.pause()
            }
        }
        result.success(null)
    };

    init {
        methodChannel.setMethodCallHandler(this)
    }
}