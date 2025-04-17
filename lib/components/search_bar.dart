import 'package:flutter/material.dart';

class BarraDePesquisa extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final String? hintText;

  BarraDePesquisa({
    Key? key,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: onChanged,
      onSubmitted: (value) {
        if (onSubmitted != null) {
          onSubmitted!();
        }
      },
      decoration: InputDecoration(
        hintText: hintText ?? 'Pesquisar...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}