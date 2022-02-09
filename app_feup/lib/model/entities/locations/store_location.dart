import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../location.dart';

class StoreLocation implements Location{
  @override
  final int floor;

  @override
  final weight = 3;

  final String name;
  @override
  final icon = FontAwesomeIcons.store;

  StoreLocation(this.floor,this.name);

  @override
  String description(){
    return name;
  }

  @override
  Map<String, dynamic> toMap({int groupId = null}){
    return {
      'floor' : this.floor,
      'type' : locationTypeToString(LocationType.store),
      'name' : this.name
    };
  }
}