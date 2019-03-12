import 'package:app_feup/view/Theme.dart';
import 'package:flutter/material.dart';

class MenuSlot extends StatelessWidget {
  final String type;
  final String menu;
  final bool drawUpperBorder;
  final double borderRadius = 8.0;

  MenuSlot({
    Key key,
    @required this.type,
    @required this.menu,
    this.drawUpperBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 8, 0, 8),
          child: Text(type,
              style: Theme.of(context).textTheme.display2.apply(color: subtitleColor)),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Theme.of(context).accentColor, width: 1),
            top: (drawUpperBorder == false ? BorderSide(width: 1, color: Colors.transparent) : BorderSide(color: Theme.of(context).accentColor, width: 1)),
          )),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Text(menu,
              maxLines: 2,
              style: Theme.of(context).textTheme.subtitle.apply(fontSizeDelta: -5, color: subtitleColor)),
          alignment: Alignment.centerLeft,
          width: double.infinity,
        )
      ],
    );
  }
}
