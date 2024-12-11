import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayhow/controllers/ideas_controller.dart';
import 'package:wayhow/models/idea_model.dart';
import 'package:wayhow/widgets/add_idea_screen_widget/core_features.dart';
import 'package:wayhow/widgets/add_idea_screen_widget/dev_icon_picker.dart';
import 'package:wayhow/widgets/add_idea_screen_widget/idea_description.dart';
import 'package:wayhow/widgets/add_idea_screen_widget/section_title.dart';
import 'package:wayhow/widgets/add_idea_screen_widget/category_dropdown.dart';
import 'package:wayhow/utils/idea_categories.dart' as predefined_categories;

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
  List<String> selectedDevIcons = [];
  List<String> coreFeatures = [];

  final List<String> predefinedCategories =
      predefined_categories.predefinedCategories;

  @override
  void initState() {
    super.initState();
    textController =
        TextEditingController(text: widget.initialIdea?.title ?? '');
    descriptionController = TextEditingController(
      text: widget.initialIdea?.description ?? '',
    );
    selectedCategory = widget.initialIdea?.category ?? '';
    selectedDevIcons = widget.initialIdea?.icons ?? [];
    coreFeatures = widget.initialIdea?.coreFeatures ?? [];
  }

  void _saveIdea() {
    if (textController.text.isEmpty || selectedCategory.isEmpty) {
      _showValidationDialog();
      return;
    }
    final ideasController = Get.find<IdeasController>();

    final idea = IdeaModel(
      id: widget.initialIdea?.id ?? '',
      title: textController.text.trim(),
      description: descriptionController.text.trim(),
      category: selectedCategory,
      isFavorite: widget.initialIdea?.isFavorite ?? false,
      icons: selectedDevIcons,
      coreFeatures:
          coreFeatures.where((feature) => feature.trim().isNotEmpty).toList(),
    );

    if (widget.initialIdea == null) {
      ideasController.addIdea(idea);
    } else {
      ideasController.updateIdea(idea);
    }

    Get.back();
  }

  void _showValidationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('입력 오류'),
          content: const Text('아이디어 제목과 카테고리를 입력한 후 \n추가 버튼을 눌러주세요.'),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          widget.initialIdea == null ? '새 아이디어 추가' : '아이디어 수정',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: _saveIdea,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Text(
                widget.initialIdea == null ? '추가' : '수정',
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SectionTitle(title: '아이디어 제목 (필수)'),
              IdeaDescription(
                controller: textController,
                hintText: '핵심 기능이나 목적을 한 문장으로 요약해 주세요.',
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: '상세 설명'),
              IdeaDescription(
                controller: descriptionController,
                hintText: '아이디어의 구체적인 내용을 설명해 주세요.',
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: '핵심 기능'),
              CoreFeaturesInput(
                features: coreFeatures,
                onFeaturesChanged: (features) {
                  setState(() {
                    coreFeatures = features;
                  });
                },
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: '카테고리 (필수)'),
              CategoryDropdown(
                selectedCategory:
                    selectedCategory.isEmpty ? null : selectedCategory,
                predefinedCategories: predefinedCategories,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value ??
                        predefinedCategories
                            .first; // Handle null case and set default value
                  });
                },
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: '개발 언어'),
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
      ),
    );
  }
}
