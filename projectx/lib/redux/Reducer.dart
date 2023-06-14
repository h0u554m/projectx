import 'package:projectx/redux/store.dart';

import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is AddProjectAction) {
    return AppState(
      projects: List.from(state.projects)..add(action.project),
    );
  }

  return state;
}
