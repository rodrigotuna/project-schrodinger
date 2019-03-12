import 'package:app_feup/view/Theme.dart';
import 'package:app_feup/view/widgets/MenuRow.dart';
import 'package:app_feup/view/widgets/MenuSlot.dart';
import 'package:app_feup/view/widgets/TitleCard.dart';
import 'package:flutter/material.dart';
import '../Pages/GeneralPageView.dart';

class MenuPageView extends GeneralPageView {

  @override
  Widget getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
          child: DropdownButton(
            isExpanded: true,
            value: 'Cafetaria - Restaurante FEUP',
            onChanged: (items) => null,
            items: <String>['Cantina', 'Grill', 'Cafetaria - Restaurante FEUP', 'Restaurante do INEGI/IDMEC']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ),

        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
              child: Text("Horário:",
                style: Theme.of(context).textTheme.body1.apply(color: greyTextColor, fontWeightDelta: 1), ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Text("12h00 as 14h45",
                style: Theme.of(context).textTheme.body1.apply(color: greyTextColor)),
            )
          ],
        )
        ,

        Container(
          child: TitleCard(day: '28', weekDay: 'Segunda-feira', month: 'Janeiro'),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        ),

        Container(
          child: MenuRow(),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        ),

        Container(
          child: TitleCard(day: '28', weekDay: 'Segunda-feira', month: 'Janeiro'),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        ),

        Container(
          child: MenuRow(),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        ),

        Container(
          child: TitleCard(day: '28', weekDay: 'Segunda-feira', month: 'Janeiro'),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        ),

        Container(
          child: MenuRow(),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        ),




      ],
    );
  }
}
