import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayhow/controllers/filter_controller.dart';
import 'package:wayhow/controllers/ideas_controller.dart';
import 'package:wayhow/utils/idea_categories.dart';
import 'package:wayhow/utils/dev_icons_list.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _slideAnimation.value * 100),
        child: Opacity(
          opacity: 1 - _slideAnimation.value,
          child: child,
        ),
      ),
      child: Container(
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
                  value: Get.find<FilterController>().showFavoritesFirst.value,
                  onChanged: (_) => Get.find<FilterController>().toggleFavoritesFirst(),
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
              child: Obx(() {
                // 현재 아이디어 카드에 있는 카테고리만 필터링
                final ideasController = Get.find<IdeasController>();
                final existingCategories = ideasController.ideas
                    .map((idea) => idea.category)
                    .toSet()
                    .toList();

                return Row(
                  children: [
                    FilterChip(
                      label: const Text('전체'),
                      selected: Get.find<FilterController>().selectedCategory.value.isEmpty,
                      onSelected: (_) => Get.find<FilterController>().setCategory(''),
                    ),
                    ...predefinedCategories
                        .where(
                            (category) => existingCategories.contains(category))
                        .map((category) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: FilterChip(
                                label: Text(category),
                                selected:
                                    Get.find<FilterController>().selectedCategory.value == category,
                                onSelected: (_) =>
                                    Get.find<FilterController>().setCategory(category),
                              ),
                            )),
                  ],
                );
              }),
            ),
            const SizedBox(height: 10),
            Text(
              '개발 언어 필터',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                // 현재 아이디어 카드에 있는 개발 언어만 필터링
                final ideasController = Get.find<IdeasController>();
                final existingIcons = ideasController.ideas
                    .expand((idea) => idea.icons)
                    .toSet()
                    .toList();

                return Row(
                  children: [
                    FilterChip(
                      label: const Text('전체'),
                      selected: Get.find<FilterController>().selectedIcon.value.isEmpty,
                      onSelected: (_) => Get.find<FilterController>().setIcon(''),
                    ),
                    ...DevIconsUtils.devIcons
                        .where((icon) => existingIcons.contains(icon))
                        .map((icon) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: FilterChip(
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      DevIconsUtils.getDevIconFromString(icon),
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      DevIconsUtils.getDevIconName(icon),
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                selected: Get.find<FilterController>().selectedIcon.value == icon,
                                onSelected: (_) => Get.find<FilterController>().setIcon(icon),
                              ),
                            )),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
