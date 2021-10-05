package com.example.flutter_boilerplate.widgets

import android.content.Context
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

typealias CreationParams = Map<String?, Any?>?

class NativeVideoViewFactory(_messenger: BinaryMessenger): PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private val messenger = _messenger
    companion object {
        const val VIEW_TYPE = "native_video"
    }
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as CreationParams
        return NativeVideoView(context, messenger, viewId, creationParams)
    }
}