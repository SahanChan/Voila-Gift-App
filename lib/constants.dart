import 'package:flutter/material.dart';

//colors
const PrimaryColor = const Color(0xFFF9AA33);
const LightPrimaryColor = const Color(0xFFF0BE68);
const SecondaryColor = const Color(0xFFCF8223);
const BackgroundColor = const Color(0xFFF2F3F4);
const CardColor = const Color(0xFFffffff);
const ShadowColor = const Color(0xFFf2f2f2);
const ButtonColor = const Color(0xFF6B717E);

const inputDecoration = InputDecoration(
  fillColor: ShadowColor,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ShadowColor,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: PrimaryColor,
      width: 4.0,
    ),
  ),
);
