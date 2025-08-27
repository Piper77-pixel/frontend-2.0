import 'package:flutter/material.dart';

Widget assetImage(String image, {double? h, double? w, BoxFit? fit}) => Image.asset(image, height: h, width: w, fit: fit,);
