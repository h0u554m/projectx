import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:projectx/redux/store.dart';
import 'package:projectx/view/widgets/custom_circular_progress.dart';
import '../../../model/project.model.dart';

import 'package:google_fonts/google_fonts.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //serachbar
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF282828),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Search projects',
                        hintStyle: TextStyle(
                          color: Color(0xFF999999),
                        ),
                        border: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF282828),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //list of project  from redux state
      Expanded(
        flex: 5,
        child: SizedBox(
          child: StoreConnector<AppState, List<Project>>(
            converter: (store) => store.state.projects,
            builder: (context, List<Project> projects) {
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
                              title: Text(project.title,
                                  style: GoogleFonts.lexend(
                                    textStyle: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  )),
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
            },
          ),
        ),
      ),
    ]);
  }
}
