import 'package:projectx/model/steps.model.dart';

class Project {
  Project({
    required this.idUser,
    required this.title,
    required this.date,
    required this.routine,
    required this.steps,
  });

  final DateTime date;
  final int idUser;
  final String routine;
  final List<ProjectStep> steps;
  final String title;
}
