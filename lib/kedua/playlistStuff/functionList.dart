import 'package:flutter/material.dart';

class CRUD with ChangeNotifier{
  List<tipeData> _playlist = [];
  List<tipeData> get playlist => _playlist;

  void tambah(tipeData data){
    _playlist.add(data);
    notifyListeners();
  }
  void hapus(tipeData data){
    _playlist = _playlist.where((item) => item.id != data.id).toList();
    notifyListeners();
  }
  void ganti(tipeData data){
    _playlist[_playlist.indexWhere((item) => item.id == data.id)] = data;
    notifyListeners();
  }
}

class tipeData {
  final String id;
  final String data;

  tipeData({
    required this.id,
    required this.data,
  });
}