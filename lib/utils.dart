import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> openUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    launchUrlString(url);
  }
}

void openLikeUrl() {
  openUrl("https://play.google.com/store/apps/details?id=de.seniorlaguna.currency_calculator");
}

void openProVersionUrl() {
  openUrl("https://play.google.com/store/apps/details?id=de.seniorlaguna.currency_calculator_pro");
}

void openTermsOfUse(BuildContext context) {
  openUrl(FlutterI18n.translate(context, "termsUrl"));
}

void openPrivacyPolicy(BuildContext context) {
  openUrl(FlutterI18n.translate(context, "privacyUrl"));
}

void openContactInformation(BuildContext context) {
  openUrl(FlutterI18n.translate(context, "contactUrl"));
}