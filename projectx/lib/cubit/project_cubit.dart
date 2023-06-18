import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../model/project.model.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectInitial> {
  ProjectCubit() : super(ProjectInitial(projects: const []));

  void getProject(List<Project> projects) {
    // Emit a new state with the updated project list
    emit(ProjectInitial(projects: projects));
  }
}
