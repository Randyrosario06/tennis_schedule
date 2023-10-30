import 'package:hive/hive.dart';
part 'schedule.g.dart';

@HiveType(typeId: 0)
class Schedule extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String court;
  @HiveField(2)
  final String user;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String momentOfDay;
  @HiveField(5)
  final String rainPct;

  Schedule({
    required this.id,
    required this.court,
    required this.user,
    required this.date,
    required this.momentOfDay,
    required this.rainPct
  });

}