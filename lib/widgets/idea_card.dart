import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayhow/controllers/ideas_controller.dart';
import 'package:wayhow/models/idea_model.dart';
import 'package:wayhow/utils/dev_icons_list.dart';

class IdeaCard extends StatelessWidget {
  final IdeaModel idea;
  final VoidCallback? onTap;

  const IdeaCard({
    super.key,
    required this.idea,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ideasController = Get.find<IdeasController>();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 4,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 4,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            idea.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  visualDensity: VisualDensity.compact,
                                  icon: Icon(
                                    idea.isFavorite
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: idea.isFavorite
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.6),
                                  ),
                                  onPressed: () {
                                    ideasController.toggleFavorite(idea.id);
                                  },
                                ),
                                IconButton(
                                  visualDensity: VisualDensity.compact,
                                  icon: Icon(
                                    Icons.delete,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          '아이디어 삭제',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: Text(
                                          '이 아이디어를 정말 삭제하시겠습니까?',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text(
                                              '취소',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              ideasController
                                                  .deleteIdea(idea.id);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              '삭제',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            if (idea.icons.isNotEmpty)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: idea.icons.map((icon) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: Icon(
                                        DevIconsUtils.getDevIconFromString(
                                            icon),
                                        size: 20,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.7),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      idea.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.color
                            ?.withOpacity(0.8),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          child: Text(
                            idea.category,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '최근 수정: ${idea.createdAt.year}-${idea.createdAt.month.toString().padLeft(2, '0')}-${idea.createdAt.day.toString().padLeft(2, '0')}',
                          style: TextStyle(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
