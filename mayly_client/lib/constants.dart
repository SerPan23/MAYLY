import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kBgColor = Color.fromRGBO(250, 250, 250, 1);

const kShadowColor = Color.fromRGBO(73, 74, 77, 0.15);

// const kTextAltColor = Color.fromRGBO(162, 163, 163, 1);
const kTextAltColor = Color.fromRGBO(189, 189, 189, 1);

// const kBrandColor = Color.fromRGBO(23, 109, 234, 1);
const kBrandColor = Color.fromRGBO(78, 7, 168, 1);

const kPurpleColor = Color.fromRGBO(122, 125, 245, 1);

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

const kBrandColorUiOverlay = SystemUiOverlayStyle(
  // Status bar color
  statusBarColor: kBrandColor,
  // Status bar brightness (optional)
  // For Android (dark icons)
  statusBarIconBrightness: Brightness.light,
  // For iOS (dark icons)
  statusBarBrightness: Brightness.dark,
);
