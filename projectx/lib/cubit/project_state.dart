part of 'project_cubit.dart';

@immutable
abstract class ProjectState {}

class ProjectInitial extends ProjectState {
  ProjectInitial({
    required this.projects,
  });

  final List<Project> projects;
}
