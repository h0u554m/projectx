import 'package:flutter/material.dart';
import 'package:projectx/view/pages/main_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './redux/reducer.dart';
import './redux/store.dart';

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
      title: 'Projectx',
      home: MainPage(),
    );
  }
}
