import 'package:flutter/material.dart';

final String producttable = 'producttable';
final String columnname = 'name';
final String columnimage = 'image';
final String columnprix = 'prix';
final String columnqte = 'qte';

const CACHED_USER_DATA = 'user';
const CACHED_CMD_DATA = 'commande';

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  payement,
  Commande,
}

enum Delivry {
  StandrdDelivry,
  NextDay,
  Delivrychoosing,
}
