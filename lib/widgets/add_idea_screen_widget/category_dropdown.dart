import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  final String? selectedCategory;
  final List<String> predefinedCategories;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.predefinedCategories,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: selectedCategory != null
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
      hint: Text(
        '카테고리를 선택해주세요',
        style: TextStyle(color: Colors.grey.shade600),
      ),
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        color: Theme.of(context).primaryColor,
      ),
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      items: predefinedCategories.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(
            category,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
