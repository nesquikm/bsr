import 'package:bsr/app/router/router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'router_persistence_state.freezed.dart';
part 'router_persistence_state.g.dart';

@freezed
sealed class RouterPersistenceState with _$RouterPersistenceState {
  const factory RouterPersistenceState({
    required String fullPath,
  }) = _RouterPersistenceState;

  factory RouterPersistenceState.intial() => RouterPersistenceState(
        fullPath: AppRoute.defaultRoute.path,
      );

  factory RouterPersistenceState.fromJson(Map<String, dynamic> json) =>
      _$RouterPersistenceStateFromJson(json);
}
