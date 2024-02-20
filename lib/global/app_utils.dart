import 'dart:js';

import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_notif.dart';
import 'package:url_launcher/url_launcher.dart';

void urlLauncher({required BuildContext context,required String uri,required String message}) async {
  Uri url = Uri.parse(uri);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    AppNotif.showSnackBarCustom(context, message);
  }
}
