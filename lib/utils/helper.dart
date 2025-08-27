import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

void copyLinkToClipboard(String link) {
  Clipboard.setData(ClipboardData(text: link));
}

void shareLink(String url) {
  SharePlus.instance.share(ShareParams(text: url));
}
String getLanguageCode(String language) {
  switch (language) {
    case 'English (US)':
      return 'EN';
    case 'French':
      return 'FR';
    case 'Chinese':
      return 'CH';
    case 'English (UK)':
      return 'EN'; // or 'GB' depending on your naming
    default:
      return 'EN';
  }
}
