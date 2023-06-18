import 'package:flutter/material.dart';
import 'package:projectx/cubit/project_cubit.dart';
import 'package:projectx/view/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      title: 'Projectx',
      home: BlocProvider(
        create: (context) => ProjectCubit(),
        child: const MainPage(),
      ), // tabs page
    );
  }
}
