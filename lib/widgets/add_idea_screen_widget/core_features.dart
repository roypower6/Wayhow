import 'package:flutter/material.dart';

class CoreFeaturesInput extends StatefulWidget {
  final List<String> features;
  final Function(List<String>) onFeaturesChanged;

  const CoreFeaturesInput({
    super.key,
    required this.features,
    required this.onFeaturesChanged,
  });

  @override
  CoreFeaturesInputState createState() => CoreFeaturesInputState();
}

class CoreFeaturesInputState extends State<CoreFeaturesInput> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = widget.features.isEmpty
        ? [TextEditingController()]
        : widget.features
            .map((feature) => TextEditingController(text: feature))
            .toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addNewFeature() {
    setState(() {
      _controllers.add(TextEditingController());
    });
    _updateFeatures();
  }

  void _removeFeature(int index) {
    setState(() {
      _controllers[index].dispose();
      _controllers.removeAt(index);
    });
    _updateFeatures();
  }

  void _updateFeatures() {
    widget.onFeaturesChanged(
      _controllers.map((controller) => controller.text).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._controllers.asMap().entries.map((entry) {
          int idx = entry.key;
          TextEditingController controller = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: '핵심 기능 ${idx + 1}',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (_) => _updateFeatures(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: _controllers.length > 1
                      ? () => _removeFeature(idx)
                      : null,
                  color: Theme.of(context).colorScheme.error,
                ),
              ],
            ),
          );
        }),
        TextButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('핵심 기능 추가'),
          onPressed: _addNewFeature,
        ),
      ],
    );
  }
}
