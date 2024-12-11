import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayhow/controllers/filter_controller.dart';
import 'package:wayhow/utils/idea_categories.dart';
import 'package:wayhow/utils/dev_icons_list.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({super.key});

  final FilterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '정렬 및 필터',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Obx(() => SwitchListTile(
                title: Text(
                  '즐겨찾기 우선 정렬',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: controller.showFavoritesFirst.value,
                onChanged: (_) => controller.toggleFavoritesFirst(),
              )),
          const SizedBox(height: 10),
          Text(
            '카테고리 필터',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() => Row(
                  children: [
                    FilterChip(
                      label: const Text('전체'),
                      selected: controller.selectedCategory.value.isEmpty,
                      onSelected: (_) => controller.setCategory(''),
                    ),
                    ...predefinedCategories.map((category) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: FilterChip(
                            label: Text(category),
                            selected:
                                controller.selectedCategory.value == category,
                            onSelected: (_) => controller.setCategory(category),
                          ),
                        )),
                  ],
                )),
          ),
          const SizedBox(height: 10),
          Text(
            '개발 언어 필터',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() => Row(
                  children: [
                    FilterChip(
                      label: const Text('전체'),
                      selected: controller.selectedIcon.value.isEmpty,
                      onSelected: (_) => controller.setIcon(''),
                    ),
                    ...DevIconsUtils.devIcons.map((icon) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: FilterChip(
                            label: Icon(
                              DevIconsUtils.getDevIconFromString(icon),
                              size: 18,
                            ),
                            selected: controller.selectedIcon.value == icon,
                            onSelected: (_) => controller.setIcon(icon),
                          ),
                        )),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
