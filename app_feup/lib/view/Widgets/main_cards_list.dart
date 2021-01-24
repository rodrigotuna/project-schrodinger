import 'package:flutter/material.dart';
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
        height: MediaQuery.of(context).size.height, child: ListView(
            //Cards go here
            children: []));
  }
}
