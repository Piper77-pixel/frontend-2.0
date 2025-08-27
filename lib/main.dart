
import 'package:brain_bucks/brain_buck.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

GetStorage? getStorage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.kTransparent, // Transparent status bar
      systemNavigationBarColor: AppColors.kBackGround, // Black navigation bar
    ),
  );
  await GetStorage.init();
  getStorage = GetStorage();
  runApp(const BrainBuckApp());
}
