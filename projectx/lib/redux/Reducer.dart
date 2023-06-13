import 'package:projectx/model/project.model.dart';
import 'package:projectx/redux/Store.dart';

import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is AddProjectAction) {
    return AppState(
      projects: List.from(state.projects)..add(action.project as Project),
    );
  }

  return state;
}
