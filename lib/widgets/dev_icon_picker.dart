import 'package:flutter/material.dart';
import 'package:wayhow/utils/dev_icons_list.dart';

class DevIconPicker extends StatefulWidget {
  final List<String> selectedDevIcons;
  final Function(List<String>) onIconsSelected;

  const DevIconPicker(
      {super.key,
      required this.selectedDevIcons,
      required this.onIconsSelected});

  @override
  DevIconPickerState createState() => DevIconPickerState();
}

class DevIconPickerState extends State<DevIconPicker> {
  late List<String> selectedDevIcons;
  String _selectedCategory = 'All'; // Default category

  // Define icon categories
  final Map<String, List<String>> _iconCategories = {
    'All': DevIconsUtils.devIcons,
    'Languages': [
      'pythonPlain',
      'javascriptPlain',
      'typescriptPlain',
      'javaPlain',
      'csharpPlain',
      'cplusplusPlain',
      'cPlain',
      'kotlinPlain',
      'swiftPlain',
      'dartPlain',
      'goPlain',
      'rustPlain',
      'phpPlain',
      'rubyPlain',
      'perlPlain',
      'luaPlain',
      'rPlain',
      'scalaPlain',
      'objectivecPlain'
    ],
    'Web Frontend': [
      'reactOriginal',
      'angularjsPlain',
      'vuejsPlain',
      'html5Plain',
      'css3Plain',
      'sassOriginal',
      'bootstrapPlain'
    ],
    'Web Backend': [
      'nodejsPlain',
      'nestjsPlain',
      'nextjsOriginal',
      'expressOriginal',
      'djangoPlain',
      'laravelPlain',
      'springPlain',
      'flaskOriginal'
    ],
    'Mobile': [
      'flutterPlain',
      'kotlinPlain',
      'swiftPlain',
      'objectivecPlain',
      'dartPlain'
    ],
    'Databases': [
      'mysqlPlain',
      'postgresqlPlain',
      'mongodbPlain',
      'firebasePlain'
    ],
    'Other Technologies': [
      'electronOriginal',
      'figmaPlain',
      'matlabPlain',
      'xdPlain',
      'illustratorPlain',
      'photoshopPlain'
    ]
  };

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
          initialChildSize: 0.8,
          minChildSize: 0.8,
          maxChildSize: 0.8,
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
                  // Get the current category's icons
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
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GridView.builder(
                            controller: scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              childAspectRatio: 1,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount: categoryIcons.length,
                            itemBuilder: (context, index) {
                              final icon = categoryIcons[index];
                              final isSelected =
                                  selectedDevIcons.contains(icon);
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.1)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: isSelected
                                        ? Theme.of(context).primaryColor
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          selectedDevIcons.remove(icon);
                                        } else {
                                          selectedDevIcons.add(icon);
                                        }
                                      });
                                    },
                                    child: Center(
                                      child: Icon(
                                        DevIconsUtils.getDevIconFromString(
                                            icon),
                                        size: 50,
                                        color: isSelected
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.selectedDevIcons.map((icon) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      Icon(
                        DevIconsUtils.getDevIconFromString(icon),
                        size: 50,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            widget.selectedDevIcons.remove(icon);
                            widget.onIconsSelected(widget.selectedDevIcons);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
