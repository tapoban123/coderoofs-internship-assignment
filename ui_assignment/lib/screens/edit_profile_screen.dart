import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_assignment/utils/custom_assets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final List<String> menImages = [
    CustomPNGs.man1,
    CustomPNGs.man2,
    CustomPNGs.man3,
    CustomPNGs.man4,
    CustomPNGs.man5,
    CustomPNGs.man6,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _EditProfileAppbar(),
                30.verticalSpace,
                Stack(
                  children: [
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 14.h,
                        childAspectRatio: 0.84,
                      ),
                      shrinkWrap: true,
                      children: List.generate(
                        menImages.length,
                        (index) => ClipRRect(
                          borderRadius: BorderRadius.circular(6.r),
                          child: Stack(
                            alignment: Alignment.center,
                            fit: StackFit.expand,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 4.0.w,
                                  right: 4.0.w,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(menImages[index]),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 14.w,
                                  height: 14.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.gray700,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8.w,
                      left: 4.w,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(34.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Text(
                          "Main",
                          style: TextStyle(
                            fontSize: 8.sp,
                            height: 1.6.h,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.purpleDark,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                32.verticalSpace,
                Text(
                  "Your details",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Column(
                //   children:  List.generate(30, (index) => Text("hello"),),
                // )
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _getOptionsData().length,
                  itemBuilder: (context, index) {
                    final option = _getOptionsData()[index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(option.name),
                          leading: option.logo,

                          trailing: CustomSVGs.arrow(
                            color: CustomColors.gray600,
                          ),
                          shape: Border(
                            bottom: BorderSide(color: CustomColors.gray200),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                36.verticalSpace,
                _PerfectMatchCard(),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PerfectMatchCard extends StatelessWidget {
  const _PerfectMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 209.h,
      decoration: BoxDecoration(
        color: CustomColors.purpleLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: CustomColors.purpleMedium),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Discover your Perfect Match",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
          16.verticalSpace,
          SizedBox(
            width: 116.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(left: 0, child: Image.asset(CustomPNGs.avatar_2)),
                Positioned(right: 0, child: Image.asset(CustomPNGs.avatar_3)),
                Image.asset(CustomPNGs.avatar),
              ],
            ),
          ),
          32.verticalSpace,
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(330.w, 42.h),
              backgroundColor: CustomColors.purpleDark,
            ),
            child: Text(
              "Take the quiz again",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditProfileAppbar extends StatelessWidget {
  const _EditProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },

            child: Icon(CupertinoIcons.back),
          ),
          Text(
            "Edit Profile",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
          ),
          CustomSVGs.eye_2(color: CustomColors.deepBlue),
        ],
      ),
    );
  }
}

class _DetailOptionData {
  final String name;
  final SvgPicture logo;
  final VoidCallback onTap;

  _DetailOptionData({
    required this.name,
    required this.logo,
    required this.onTap,
  });
}

List<_DetailOptionData> _getOptionsData() {
  return [
    _DetailOptionData(
      name: "About me (Bio)",
      logo: CustomSVGs.about_me(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "What are you looking for?",
      logo: CustomSVGs.looking_for(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Gender",
      logo: CustomSVGs.gender(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Birthday (Age)",
      logo: CustomSVGs.birthday(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Height",
      logo: CustomSVGs.height(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Interested in?",
      logo: CustomSVGs.interests(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Sexuality",
      logo: CustomSVGs.gender(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Relationship",
      logo: CustomSVGs.relationship(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Ethnicity",
      logo: CustomSVGs.ethnicity(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Kids",
      logo: CustomSVGs.kids(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Drinking",
      logo: CustomSVGs.drinking(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Smoking",
      logo: CustomSVGs.smoking(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Marijuana",
      logo: CustomSVGs.marijuana(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Religious Beliefs",
      logo: CustomSVGs.religious(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Political Views",
      logo: CustomSVGs.political(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Interest and  Hobbies",
      logo: CustomSVGs.hobbies(color: CustomColors.gray800),
      onTap: () {},
    ),
    _DetailOptionData(
      name: "Values & Lifestyle",
      logo: CustomSVGs.lifestyle(color: CustomColors.gray800),
      onTap: () {},
    ),
  ];
}
