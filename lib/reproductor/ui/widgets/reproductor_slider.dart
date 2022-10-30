import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:symphonyfy/helpers/responsive_helper.dart';
import 'package:symphonyfy/reproductor/providers/audio_player_provider.dart';

class ReproductorSlider extends StatefulWidget {
  const ReproductorSlider({super.key});

  @override
  State<ReproductorSlider> createState() => _ReproductorSliderState();
}

class _ReproductorSliderState extends State<ReproductorSlider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AudioPlayerProvider audioPlayerProvider =
        context.watch<AudioPlayerProvider>();
    final responsive = Responsive.of(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: SliderTheme(
            data: const SliderThemeData(
              trackHeight: 4,
              thumbColor: Colors.transparent,
              thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 0.0,
                  disabledThumbRadius: 0,
                  pressedElevation: 0,
                  elevation: 0),
            ),
            child: Slider.adaptive(
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              min: 0,
              max: audioPlayerProvider.duration.inSeconds.toDouble(),
              value: audioPlayerProvider.position.inSeconds.toDouble(),
              onChanged: (val) async {
                audioPlayerProvider.seekPlayer(val.toInt());
                //await audioPlayer.resume();
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.dp(2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //AutoSizeText('${(_value / 60).floor()}:${(_value % 60).floor()}'),
              AutoSizeText(audioPlayerProvider.positionString),
              AutoSizeText(audioPlayerProvider.durationString),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                audioPlayerProvider.prevSong();
              },
              icon: Icon(
                Icons.skip_previous_rounded,
                size: responsive.dp(4),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.rotate_left_rounded,
                size: responsive.dp(4),
              ),
            ),
            IconButton(
              onPressed: () async {
                audioPlayerProvider.playClick();
              },
              icon: Icon(
                !audioPlayerProvider.isPlaying
                    ? Icons.play_circle
                    : Icons.pause,
                size: responsive.dp(5),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.rotate_right_rounded,
                size: responsive.dp(4),
              ),
            ),
            IconButton(
              onPressed: () {
                audioPlayerProvider.nextSong();
              },
              icon: Icon(
                Icons.skip_next_rounded,
                size: responsive.dp(4),
              ),
            ),
          ],
        )
      ],
    );
  }
}
