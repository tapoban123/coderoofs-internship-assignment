import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            Scaffold(
              body: Center(
                child: Text("One", style: TextStyle(fontSize: 30.sp)),
              ),
            ),
            Scaffold(
              body: Center(
                child: Text("Two", style: TextStyle(fontSize: 30.sp)),
              ),
            ),
            Scaffold(
              body: Center(
                child: Text("Three", style: TextStyle(fontSize: 30.sp)),
              ),
            ),
            BlindMixerScreen(),
            Scaffold(
              body: Center(
                child: Text("Five", style: TextStyle(fontSize: 30.sp)),
              ),
            ),
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
              Divider(color: CustomColors.lightPinkColor),
              26.verticalSpace,
              Text(
                "Upcoming Blind Date",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22.sp),
              ),
              6.verticalSpace,
              Text(
                "Let Mixer surprise you with a match.",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              ),
              16.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.lightPinkColor),
                  borderRadius: BorderRadius.circular(200.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                child: Row(
                  spacing: 5.w,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomSVGs.calendar(color: CustomColors.purpleDark),
                    Text(
                      "September 28 - 10 PM",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              26.verticalSpace,
              Divider(color: CustomColors.lightPinkColor),
              Spacer(),
              ValueListenableBuilder(
                valueListenable: isFormFilled,
                builder: (context, isFormFilledValue, child) {
                  if (isFormFilledValue) {
                    return TextButton(
                      onPressed: () {
                        isFormFilled.value = !isFormFilled.value;
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                          side: BorderSide(
                            color: CustomColors.purpleMedium,
                            width: 1,
                          ),
                        ),
                        minimumSize: Size(double.infinity, 50.h),
                      ),
                      child: Row(
                        spacing: 6.w,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check, color: CustomColors.purpleDark),
                          Text(
                            "Applied for Blind Mixer",
                            style: TextStyle(color: CustomColors.purpleDark),
                          ),
                        ],
                      ),
                    );
                  }
                  return Column(
                    children: [
                      Row(
                        spacing: 12.w,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(color: CustomColors.purpleDark),
                          ),
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: CustomColors.purpleDark,
                          ),
                          Text(
                            "Smart Match",
                            style: TextStyle(color: CustomColors.purpleDark),
                          ),
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: CustomColors.purpleDark,
                          ),
                          Text(
                            "Blind Date",
                            style: TextStyle(color: CustomColors.purpleDark),
                          ),
                        ],
                      ),
                      24.verticalSpace,
                      TextButton(
                        onPressed: () {
                          isFormFilled.value = !isFormFilled.value;
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          backgroundColor: CustomColors.purpleDark,
                          minimumSize: Size(double.infinity, 50.h),
                        ),
                        child: Row(
                          spacing: 6.w,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomSVGs.form(color: Colors.white),
                            Text(
                              "Fill out the Form",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              35.verticalSpace,
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
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            tabIcons.length,
            (index) => ValueListenableBuilder(
              valueListenable: _selectedTab,
              builder: (context, selectedTabValue, child) => CircleAvatar(
                radius: 24,
                backgroundColor: index == selectedTabValue
                    ? CustomColors.tabIconHighlightColor
                    : Colors.white,
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
