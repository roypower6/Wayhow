class IdeaModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final List<String> tags;
  final bool isFavorite;
  final List<String> icons;
  final List<String> coreFeatures;

  IdeaModel({
    required this.id,
    required this.title,
    this.description = '',
    this.category = 'General',
    this.tags = const [],
    this.isFavorite = false,
    this.icons = const [],
    required this.coreFeatures,
  });

  // Create a copy of the idea with optional modifications
  IdeaModel copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    List<String>? tags,
    bool? isFavorite,
    List<String>? icons,
    List<String>? coreFeatures,
  }) {
    return IdeaModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      isFavorite: isFavorite ?? this.isFavorite,
      icons: icons ?? this.icons,
      coreFeatures: coreFeatures ?? this.coreFeatures,
    );
  }

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'tags': tags,
      'isFavorite': isFavorite,
      'icons': icons,
      'coreFeatures': coreFeatures,
    };
  }

  // Create from JSON
  factory IdeaModel.fromJson(Map<String, dynamic> json) {
    return IdeaModel(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      category: json['category'] ?? 'General',
      tags: List<String>.from(json['tags'] ?? []),
      isFavorite: json['isFavorite'] ?? false,
      icons: List<String>.from(json['icons'] ?? []),
      coreFeatures: List<String>.from(json['coreFeatures'] ?? []),
    );
  }
}
