import 'dart:collection';

import 'package:bsr/features/library/library.dart';
import 'package:bsr/features/library/view/view.dart';
import 'package:flutter/material.dart';

class AuthorTomesSliver extends StatelessWidget {
  const AuthorTomesSliver({
    required this.author,
    required this.tomes,
    super.key,
  });

  final String author;
  final LinkedHashMap<String, CachedTome> tomes;

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        SliverToBoxAdapter(
          child: AuthorListTile(
            author: author,
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) => SliverToBoxAdapter(
            child: TomeListTile(
              tome: tomes.values.elementAt(index),
            ),
          ),
          itemCount: tomes.length,
        ),
      ],
    );
  }
}
