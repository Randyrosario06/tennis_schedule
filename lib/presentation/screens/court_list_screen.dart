import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_schedule/presentation/providers/providers.dart';
import 'package:tennis_schedule/presentation/screens/schedule_screen.dart';

class CourtList extends ConsumerWidget {
  const CourtList({super.key});

  static String route = '/courts';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courtSelected = ref.watch(courtProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120,),
              const Text(
                'Selecciona la cancha de tu preferencia',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              const SizedBox(height: 50,),
              Center(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: _courts(context,ref),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _courtItem(BuildContext context,String name, Color color,WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(courtProvider.notifier).setCourtToSchedule(name);
        Navigator.pushNamed(context ,CourtSchedule.route);
      },
      child: Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: color),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:10.0, top: 10),
                    child: Text(name, style: TextStyle(fontSize: 18, color: color),),
                  ),
                  const SizedBox(height: 50,),
                  Center(
                    child: Icon(Icons.sports_tennis, size: 94, color: color,),
                  ),
                  const Spacer(),
                ],
              ),
            ),
    );
  }

  List<Widget> _courts(BuildContext context,WidgetRef ref){
    List<Widget> list = [];
    final names = ['A', 'B', 'C'];
    for (var i = 0; i < names.length; i++) {
      list.add(_courtItem(context,names[i], _getColor(i),ref)); 
    }
    return list;
  }

  Color _getColor(int courtId){
    Color color;
    switch (courtId) {
      case 0:
        color = Colors.blueGrey;
        break;
      case 1:
        color = Colors.redAccent;
        break;  
      default:
      color = Colors.greenAccent;
        break;
    }
    return color;
  }
}