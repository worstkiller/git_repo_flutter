package com.androidbuffer.gitrepoflutter

import android.os.Bundle
import android.content.Intent
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel

class MainActivity() : FlutterActivity() {

    private val CHANNEL_SHARE = "git_repo_flutter/share_intent";

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        MethodChannel(flutterView, CHANNEL_SHARE).setMethodCallHandler { call, result ->
            when (call.method) {
                "shareIntent" -> {
                    shareIntent(call.argument("repo_url"))
                }
            }
        }
    }

    private fun shareIntent(data: String) {
        val sendIntent = Intent();
        sendIntent.setAction(Intent.ACTION_SEND);
        sendIntent.putExtra(Intent.EXTRA_TEXT, data);
        sendIntent.setType("text/plain");
        startActivity(sendIntent);
    }
}
