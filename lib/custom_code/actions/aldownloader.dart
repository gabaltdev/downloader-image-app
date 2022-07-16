// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:al_downloader/al_downloader.dart';

Future<String> aldownloader(String url) async {
  // Add your function code here!
  await ALDownloader.download(url,
      downloaderHandlerInterface:
          ALDownloaderHandlerInterface(progressHandler: (progress) {
        debugPrint(
            "ALDownloader | download progress = $progress, url = $url\n");
      }, succeededHandler: () {
        debugPrint("ALDownloader | download succeeded, url = $url\n");
      }, failedHandler: () {
        debugPrint("ALDownloader | download failed, url = $url\n");
      }, pausedHandler: () {
        debugPrint("ALDownloader | download paused, url = $url\n");
      }));
}
