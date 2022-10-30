import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symphonyfy/helpers/responsive_helper.dart';
import 'package:symphonyfy/reproductor/providers/audio_player_provider.dart';
import 'package:symphonyfy/reproductor/ui/screens/fullview_actual_song.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AudioPlayerProvider>(
              create: (_) => AudioPlayerProvider())
        ],
        builder: (context, _) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Material App',
              home: FullSongView());
        });
  }
}
