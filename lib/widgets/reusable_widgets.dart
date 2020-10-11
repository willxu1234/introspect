import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableWidgets {
  static getAppBar() {
    return AppBar(
      // leading: Icon(Icons.menu),
      title: Text("Introspect", style: GoogleFonts.lora()),
    );
  }
}
