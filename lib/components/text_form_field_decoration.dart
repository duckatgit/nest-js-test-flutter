import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration textFormFieldInputDecoration({
  required BuildContext context,
}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 0.6,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 0.6,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 0.6,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 0.6,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 0.6,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    contentPadding: const EdgeInsets.only(
      bottom: 0.0,
      left: 10.0,
      right: 10.0,
    ),
    errorStyle: GoogleFonts.poppins(
      color: Colors.red,
    ),
    hintStyle: GoogleFonts.poppins(
      color: const Color(0xff7e7d7d),
      fontWeight: FontWeight.normal,
    ),
    labelStyle: GoogleFonts.poppins(
      color: const Color(0xff7e7d7d),
    ),
  );
}
