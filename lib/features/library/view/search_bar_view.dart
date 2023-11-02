import 'package:flutter/material.dart';

class SearchBarView extends StatelessWidget {
  const SearchBarView({required this.hintText, super.key});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 16),
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            hintText: hintText,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16),
            ),
            controller: controller,
            onTap: () => controller.openView(),
            onChanged: (value) => controller.openView(),
            leading: const Icon(Icons.search),
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (index) {
            final item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () => controller.closeView(item),
            );
          });
        },
      ),
    );
  }
}
