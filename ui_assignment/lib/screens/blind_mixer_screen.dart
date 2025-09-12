import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_assignment/utils/custom_assets.dart';

final ValueNotifier<int> _selectedTab = ValueNotifier(0);

class NavControllerScreen extends StatelessWidget {
  const NavControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _CustomBottomNavBar(),
      body: ValueListenableBuilder(
        valueListenable: _selectedTab,
        builder: (context, selectedTabValue, child) => IndexedStack(
          index: selectedTabValue,
          children: [
            Scaffold(body: Center(child: Text("One"))),
            Scaffold(body: Center(child: Text("Two"))),
            Scaffold(body: Center(child: Text("Three"))),
            BlindMixerScreen(),
            Scaffold(body: Center(child: Text("Five"))),
          ],
        ),
      ),
    );
  }
}

class BlindMixerScreen extends StatefulWidget {
  const BlindMixerScreen({super.key});

  @override
  State<BlindMixerScreen> createState() => _BlindMixerScreenState();
}

class _BlindMixerScreenState extends State<BlindMixerScreen> {
  final ValueNotifier<bool> isFormFilled = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              _BlindMixerAppbar(),
              30.verticalSpace,
              Image.asset(CustomPNGs.date, height: 240.w, width: 240.w),
              Text("Upcoming Blind Date"),
              Text("Let Mixer surprise you with a match."),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSVGs.calendar(color: CustomColors.purpleDark),
                  Text("September 28 - 10 PM"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlindMixerAppbar extends StatelessWidget {
  const _BlindMixerAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Blind Mixer",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 16.w,
            children: [
              CustomSVGs.flash(color: CustomColors.purpleDark),
              CustomSVGs.notification(color: CustomColors.purpleDark),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomBottomNavBar extends StatefulWidget {
  const _CustomBottomNavBar({super.key});

  @override
  State<_CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<_CustomBottomNavBar> {
  final List<Widget> tabIcons = [
    CustomSVGs.tab1(color: CustomColors.tabIconColor),
    Image.asset(CustomPNGs.tab2),
    CustomSVGs.tab3(color: CustomColors.tabIconColor),
    CustomSVGs.tab4(color: CustomColors.tabIconColor),
    CustomSVGs.profile(color: CustomColors.tabIconColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 30, spreadRadius: 0.1),
        ],
      ),
      child: ValueListenableBuilder(
        valueListenable: _selectedTab,
        builder: (context, selectedTabValue, child) => SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              tabIcons.length,
              (index) => CircleAvatar(
                radius: 24,
                backgroundColor: index == selectedTabValue
                    ? CustomColors.tabIconHighlightColor
                    : Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    _selectedTab.value = index;
                  },
                  child: tabIcons[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
