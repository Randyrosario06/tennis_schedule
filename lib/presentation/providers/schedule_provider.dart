import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tennis_schedule/domain/entities/schedule.dart';
import 'package:tennis_schedule/presentation/screens/schedule_screen.dart';

import '../../helpers/boxes.dart';
part 'schedule_provider.g.dart';

@riverpod
class ScheduleHandler extends _$ScheduleHandler {
  @override
   List<Schedule>build() {
    return schedulesBox.get('schedules')?.cast<Schedule>() ?? [];
  }

  schedule(List<Schedule> schedule){
    schedulesBox.put('schedules',schedule);
    state = schedule;
  }
}

@riverpod
class UserScheduling extends _$UserScheduling {
  @override
   String build() {
    return '';
  }
  setUserToSchedule(String value){
    state = value;
  }
}

@riverpod
class MomentToScheduleSelected extends _$MomentToScheduleSelected {
  @override
   optionsToSchedule? build() {
    return null;
  }

  setMomentToSchedule(optionsToSchedule? value){
    state = value;
  }
}

@riverpod
class SlotsUsed extends _$SlotsUsed {
  @override
   List<String>build() {
    return [];
  }

  setSlotUsed(String value){
    state.add(value);
  }

  resetSlotUsed(){
    state.clear();
  }
}