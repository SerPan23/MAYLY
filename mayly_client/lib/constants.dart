import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kBgColor = Color.fromRGBO(253, 253, 254, 1);

const kShadowColor = Color.fromRGBO(73, 74, 77, 0.15);

const kTextAltColor = Color.fromRGBO(162, 163, 163, 1);

const kTransparentUiOverlay = SystemUiOverlayStyle(
  // Status bar color
  statusBarColor: Colors.transparent,
  // Status bar brightness (optional)
  // For Android (dark icons)
  statusBarIconBrightness: Brightness.dark,
  // For iOS (dark icons)
  statusBarBrightness: Brightness.light,
);

const kWhiteUiOverlay = SystemUiOverlayStyle(
  // Status bar color
  statusBarColor: Colors.white,
  // Status bar brightness (optional)
  // For Android (dark icons)
  statusBarIconBrightness: Brightness.dark,
  // For iOS (dark icons)
  statusBarBrightness: Brightness.light,
);
