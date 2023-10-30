import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_schedule/domain/entities/schedule.dart';
import 'package:tennis_schedule/presentation/providers/providers.dart';

enum optionsToSchedule { morning, afternoon, night }
class CourtSchedule extends ConsumerWidget {
  const CourtSchedule({super.key});

  static String route = '/schedule';
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final courtSelected = ref.watch(courtProvider);
    final momentSelected = ref.watch(momentToScheduleSelectedProvider);
    final user = ref.watch(userSchedulingProvider);
    final schedules = ref.watch(scheduleHandlerProvider);
    final slotUsed  =ref.watch(slotsUsedProvider);
    optionsToSchedule? _moment = momentSelected;
    TextEditingController nameInputController = TextEditingController();
    TextEditingController dateInputController = TextEditingController();
    dateInputController.text = selectedDate;
    nameInputController.text = user;
    int slotsAvailables = 3;
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                const SizedBox(height: 120,),
                Text('Por favor dinos tu nombre y selecciona la fecha para consultar disponibilidad para la cancha $courtSelected',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const SizedBox(height: 20,),
                TextField(
                  controller: nameInputController,
                  decoration: const InputDecoration(
                    hintText: 'Nombre...',
                    suffixIcon: Icon(Icons.person)
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: dateInputController,
                  onTap: () async {
                    final initial = DateTime.now();
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(initial.year,initial.month, initial.day + 1),
                        firstDate: DateTime(initial.year,initial.month, initial.day + 1),
                        lastDate: DateTime(2100));
                        ref.read(userSchedulingProvider.notifier).setUserToSchedule(nameInputController.text);
                      nameInputController.text = user;
                    if(pickedDate != null){
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      ref.read(selectedDateProvider.notifier).setSelectedDate(formattedDate);
                      if(schedules.isNotEmpty){
                          ref.read(slotsUsedProvider.notifier).resetSlotUsed();
                          for (var i = 0; i < schedules.length; i++) {
                            if(schedules[i].id.contains(courtSelected) && 
                            schedules[i].id.contains(formattedDate)){
                              slotsAvailables--;
                             ref.read(slotsUsedProvider.notifier).setSlotUsed(schedules[i].id.split('|')[2]);
                              print(schedules[i].id);
                            }
                        }
                      }
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'dd-mm-yyyy',
                    suffixIcon: Icon(Icons.calendar_month)
                  ),
                ),
                const SizedBox(height: 20,),
              if (dateInputController.text.isNotEmpty && slotsAvailables  == 0)
              Text(
                    'No hay disponibilidad para la cancha $courtSelected en la fecha seleccionada'),
              if (dateInputController.text.isNotEmpty && slotsAvailables  > 0)
              Column(
                children: <Widget>[
                
                  Text(
                    'Disponibilidad para la cancha $courtSelected en la fecha seleccionada'),
                    if(!slotUsed.contains('optionsToSchedule.morning'))
                  RadioListTile<optionsToSchedule>(
                    title: const Text('Horario matutino'),
                    value: optionsToSchedule.morning,
                    groupValue: _moment,
                    onChanged: (optionsToSchedule? value) {
                      ref.read(momentToScheduleSelectedProvider.notifier).setMomentToSchedule(value);
                    },
                  ),
                  if(!slotUsed.contains('optionsToSchedule.afternoon'))
                  RadioListTile<optionsToSchedule>(
                    title: const Text('Horario vespertino'),
                    value: optionsToSchedule.afternoon,
                    groupValue: _moment,
                    onChanged: (optionsToSchedule? value) {
                      ref.read(momentToScheduleSelectedProvider.notifier).setMomentToSchedule(value);
                    },
                  ),
                  if(!slotUsed.contains('optionsToSchedule.night'))
                  RadioListTile<optionsToSchedule>(
                    title: const Text('Horario nocturno'),
                    value: optionsToSchedule.night,
                    groupValue: _moment,
                    onChanged: (optionsToSchedule? value) {
                      ref.read(momentToScheduleSelectedProvider.notifier).setMomentToSchedule(value);
                    },
                  ),
                ],
              ),
              const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _moment == null || nameInputController.text.isEmpty ? Colors.grey : null,
                    minimumSize: Size(MediaQuery.sizeOf(context).width * 0.85, 50),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                onPressed: () {
                  if(_moment != null){
                    final schedule = Schedule(
                      id: '$courtSelected|' '${dateInputController.text}|' '${_moment.toString()}',
                      court: courtSelected,
                      user: nameInputController.text,
                      date: dateInputController.text,
                      momentOfDay: _moment.toString(),
                      rainPct: '0%');
                      List<Schedule> newSchedule = [];
                      if(schedules.isEmpty){
                        newSchedule.add(schedule);
                        ref.read(scheduleHandlerProvider.notifier).schedule(newSchedule);
                      }else{
                        schedules.add(schedule);
                        ref.read(scheduleHandlerProvider.notifier).schedule(schedules);
                      }
                      
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
                child: const Text('RESERVAR', style: TextStyle(fontSize: 18),)),
            const SizedBox(
              height: 30,
            )
            ]),
          ),
        ),
      ),
    );
  }
}