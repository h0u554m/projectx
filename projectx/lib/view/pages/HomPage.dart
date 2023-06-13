import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:projectx/redux/Store.dart';
import 'package:projectx/model/project.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project'),
      ),
      body: StoreConnector<AppState, List<Project>>(
        converter: (store) => store.state.projects,
        builder: (context, projects) {
          print(projects);
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              // Build the list item UI for each project
              return ListTile(
                title: Text(projects[index].title),
                subtitle: Text(projects[index].date.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
