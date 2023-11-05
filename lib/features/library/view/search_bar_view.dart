import 'package:flutter/material.dart';

class SearchBarView extends StatefulWidget {
  const SearchBarView({
    required this.hintText,
    required this.controller,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();

    _isEmpty = widget.controller.text.isEmpty;
    widget.controller.addListener(() {
      setState(() {
        _isEmpty = widget.controller.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 16),
      child: SearchBar(
        hintText: widget.hintText,
        controller: widget.controller,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.only(left: 16),
        ),
        leading: const Icon(Icons.search),
        trailing: [
          if (!_isEmpty)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: widget.controller.clear,
            ),
        ],
      ),
    );
  }
}
