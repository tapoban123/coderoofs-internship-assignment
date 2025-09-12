import 'package:flutter/material.dart';
import 'package:ui_assignment/utils/custom_assets.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        _EditProfileAppbar()
      ])),
    );
  }
}

class _EditProfileAppbar extends StatelessWidget {
  const _EditProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: CustomSVGs.arrow(
            color: CustomColors.gray800,
          ),
        ),
      ],
    );
  }
}
