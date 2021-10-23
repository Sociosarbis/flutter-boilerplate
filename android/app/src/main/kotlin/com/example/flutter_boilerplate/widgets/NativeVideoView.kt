package com.example.flutter_boilerplate.widgets

import android.widget.VideoView
import android.net.Uri
import android.view.View
import android.content.Context
import android.media.MediaParser
import android.media.MediaPlayer
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.*;
import io.flutter.plugin.platform.PlatformView
import kotlinx.coroutines.*

enum class MediaStatus {
    PLAYING,
    PAUSED
}

internal class NativeVideoView(context: Context, messenger: BinaryMessenger, id: Int, creationParams: CreationParams) : PlatformView, MethodCallHandler  {
    private val videoView: VideoView = VideoView(context)
    private val methodChannelEventName = "${NativeVideoViewFactory.VIEW_TYPE}_$id"
    private val methodChannel: MethodChannel = MethodChannel(messenger, methodChannelEventName)
    private var onProgressJob: Job? = null
    private var mUrl: String = ""
    private var _progress = 0;
    private var _status = MediaStatus.PAUSED;
    private var _isLoading = true
    private var isLoading
        get() = _isLoading
        set(value: Boolean) {
            _isLoading = value
            methodChannel.invokeMethod(if (value) "loadStart" else "loadEnd", null)
        }
    private var _duration = 0;
    override fun getView(): View {
        return videoView
    }
    override fun dispose() {
        methodChannel.setMethodCallHandler(null)
        cancelProgressPoll()
    }
    override fun onFlutterViewAttached(flutterView: View) {
        videoView.setOnPreparedListener { _ ->
            cancelProgressPoll()
            onProgressJob = GlobalScope.launch(Dispatchers.Main) {
                pollProgress()
            }
        }
        videoView.setOnInfoListener { _, what, _ ->
            when (what) {
                MediaPlayer.MEDIA_INFO_VIDEO_RENDERING_START -> {
                    isLoading = false
                }
                MediaPlayer.MEDIA_INFO_BUFFERING_START -> {
                   isLoading = true
                }
                MediaPlayer.MEDIA_INFO_BUFFERING_END -> {
                    isLoading = false
                }
            }
            true
        }
    }

    override fun onFlutterViewDetached() {
    }

    private suspend fun pollProgress() {
        while (true) {
            val duration = videoView.duration
            val progress = videoView.currentPosition
            val status = if (videoView.isPlaying) MediaStatus.PLAYING else MediaStatus.PAUSED
            if (!(duration == _duration && progress == _progress && status == _status )) {
                _duration = duration
                _progress = progress
                _status = status
                methodChannel.invokeMethod("progress", hashMapOf(
                        "duration" to duration,
                        "progress" to progress,
                        "status" to status.ordinal
                ))
            }
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
            "seek" -> {
                if (call.arguments != null) {
                    if (onProgressJob != null) {
                        videoView.seekTo(call.arguments as Int? ?: 0);
                    }
                }
            }
        }
        result.success(null)
    };

    init {
        methodChannel.setMethodCallHandler(this)
    }
}