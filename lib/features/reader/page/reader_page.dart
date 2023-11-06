import 'package:bsr/features/common/common.dart';
import 'package:bsr/features/library/library.dart';
import 'package:bsr/features/reader/reader.dart';
import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReaderPage extends ConsumerStatefulWidget {
  const ReaderPage({required this.tomeId, super.key});

  final String tomeId;

  @override
  ConsumerState<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends ConsumerState<ReaderPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final tomeResult = ref.watch(
      tomeLibraryTomeProvider(
        widget.tomeId,
      ),
    );

    final contentResult = ref.watch(
      tomeLibraryTomeContentProvider(
        widget.tomeId,
      ),
    );

    final data = contentResult.when(
      data: (TomeContent data) {
        return TomeReaderSectionSliver(
          content: data,
          ref: ref,
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return FullscreenErrorMessageSliver(
          text: l10n.errorLoadingLibraryMessage(error.toString()),
        );
      },
      loading: () {
        return const FullscreenProgressIndicatorSliver();
      },
    );

    final title = tomeResult.valueOrNull?.tomeInfo.title ?? '';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(title),
          ),
          data,
        ],
      ),
    );
  }
}
