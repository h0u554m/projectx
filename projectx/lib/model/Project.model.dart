import 'package:projectx/model/steps.model.dart';

class Project {
  final String title;
  final DateTime date;
  final String routine;
  final List<Step> steps;
  final int id_user;
  Project(
    this.id_user, {
    required this.title,
    required this.date,
    required this.routine,
    required this.steps,
  });
}
