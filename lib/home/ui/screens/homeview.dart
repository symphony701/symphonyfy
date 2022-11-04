import 'package:flutter/material.dart';
import 'package:symphonyfy/helpers/responsive_helper.dart';
import 'package:symphonyfy/home/ui/widgets/top_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: responsive.dp(3),
                    left: responsive.dp(3),
                    right: responsive.dp(3)),
                child: Column(
                  children: [TopBarHome()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
