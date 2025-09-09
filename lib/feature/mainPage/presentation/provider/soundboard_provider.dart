import 'package:flutter/material.dart';
import '../../model/soundboard_item.dart';
import '../../data/soundboard_repository.dart';

class SoundboardProvider extends ChangeNotifier {
  final SoundboardRepository _repository = SoundboardRepository();
  List<SoundboardItem>? _items;
  bool _isLoading = false;
  String? _error;

  List<SoundboardItem>? get items => _items;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadSoundboardItems() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _items = await _repository.loadItems();
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
