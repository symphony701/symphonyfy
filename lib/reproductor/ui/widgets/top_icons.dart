import 'package:flutter/material.dart';
import 'package:symphonyfy/helpers/responsive_helper.dart';

class TopIcons extends StatelessWidget {
  const TopIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: responsive.dp(1), vertical: responsive.dp(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: responsive.dp(5),
            height: responsive.dp(5),
            decoration: const BoxDecoration(
              color: Color.fromARGB(188, 255, 255, 255),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Center(child: Icon(Icons.arrow_back)),
          ),
          Container(
            width: responsive.dp(5),
            height: responsive.dp(5),
            decoration: const BoxDecoration(
              color: Color.fromARGB(188, 255, 255, 255),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Center(child: Icon(Icons.more_vert)),
          ),
        ],
      ),
    );
  }
}
