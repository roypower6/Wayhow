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

  @override
  void initState() {
    super.initState();
    selectedDevIcons = List.from(widget.selectedDevIcons);
  }

  void _showDevIconPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: DevIconsUtils.devIcons.length,
                    itemBuilder: (context, index) {
                      final icon = DevIconsUtils.devIcons[index];
                      final isSelected = selectedDevIcons.contains(icon);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedDevIcons.remove(icon);
                            } else {
                              selectedDevIcons.add(icon);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          child: Icon(
                            DevIconsUtils.getDevIconFromString(icon),
                            size: 50,
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onIconsSelected(selectedDevIcons);
                      Navigator.pop(context);
                    },
                    child: const Text('완료'),
                  ),
                ),
              ],
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
                    ? '개발 언어 선택'
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
