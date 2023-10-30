import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_schedule/domain/entities/schedule.dart';
import 'package:tennis_schedule/presentation/providers/providers.dart';
import 'package:tennis_schedule/presentation/screens/court_list_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedules = ref.watch(scheduleHandlerProvider);
    if(schedules.isNotEmpty){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0),
        child: Column(
        children: [
          const SizedBox(height: 80,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: schedules.length,
            itemBuilder: (contex, index){
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(12)
                ),
                width: MediaQuery.sizeOf(context).width *0.85,
                height: 170,
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                       const Spacer(),
                        GestureDetector(
                          onTap: ()=>_showMyDialog(context, schedules, index, ref),
                          child: const Icon(
                            Icons.delete,),
                        ),
                        const SizedBox(width: 10,)  
                      ],
                    ),
                    Text('Reservación en la cancha ${schedules[index].court}'),
                    const SizedBox(height: 10,),
                    Text('Fecha ${schedules[index].date}'),
                    const SizedBox(height: 10,),
                    Text('Reservada por ${schedules[index].user}'),
                    const SizedBox(height: 10,),
                    Text('Probabilidad de lluvia ${schedules[index].rainPct}'),
                  ],
                ),
              );
          }),
          const Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.85, 50),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
              onPressed: () {
                Navigator.pushNamed(context, CourtList.route);
              },
              child: const Text('REALIZAR OTRA RESERVACION', style: TextStyle(fontSize: 18),)),
          const SizedBox(
            height: 30,
          )
        ],
          ),
      );
    }
    return Column(
      children: [
        const Spacer(),
        const Center(
          child: Text('No tienes reservas por el momento'),
        ),
        const Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.sizeOf(context).width * 0.85, 50),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
            onPressed: () {
              Navigator.pushNamed(context, CourtList.route);
            },
            child: const Text('RESERVA YA!', style: TextStyle(fontSize: 18),)),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  Future<void> _showMyDialog(BuildContext context, List<Schedule> list, int index, WidgetRef ref) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: null,
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Seguro que quieres cancelar esta reservación?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('NO!', style: TextStyle(color: Colors.red),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Sí, quiero cancelarla'),
            onPressed: () {
              list.removeAt(index);
              ref.read(scheduleHandlerProvider.notifier).schedule(list);
             Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            },
          ),
        ],
      );
    },
  );
}

  // List<Widget> _getSchedules(){


  // }
}
