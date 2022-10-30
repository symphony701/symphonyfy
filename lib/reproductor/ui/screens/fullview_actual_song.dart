import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:symphonyfy/helpers/responsive_helper.dart';
import 'package:symphonyfy/reproductor/providers/audio_player_provider.dart';
import 'package:symphonyfy/reproductor/ui/widgets/information_player.dart';
import 'package:symphonyfy/reproductor/ui/widgets/top_icons.dart';

class FullSongView extends StatefulWidget {
  const FullSongView({super.key});

  @override
  State<FullSongView> createState() => _FullSongViewState();
}

class _FullSongViewState extends State<FullSongView> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    AudioPlayerProvider audioPlayerProvider =
        context.watch<AudioPlayerProvider>();
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: responsive.wp(100),
          height: responsive.hp(100),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(audioPlayerProvider.actualSong.cover),
            ),
          ),
        ),
        SafeArea(
          child: SizedBox(
            width: responsive.wp(100),
            height: responsive.hp(100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TopIcons(),
                InformationPlayer(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
