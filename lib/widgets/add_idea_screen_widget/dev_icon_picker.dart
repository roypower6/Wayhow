import 'package:flutter/material.dart';
import 'package:wayhow/utils/dev_icons_list.dart';
import 'package:wayhow/utils/dev_icon_categories.dart';

class DevIconPicker extends StatefulWidget {
  final List<String> selectedDevIcons;
  final Function(List<String>) onIconsSelected;

  const DevIconPicker({
    super.key,
    required this.selectedDevIcons,
    required this.onIconsSelected,
  });

  @override
  DevIconPickerState createState() => DevIconPickerState();
}

class DevIconPickerState extends State<DevIconPicker> {
  late List<String> selectedDevIcons;
  String _selectedCategory = 'All'; // Default category

  final Map<String, List<String>> _iconCategories = devIconCategories;

  @override
  void initState() {
    super.initState();
    selectedDevIcons = List.from(widget.selectedDevIcons);
  }

  void _showDevIconPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          snap: true,
          initialChildSize: 0.6,
          minChildSize: 0.6,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  final categoryIcons = _iconCategories[_selectedCategory] ??
                      DevIconsUtils.devIcons;

                  return Column(
                    children: [
                      // Drag handle
                      Container(
                        width: 50,
                        height: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          '개발 아이콘 선택',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),

                      // Category selection row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: _iconCategories.keys.map((category) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: ChoiceChip(
                                  selectedColor: Theme.of(context).primaryColor,
                                  backgroundColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  label: Text(category),
                                  labelStyle: TextStyle(
                                    color: _selectedCategory == category
                                        ? Theme.of(context)
                                            .scaffoldBackgroundColor
                                        : Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  selected: _selectedCategory == category,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      _selectedCategory = category;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      // Icons Grid
                      Expanded(
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (scrollNotification) {
                            // 스크롤이 끝에 도달했을 때 상위 DraggableScrollableSheet의 드래그를 활성화
                            if (scrollNotification is ScrollEndNotification) {
                              return true;
                            }
                            // 스크롤 중일 때는 상위 드래그를 비활성화
                            return false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              controller: scrollController,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.85,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: categoryIcons.length,
                              itemBuilder: (context, index) {
                                final icon = categoryIcons[index];
                                final isSelected =
                                    selectedDevIcons.contains(icon);
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        selectedDevIcons.remove(icon);
                                      } else {
                                        selectedDevIcons.add(icon);
                                      }
                                      widget.onIconsSelected(selectedDevIcons);
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.1)
                                          : null,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: isSelected
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey.withOpacity(0.3),
                                        width: isSelected ? 2 : 1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          DevIconsUtils.getDevIconFromString(
                                              icon),
                                          size: 32,
                                          color: isSelected
                                              ? Theme.of(context).primaryColor
                                              : null,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          DevIconsUtils.getDevIconName(icon),
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: isSelected
                                                ? Theme.of(context).primaryColor
                                                : null,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      // Confirm Button
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            widget.onIconsSelected(selectedDevIcons);
                            Navigator.pop(context);
                          },
                          child: Text(
                            '선택 완료',
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.selectedDevIcons.isEmpty
                    ? '선택한 언어 없음'
                    : '선택된 언어(${widget.selectedDevIcons.length})',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            TextButton.icon(
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('개발 언어 선택'),
              onPressed: _showDevIconPicker,
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (widget.selectedDevIcons.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: widget.selectedDevIcons.map((icon) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          DevIconsUtils.getDevIconFromString(icon),
                          size: 40,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.selectedDevIcons.remove(icon);
                              widget.onIconsSelected(widget.selectedDevIcons);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .error
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '제거',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
      ],
    );
  }
}
