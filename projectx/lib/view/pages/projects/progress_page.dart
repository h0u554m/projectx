import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectx/view/widgets/custom_circular_progress.dart';
import 'package:projectx/view/widgets/search_bar.dart';
import 'package:projectx/view/widgets/spinner.dart';
import '../../../bloc/project_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  late ProjectBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProjectBloc();
    // ignore: void_checks
    _bloc.eventSink.add(null); // Start the data loading process
  }

  @override
  void dispose() {
    _bloc.dispose(); // Dispose the bloc
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        const SearchBarWidget(),
        // show the data that  pipe in to the stream or we show spinner
        Expanded(
          flex: 5,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<MyProjectState>(
              stream: _bloc.stateStream,
              builder: (context, snapshot) {
                final state = snapshot.data;

                if (state is LoadingState) {
                  return const Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Spinner(), // Replace with your loading indicator
                    ),
                  );
                } else if (state is DataLoadedState) {
                  final projects = state.projects;

                  return ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final project = projects[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: CustomCircularProgress(),
                              ),
                              Expanded(
                                flex: 1,
                                child: ListTile(
                                  title: Text(
                                    project.title,
                                    style: GoogleFonts.lexend(
                                      textStyle: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        height: 1.5,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Due: ${DateFormat('yyyy-MM-dd').format(project.date)}",
                                    style: GoogleFonts.lexend(
                                      textStyle: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                        height: 1.5,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF999999),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 48,
                                height: 48,
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ErrorState) {
                  return Text(state
                      .errorMessage); // Replace with your error handling UI
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ],
    );
  }
}
