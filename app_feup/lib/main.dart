import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/utils/constants.dart';
import 'package:uni/view/Pages/homepage_view.dart';
import 'package:uni/view/Widgets/exam_view.dart';
import 'package:uni/view/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

enum WorkshopStage { singleExam, examList }

class MyAppState extends State<MyApp> {
  //TODO: Change this whenever you finish up the first widget
  WorkshopStage stage = WorkshopStage.singleExam;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return StoreProvider(
      child: MaterialApp(
          title: 'uni',
          theme: applicationTheme,
          // ignore: missing_return
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                    builder: (context) => stage == WorkshopStage.singleExam
                        ? ExamView(exams[0])
                        : HomePageView(exams),
                    settings: settings);
            }
          }),
      store: null,
    );
  }
}
