import 'package:projectx/model/project.model.dart';

class AppState {
  final List<Project> projects;

  AppState({required this.projects});

  factory AppState.initialState() {
    return AppState(projects: []);
  }
}
