import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:symphonyfy/helpers/responsive_helper.dart';
import 'package:symphonyfy/reproductor/providers/audio_player_provider.dart';
import 'package:symphonyfy/reproductor/ui/widgets/reproductor_slider.dart';

class InformationPlayer extends StatefulWidget {
  const InformationPlayer({super.key});

  @override
  State<InformationPlayer> createState() => _InformationPlayerState();
}

class _InformationPlayerState extends State<InformationPlayer> {
  @override
  Widget build(BuildContext context) {
    AudioPlayerProvider audioPlayerProvider =
        context.watch<AudioPlayerProvider>();
    final responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.all(responsive.dp(1.5)),
      child: Container(
        height: responsive.hp(30),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(211, 255, 255, 255),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(responsive.dp(1.7)),
          child: Column(
            children: [
              AutoSizeText(
                audioPlayerProvider.actualSong.name,
                minFontSize: 13,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: responsive.dp(2.7),
                    fontWeight: FontWeight.w600),
              ),
              AutoSizeText(
                audioPlayerProvider.actualSong.author,
                minFontSize: 11,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    color: Colors.grey.shade600, fontSize: responsive.dp(2)),
              ),
              const ReproductorSlider()
            ],
          ),
        ),
      ),
    );
  }
}
