import 'package:flutter/material.dart';

class AuthorListTile extends StatelessWidget {
  const AuthorListTile({required this.author, super.key});

  final String author;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(author),
    );
  }
}
