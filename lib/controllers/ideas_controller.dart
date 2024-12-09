import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:wayhow/models/idea_model.dart';
import 'dart:convert';

class IdeasController extends GetxController {
  final RxList<IdeaModel> _ideas = <IdeaModel>[].obs;
  static const String _namespace = 'wayhow_ideas';
  static const String _ideasKey = '$_namespace/ideas_list';
  
  List<IdeaModel> get ideas => _ideas;

  @override
  void onInit() {
    super.onInit();
    _loadIdeas();
  }

  Future<void> _loadIdeas() async {
    final prefs = await SharedPreferences.getInstance();
    final ideasJson = prefs.getStringList(_ideasKey) ?? [];
    
    _ideas.value = ideasJson
      .map((json) => IdeaModel.fromJson(jsonDecode(json)))
      .toList();
  }

  Future<void> _saveIdeas() async {
    final prefs = await SharedPreferences.getInstance();
    final ideasJson = _ideas
      .map((idea) => jsonEncode(idea.toJson()))
      .toList();
    
    await prefs.setStringList(_ideasKey, ideasJson);
  }

  void addIdea(IdeaModel idea) {
    final newIdea = idea.id.isEmpty 
      ? idea.copyWith(id: const Uuid().v4()) 
      : idea;
    
    _ideas.add(newIdea);
    _saveIdeas();
  }

  void updateIdea(IdeaModel updatedIdea) {
    final index = _ideas.indexWhere((idea) => idea.id == updatedIdea.id);
    if (index != -1) {
      _ideas[index] = updatedIdea;
      _saveIdeas();
    }
  }

  void deleteIdea(String id) {
    _ideas.removeWhere((idea) => idea.id == id);
    _saveIdeas();
  }

  void toggleFavorite(String id) {
    final index = _ideas.indexWhere((idea) => idea.id == id);
    if (index != -1) {
      final currentIdea = _ideas[index];
      _ideas[index] = currentIdea.copyWith(isFavorite: !currentIdea.isFavorite);
      _saveIdeas();
    }
  }
}
