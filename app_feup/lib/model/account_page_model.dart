import 'package:tuple/tuple.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/account_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends SecondaryPageViewState
    with SingleTickerProviderStateMixin {

  TabController tabController;
  ScrollController scrollViewController;

  final List<String> accountSections = [
    'Despesas não Saldadas',
    'Extrato geral'
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: accountSections.length);
    tabController.animateTo((tabController.index));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // TODO change according to account instead of schedule
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, Tuple2<List<Lecture>, RequestStatus>>(
      converter: (store) => Tuple2(store.state.content['schedule'],
          store.state.content['scheduleStatus']),
      builder: (context, lectureData) {
        return AccountPageView(
            tabController: tabController,
            scrollViewController: scrollViewController,
            accountSections: accountSections);
      },
    );
  }
}
