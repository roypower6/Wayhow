import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayhow/controllers/ideas_controller.dart';
import 'package:wayhow/models/idea_model.dart';
import 'package:wayhow/screens/add_idea_screen.dart';
import 'package:wayhow/widgets/home_widget/filter_bottom_sheet.dart';
import 'package:wayhow/widgets/home_widget/idea_card.dart';
import 'package:wayhow/widgets/left_drawer.dart';
import 'package:wayhow/controllers/filter_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final IdeasController ideasController = Get.put(IdeasController());
    final FilterController filterController = Get.put(FilterController());

    void showFilterBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) => FilterBottomSheet(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      );
    }

    List<IdeaModel> getFilteredIdeas() {
      return ideasController.ideas.where((idea) {
        // Category filter
        if (filterController.selectedCategory.value.isNotEmpty &&
            idea.category != filterController.selectedCategory.value) {
          return false;
        }
        // Icon filter
        if (filterController.selectedIcon.value.isNotEmpty &&
            !idea.icons.contains(filterController.selectedIcon.value)) {
          return false;
        }
        return true;
      }).toList()
        ..sort((a, b) {
          // Sort by favorites first
          if (filterController.showFavoritesFirst.value) {
            if (a.isFavorite && !b.isFavorite) return -1;
            if (!a.isFavorite && b.isFavorite) return 1;
          }
          return 0;
        });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wayhow',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: showFilterBottomSheet,
          ),
        ],
      ),
      body: Obx(() {
        final filteredIdeas = getFilteredIdeas();

        if (filteredIdeas.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  size: 100,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                Text(
                  '개발 아이디어가 아직 없습니다.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  '+ 버튼을 눌러 새 개발 아이디어를 추가해 보세요!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (filterController.selectedCategory.value.isNotEmpty ||
                    filterController.selectedIcon.value.isNotEmpty)
                  ElevatedButton(
                    onPressed: filterController.resetFilters,
                    child: const Text('필터 초기화'),
                  ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: filteredIdeas.length,
          itemBuilder: (context, index) {
            final idea = filteredIdeas[index];
            return IdeaCard(
              idea: idea,
              onTap: () => Get.to(() => AddIdeaScreen(initialIdea: idea)),
            );
          },
        );
      }),
      drawer: LeftDrawerWidget(
        ideas: ideasController.ideas,
        context: context,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddIdeaScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
