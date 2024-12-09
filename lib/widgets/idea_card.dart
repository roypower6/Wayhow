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
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      idea.title,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              idea.isFavorite ? Icons.star : Icons.star_border,
                              color: idea.isFavorite ? Colors.yellow : null,
                            ),
                            onPressed: () {
                              ideasController.toggleFavorite(idea.id);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Idea'),
                                  content: const Text(
                                      'Are you sure you want to delete this idea?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        ideasController.deleteIdea(idea.id);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Colors.red,
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
                      const SizedBox(height: 8),
                      if (idea.icons.isNotEmpty)
                        Row(
                          children: idea.icons.map((icon) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Icon(
                                DevIconsUtils.getDevIconFromString(icon),
                                size: 24,
                                color: Colors.grey,
                              ),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                idea.description,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color
                        ?.withOpacity(0.8)),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Chip(
                    label: Text(idea.category),
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                  ),
                  const Spacer(),
                  Text(
                    '최근 수정 일자: ${idea.createdAt.year}-${idea.createdAt.month.toString().padLeft(2, '0')}-${idea.createdAt.day.toString().padLeft(2, '0')}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 6),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
