import 'package:projectx/model/steps.model.dart';

class Project {
  final String title;
  final DateTime date;
  final String routine;
  final List<Step> steps;
  final int idUser;
  Project({
    required this.idUser,
    required this.title,
    required this.date,
    required this.routine,
    required this.steps,
  });
}
