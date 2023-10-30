import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'court_provider.g.dart';

@riverpod
class Court extends _$Court {
  @override
   String build() {
    return '';
  }

  setCourtToSchedule(String court){
    state = court;
  }
}