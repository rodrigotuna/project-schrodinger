import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/account_page_title_settings.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:uni/view/Widgets/schedule_slot.dart';

class AccountPageView extends StatelessWidget {
  AccountPageView(
      {Key key,
      @required this.tabController,
      @required this.accountSections,
      this.scrollViewController});

  final List<String> accountSections;
  final TabController tabController;
  final ScrollController scrollViewController;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Color labelColor = Color.fromARGB(255, 0x50, 0x50, 0x50);

    return Column(children: <Widget>[
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          AccountPageTitleSettings(name: "Conta Corrente"),
          TabBar(
            controller: tabController,
            isScrollable: true,
            tabs: createTabs(queryData, context),
          ),
        ],
      ),
      Expanded(
          child: TabBarView(
        controller: tabController,
        children: createAccount(context),
      ))
    ]);
  }

  List<Widget> createTabs(queryData, BuildContext context) {
    final List<Widget> tabs = <Widget>[];
    for (var i = 0; i < accountSections.length; i++) {
      tabs.add(Container(
        color: Theme.of(context).backgroundColor,
        width: queryData.size.width / 2,
        child: Tab(key: Key('account-page-tab-$i'), text: accountSections[i]),
      ));
    }
    return tabs;
  }

  List<Widget> createAccount(context) {
    final List<Widget> tabBarViewContent = <Widget>[];
    tabBarViewContent.add(createMissingPayments(context));
    tabBarViewContent.add(createAccountStatement(context));
    return tabBarViewContent;
  }

  Widget createMissingPayments(context) {
    return Center(child: Text('Missing Payments.'));
  }

  Widget createAccountStatement(context) {
    return Center(child: Text('Account Statement.'));
  }
}
