// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import '../redux/listAction.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_practice/models/AppState.dart';

class ListItem extends StatefulWidget {
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  // final List<String> l1 = ["Cricket", "Baseball", "Hockey"];
  String? input;

  String? msg = "";

  handleAlreadyAdded() {
    setState(() {
      msg = "Already Added";
    });
  }

  handleAdd() {
    setState(() {
      msg = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        List<String>? l1 = state.l1;
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    input = value;
                  },
                ),
                Text(msg!),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      if (!l1!.contains(input)) {
                        print("ifff");
                        handleAdd();
                        l1?.add(input!);
                        StoreProvider.of<AppState>(context).dispatch(Add(l1));
                      } else {
                        handleAlreadyAdded();
                        print(state.l1);
                      }
                    },
                    child: Text("ADD ITEM")),
                SizedBox(height: 40),
                ...l1!.map((e) => Text(
                      e,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
