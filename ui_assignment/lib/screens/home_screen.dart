import 'package:flutter/material.dart';
import 'package:ui_assignment/screens/blind_mixer_screen.dart';
import 'package:ui_assignment/screens/edit_profile_screen.dart';
import 'package:ui_assignment/utils/custom_assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              _HomeCustomButton(
                text: "Blind Mixer Screen",
                color: Colors.purpleAccent,
                screen: NavControllerScreen(),
              ),
              _HomeCustomButton(
                text: "Edit Profile Screen",
                color: Colors.orange,
                screen: EditProfileScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeCustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Widget screen;

  const _HomeCustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => screen));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: CustomFontFamily.ONEST_MEDIUM)),
    );
  }
}
