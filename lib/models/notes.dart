import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 0)
class Notes {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  Notes({
    @required this.title,
    @required this.description,
  });
}
