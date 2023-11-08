import 'package:freezed_annotation/freezed_annotation.dart';

part 'tome_content.freezed.dart';

@freezed
sealed class TomeContentSection with _$TomeContentSection {
  const factory TomeContentSection({
    required String html,
  }) = _TomeContentSection;
}

@freezed
sealed class TomeContent with _$TomeContent {
  const factory TomeContent({
    required List<TomeContentSection> sections,
    required Map<String, List<int>> images,
  }) = _TomeContent;
}
