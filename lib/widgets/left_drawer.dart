import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayhow/controllers/theme_controller.dart';
import 'package:wayhow/models/idea_model.dart';
import 'package:wayhow/screens/app_info_screen.dart';

class LeftDrawerWidget extends StatelessWidget {
  final List<IdeaModel> _ideas;
  final BuildContext context;

  const LeftDrawerWidget({
    super.key,
    required List<IdeaModel> ideas,
    required this.context,
  }) : _ideas = ideas;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final int totalIdeas = _ideas.length;
    final int favoriteIdeas = _ideas.where((idea) => idea.isFavorite).length;

    void navigateTo(BuildContext context, Widget screen) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Wayhow',
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '개발자 아이디어 노트',
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'v1.0.5',
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_outline),
            title: const Text('총 아이디어'),
            trailing: Text(
              '$totalIdeas',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star_border),
            title: const Text('즐겨찾기 아이디어'),
            trailing: Text(
              '$favoriteIdeas',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.brightness_4),
            title: const Text('다크 모드'),
            trailing: Obx(() => Switch(
                  value: themeController.isDarkMode,
                  onChanged: (_) => themeController.toggleTheme(),
                )),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('앱 정보'),
            onTap: () => navigateTo(context, const AppInfoScreen()),
          ),
        ],
      ),
    );
  }
}
