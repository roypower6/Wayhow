class IdeaModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime createdAt;
  final List<String> tags;
  final bool isFavorite;
  final List<String> icons;

  IdeaModel({
    required this.id,
    required this.title,
    this.description = '',
    this.category = 'General',
    DateTime? createdAt,
    this.tags = const [],
    this.isFavorite = false,
    this.icons = const [],
  }) : createdAt = createdAt ?? DateTime.now();

  // Create a copy of the idea with optional modifications
  IdeaModel copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    DateTime? createdAt,
    List<String>? tags,
    bool? isFavorite,
    List<String>? icons,
  }) {
    return IdeaModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      tags: tags ?? this.tags,
      isFavorite: isFavorite ?? this.isFavorite,
      icons: icons ?? this.icons,
    );
  }

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'tags': tags,
      'isFavorite': isFavorite,
      'icons': icons,
    };
  }

  // Create from JSON
  factory IdeaModel.fromJson(Map<String, dynamic> json) {
    return IdeaModel(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      category: json['category'] ?? 'General',
      createdAt: DateTime.parse(json['createdAt']),
      tags: List<String>.from(json['tags'] ?? []),
      isFavorite: json['isFavorite'] ?? false,
      icons: List<String>.from(json['icons'] ?? []),
    );
  }
}
