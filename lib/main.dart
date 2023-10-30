import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tennis_schedule/domain/entities/schedule.dart';
import 'package:tennis_schedule/helpers/boxes.dart';
import 'package:tennis_schedule/presentation/screens/court_list_screen.dart';
import 'package:tennis_schedule/presentation/screens/home_screen.dart';
import 'package:tennis_schedule/presentation/screens/schedule_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ScheduleAdapter());
  schedulesBox = await Hive.openBox("schedules");
  runApp(const ProviderScope(child:MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        CourtList.route : (context) => const CourtList(),
        CourtSchedule.route : (context) => const CourtSchedule()
      },
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
