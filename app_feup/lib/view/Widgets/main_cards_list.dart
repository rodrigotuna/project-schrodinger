import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Widgets/back_button_exit_wrapper.dart';

class MainCardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackButtonExitWrapper(
        context: context,
        child: createScrollableCardView(context),
      ),
    );
  }

  Widget createScrollableCardView(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: StoreConnector<AppState, List<dynamic>>(
          converter: (store) => store.state.content['exams'],
          builder: (context, exams) {
            return ListView(
              children: exams.map((exam) => Text(exam.subject)).toList(),
            );
          },
        ));
  }
}
