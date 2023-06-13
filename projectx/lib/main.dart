import 'package:flutter/material.dart';
import 'package:projectx/redux/Reducer.dart';
import 'package:projectx/redux/Store.dart';
import 'package:projectx/view/pages/HomPage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
  );

  runApp(
    StoreProvider<AppState>(
      store: store,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Redux App',
      home: HomePage(),
    );
  }
}
