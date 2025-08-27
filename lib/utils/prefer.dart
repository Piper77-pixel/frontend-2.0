// ignore_for_file: avoid_print, constant_identifier_names

import 'package:flutter/material.dart';
import '../main.dart';

class Prefs {
  static const String USER_ID = 'userId';
  static const String accessToken = 'token';
  static const String ONBOARDING = 'onboarding';

  static setString(String key, String value) {
    return getStorage!.write(key, value);
  }

  static getString(String key) {
    return getStorage!.read(key) ?? '';
  }

  static setBool(String key, bool value) {
    return getStorage!.write(key, value);
  }

  static bool getBool(String key) {
    return getStorage!.read(key) ?? false;
  }

  static setInt(String key, int value) {
    return getStorage!.write(key, value);
  }

  static int getInt(String key) {
    return getStorage!.read(key) ?? 0;
  }

  static setUserID(String userID) {
    return getStorage!.write(USER_ID, userID);
  }

  static String getUserID() {
    return getStorage!.read(USER_ID) ?? '';
  }

  static setAccessToken(String token) {
    return getStorage!.write(accessToken, token);
  }

  static String getAccessToken() {
    return getStorage!.read(accessToken) ?? '';
  }

  static bool getONBOARDING() {
    return getStorage!.read(ONBOARDING) ?? false;
  }

  static setONBOARDING(bool onboarding) {
    return getStorage!.write(ONBOARDING, onboarding);
  }
  static remove(String key) {
    return getStorage!.remove(key);
  }

  static clear() {
    print('PREFS CLEARED');
    return getStorage!.erase();
  }
}
