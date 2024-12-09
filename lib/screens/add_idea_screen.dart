import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayhow/controllers/ideas_controller.dart';
import 'package:wayhow/models/idea_model.dart';
import 'package:wayhow/widgets/dev_icon_picker.dart';

class AddIdeaScreen extends StatefulWidget {
  final IdeaModel? initialIdea;

  const AddIdeaScreen({super.key, this.initialIdea});

  @override
  AddIdeaScreenState createState() => AddIdeaScreenState();
}

class AddIdeaScreenState extends State<AddIdeaScreen> {
  late TextEditingController textController;
  late TextEditingController descriptionController;
  String selectedCategory = '';
  List<String> selectedDevIcons = []; // 여러 아이콘을 지원하도록 변경

  final List<String> predefinedCategories = [
    '모바일 앱',
    '웹',
    '백엔드',
    '프론트엔드',
    '알고리즘',
    '인공지능',
    '게임',
    '보안',
    '데이터분석',
    '임베디드',
    'API',
    '기타',
  ];

  @override
  void initState() {
    super.initState();
    textController =
        TextEditingController(text: widget.initialIdea?.title ?? '');
    descriptionController = TextEditingController(
      text: widget.initialIdea?.description ?? '',
    );
    selectedCategory = widget.initialIdea?.category ?? '';
    selectedDevIcons = widget.initialIdea?.icons ?? []; // 기존 아이콘 불러오기
  }

  void _saveIdea() {
    final ideasController = Get.find<IdeasController>();

    final idea = IdeaModel(
      id: widget.initialIdea?.id ?? '',
      title: textController.text.trim(),
      description: descriptionController.text.trim(),
      category: selectedCategory,
      createdAt: DateTime.now(),
      isFavorite: widget.initialIdea?.isFavorite ?? false,
      icons: selectedDevIcons, // 여러 아이콘 저장
    );

    if (widget.initialIdea == null) {
      ideasController.addIdea(idea);
    } else {
      ideasController.updateIdea(idea);
    }

    Get.back(); // Return to previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.initialIdea == null ? '새 아이디어 추가' : '아이디어 수정',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _saveIdea,
            child: Text(
              widget.initialIdea == null ? '추가' : '수정',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: '아이디어 제목',
                hintText: '아이디어를 간단히 설명해주세요',
                border: const OutlineInputBorder(),
                suffixIcon: textController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => textController.clear(),
                      )
                    : null,
              ),
              onChanged: (value) => setState(() {}),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: '상세 설명',
                hintText: '아이디어에 대한 자세한 내용을 적어주세요',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedCategory.isEmpty ? null : selectedCategory,
              decoration: const InputDecoration(
                labelText: '카테고리',
                border: OutlineInputBorder(),
              ),
              hint: const Text('카테고리를 선택해주세요'),
              items: predefinedCategories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            DevIconPicker(
              selectedDevIcons: selectedDevIcons,
              onIconsSelected: (icons) {
                setState(() {
                  selectedDevIcons = icons;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
