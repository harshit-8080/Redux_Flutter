// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:redux_practice/models/AppState.dart';
import './widgets/list.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './redux/listReducer.dart';

void main() {
  final List<String> l1 = ["Cricket", "Baseball", "Hockey", "Patna"];
  final _initalState = AppState(l1);
  final Store<AppState> _store =
      new Store<AppState>(reducer, initialState: _initalState);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Redux App',
          theme: ThemeData(primarySwatch: Colors.green),
          home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux Application"),
      ),
      body: ListItem(),
    );
  }
}
