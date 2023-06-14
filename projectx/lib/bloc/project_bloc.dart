import 'dart:async';

import 'package:projectx/model/project.model.dart';

import '../model/steps.model.dart';

// project state class
abstract class MyProjectState {}

// project event LoadingState class
class LoadingState extends MyProjectState {}

// project event DataLoadedState class
class DataLoadedState extends MyProjectState {
  final List<Project> projects;

  DataLoadedState(this.projects);
}

// project event ErrorState class
class ErrorState extends MyProjectState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

//Project Bloc
class ProjectBloc {
  final _stateStreamController = StreamController<MyProjectState>();
  Stream<MyProjectState> get stateStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<void>();
  Sink<void> get eventSink => _eventStreamController.sink;

  ProjectBloc() {
    _eventStreamController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(void _) async {
    try {
      _stateStreamController.sink
          .add(LoadingState()); // Notify the loading state

      // Simulate the data loading process with a delay of 1 second
      await Future.delayed(const Duration(seconds: 1));

      //random data
      final List<Project> projects = [
        Project(
          idUser: 1,
          title: 'Project 1',
          date: DateTime.now(),
          routine: 'Routine 1',
          steps: [
            Step(goal: 'Step 1', status: true),
            Step(goal: 'Step 2', status: false),
            Step(goal: 'Step 3', status: false),
          ],
        ),
        Project(
          idUser: 2,
          title: 'Project 2',
          date: DateTime.now(),
          routine: 'Routine 2',
          steps: [
            Step(goal: 'Step 1', status: true),
            Step(goal: 'Step 2', status: true),
            Step(goal: 'Step 3', status: true),
          ],
        ),
      ];

      _stateStreamController.sink
          .add(DataLoadedState(projects)); // Notify the data loaded state
    } catch (error) {
      // Notify the error state
    }
  }

  // Clean up the stream controllers
  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
