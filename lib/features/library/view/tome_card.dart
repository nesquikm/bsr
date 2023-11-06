import 'dart:io';
import 'dart:ui';

import 'package:bsr/app/router/router.dart';
import 'package:bsr/features/library/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TomeCard extends StatelessWidget {
  const TomeCard({required this.tome, required this.ref, super.key});

  final CachedTome tome;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            File(tome.coverImagePath ?? ''),
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ref.goFurther(
                    AppRoute.reader,
                    pathParameters: {
                      routeParamTomeId: tome.id,
                    },
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRect(
              clipBehavior: Clip.antiAlias,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4,
                ),
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
                  child: TomeListTile(
                    tome: tome,
                    ref: ref,
                    withCover: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
