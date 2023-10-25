import 'package:freezed_annotation/freezed_annotation.dart';

part 'tome_info.freezed.dart';
part 'tome_info.g.dart';

@freezed
sealed class TomeInfo with _$TomeInfo {
  const factory TomeInfo({
    required String? author,
    required String? title,
    required List<String>? authors,
  }) = _TomeInfo;

  factory TomeInfo.fromJson(Map<String, dynamic> json) =>
      _$TomeInfoFromJson(json);
}
