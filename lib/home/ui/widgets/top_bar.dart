import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:symphonyfy/helpers/responsive_helper.dart';

class TopBarHome extends StatelessWidget {
  const TopBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          'Hello, Symphony',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: responsive.dp(2.4),
              fontWeight: FontWeight.w600),
        ),
        Container(
          margin: EdgeInsets.only(left: responsive.dp(4)),
          width: responsive.dp(4.5),
          height: responsive.dp(4.5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(188, 255, 255, 255),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(color: Colors.black),
          ),
          child: const Center(child: Icon(Icons.more_vert)),
        ),
      ],
    );
  }
}
