// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AppState {
  List<String>? l1;

  AppState(this.l1);

  AppState.fromAppState(AppState another) {
    l1 = another.l1;
  }
}
