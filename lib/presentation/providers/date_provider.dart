

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'date_provider.g.dart';

@riverpod
class SelectedDate extends _$SelectedDate {
  @override
   String build() {
    return '';
  }

  setSelectedDate(String date){
    state = date;
  }
}