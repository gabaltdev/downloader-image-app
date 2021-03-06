// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:image_downloader_web/image_downloader_web.dart';

final WebImageDownloader _webImageDownloader = WebImageDownloader();

Future imagedownloaderweb(String url) async {
  // Add your function code here!
  await _webImageDownloader.downloadImageFromWeb(url);
}
