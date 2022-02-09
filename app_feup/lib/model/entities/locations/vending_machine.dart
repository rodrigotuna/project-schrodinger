import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../location.dart';

class VendingMachine implements Location{
  @override
  final int floor;

  @override
  final weight = 2;

  @override
  final icon = FontAwesomeIcons.cookie;

  VendingMachine(this.floor);

  @override
  String description(){
    return 'Máquina de venda';
  }

  @override
  Map<String, dynamic> toMap({int groupId = null}){
    return {
      'floor' : this.floor,
      'type' : locationTypeToString(LocationType.vendingMachine)
    };
  }
}