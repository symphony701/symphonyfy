import 'package:flutter/material.dart';
import 'package:symphonyfy/home/ui/screens/homeview.dart';
import 'package:symphonyfy/reproductor/ui/screens/fullview_actual_song.dart';

class AppRoutes {
  static const initialRoute = 'homeView';

  static Map<String, Widget Function(BuildContext)> routes = {
    'homeView': (_) => const HomeView(),
    'playerView': (_) => const FullSongView(),
  };
}
