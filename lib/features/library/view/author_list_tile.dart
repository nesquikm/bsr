import 'package:flutter/material.dart';

class AuthorListTile extends StatelessWidget {
  const AuthorListTile({required this.author, super.key});

  final String author;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        author,
        style: Theme.of(context).textTheme.headlineMedium,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
