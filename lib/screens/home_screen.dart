import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayhow/controllers/ideas_controller.dart';
import 'package:wayhow/screens/add_idea_screen.dart';
import 'package:wayhow/widgets/idea_card.dart';
import 'package:wayhow/widgets/left_drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final IdeasController ideasController = Get.put(IdeasController());

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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filtering coming soon!')),
              );
            },
          ),
        ],
      ),
      body: Obx(
        () {
          // 개발 아이디어가 아직 없을 때
          if (ideasController.ideas.isEmpty) {
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
                ],
              ),
            );
          }
          // 홈 화면 아이디어 리스트
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: ideasController.ideas.length,
            itemBuilder: (context, index) {
              final idea = ideasController.ideas[index];
              return IdeaCard(
                idea: idea,
                onTap: () {
                  Get.to(() => AddIdeaScreen(initialIdea: idea));
                },
              );
            },
          );
        },
      ),
      drawer: LeftDrawerWidget(
        ideas: ideasController.ideas,
        context: context,
      ),
      // 아이디어 추가 플로팅 액션 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddIdeaScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
