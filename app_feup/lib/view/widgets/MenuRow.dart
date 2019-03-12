import 'package:app_feup/view/widgets/MenuSlot.dart';
import 'package:flutter/material.dart';

class MenuRow extends StatelessWidget {
  final double borderRadius = 15.0;

  MenuRow({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 100.0,
      ),
      child: new Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5, color: Color.fromARGB(64, 0x46, 0x46,0x46)),
            borderRadius: BorderRadius.all(Radius.circular(this.borderRadius))),
        width: (double.infinity),
        child: Column(
          children: <Widget>[
            MenuSlot(menu: "Esparguete à Bolonhesa", type: "Carne", drawUpperBorder: false,),
            MenuSlot(menu: "Filetes de peixe com arroz e batata frita", type: "Peixe",),
            MenuSlot(menu: "Pimentos recheados com lentilhas", type: "Vegetariano",),
            MenuSlot(menu: "Bife de frango grelhado com arroz", type: "Dieta",)
          ],
        ),
      ),
    );
  }
}
