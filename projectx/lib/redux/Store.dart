import 'package:projectx/model/project.model.dart';
import 'package:projectx/model/steps.model.dart';

class  AppState {
  final List<Project> projects;

  AppState({required this.projects});

  factory AppState.initialState() {
    return AppState(projects: [
      Project(
          idUser: 1,
          title: "My Project",
          date: DateTime.parse("2023-06-14T10:30:00Z"),
          routine: "Daily",
          steps: [
            Step(goal: "Step 1", status: true),
            Step(goal: "Step 2", status: false),
            Step(goal: "Step 3", status: false)
          ])
    ]);
  }
}
