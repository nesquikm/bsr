import 'dart:typed_data';

import 'package:bsr/features/library/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TomeReaderSection extends StatelessWidget {
  const TomeReaderSection({
    required this.section,
    required this.images,
    required this.ref,
    super.key,
  });

  final TomeContentSection section;
  final Map<String, List<int>> images;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Html(
          data: section.html,
          extensions: [
            MatcherExtension(
              matcher: (ExtensionContext context) {
                if (!['img'].contains(context.elementName)) {
                  return false;
                }
                final src = context.node.attributes['src'] ?? '';
                if (src.contains('base64,')) {
                  return false;
                }
                return true;
              },
              builder: (imageContext) {
                final src = imageContext.attributes['src'] ?? '';
                final url = src.replaceAll('../', '');
                final content = Uint8List.fromList(images[url]!);
                return Image(
                  image: MemoryImage(content),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
