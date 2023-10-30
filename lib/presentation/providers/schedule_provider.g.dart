// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scheduleHandlerHash() => r'e8fcc74c7d74a95d19e3705d05f451fb69e9fb09';

/// See also [ScheduleHandler].
@ProviderFor(ScheduleHandler)
final scheduleHandlerProvider =
    AutoDisposeNotifierProvider<ScheduleHandler, List<Schedule>>.internal(
  ScheduleHandler.new,
  name: r'scheduleHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScheduleHandler = AutoDisposeNotifier<List<Schedule>>;
String _$userSchedulingHash() => r'e699c404b51efbf1bd1c1ed2e072958c56fdd063';

/// See also [UserScheduling].
@ProviderFor(UserScheduling)
final userSchedulingProvider =
    AutoDisposeNotifierProvider<UserScheduling, String>.internal(
  UserScheduling.new,
  name: r'userSchedulingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userSchedulingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserScheduling = AutoDisposeNotifier<String>;
String _$momentToScheduleSelectedHash() =>
    r'8b04de48039ce9e172fe02bc5cdd4ee92f560d9e';

/// See also [MomentToScheduleSelected].
@ProviderFor(MomentToScheduleSelected)
final momentToScheduleSelectedProvider = AutoDisposeNotifierProvider<
    MomentToScheduleSelected, optionsToSchedule?>.internal(
  MomentToScheduleSelected.new,
  name: r'momentToScheduleSelectedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$momentToScheduleSelectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MomentToScheduleSelected = AutoDisposeNotifier<optionsToSchedule?>;
String _$slotsUsedHash() => r'cb793725d109d53f62543de6b296ba4e29e332fa';

/// See also [SlotsUsed].
@ProviderFor(SlotsUsed)
final slotsUsedProvider =
    AutoDisposeNotifierProvider<SlotsUsed, List<String>>.internal(
  SlotsUsed.new,
  name: r'slotsUsedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$slotsUsedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SlotsUsed = AutoDisposeNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
