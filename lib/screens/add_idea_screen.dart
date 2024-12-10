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
    '데스크탑 프로그램',
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
      icons: selectedDevIcons, // 여러 아이콘 저장
    );

    if (widget.initialIdea == null) {
      ideasController.addIdea(idea);
    } else {
      ideasController.updateIdea(idea);
    }

    Get.back(); // Return to previous screen
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
              _buildSectionTitle(context, '아이디어 제목 (필수)'),
              _buildAnimatedTextField(
                controller: textController,
                hintText: '핵심 기능이나 목적을 한 문장으로 요약해 주세요.',
                context: context,
              ),
              const SizedBox(height: 16),
              _buildSectionTitle(context, '상세 설명'),
              _buildAnimatedTextField(
                controller: descriptionController,
                hintText: '아이디어의 구체적인 내용을 설명해 주세요.',
                maxLines: 4,
                context: context,
              ),
              const SizedBox(height: 16),
              _buildSectionTitle(context, '카테고리 (필수)'),
              _buildCategoryDropdown(context),
              const SizedBox(height: 16),
              _buildSectionTitle(context, '개발 언어'),
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

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildAnimatedTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    required BuildContext context,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            labelStyle: TextStyle(
              color: controller.text.isNotEmpty
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: controller.text.isNotEmpty
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: controller.text.isNotEmpty
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
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => controller.clear(),
                  )
                : null,
          ),
          onChanged: (value) => setState(() {}),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }

  Widget _buildCategoryDropdown(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCategory.isEmpty ? null : selectedCategory,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: selectedCategory.isNotEmpty
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
      onChanged: (value) {
        setState(() {
          selectedCategory = value!;
        });
      },
    );
  }
}
