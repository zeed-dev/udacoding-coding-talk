import 'package:coding_talk/models/category.dart';
import 'package:coding_talk/models/mentor.dart';
import 'package:coding_talk/models/tips.dart';
import 'package:coding_talk/shared/theme.dart';
import 'package:coding_talk/ui/widgets/category_crad_widgets.dart';
import 'package:coding_talk/ui/widgets/mentor_card_widgets.dart';
import 'package:coding_talk/ui/widgets/tips_card_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var categorySelected;

  @override
  void initState() {
    super.initState();
    categorySelected = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // NOTE: HEADER
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: edgs,
                      vertical: edgs,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // NOTE: PHOTO
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/PICT1.png"),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            // NOTE: TEXT
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Good Morning,",
                                  style: greyFontStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Bimo Semesta",
                                  style: whiteFontStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/NOTIFICATION.png",
                          width: 18,
                        )
                      ],
                    ),
                  ),
                  // NOTE: BODY
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NOTE: SERACH
                        Padding(
                          padding: EdgeInsets.only(
                            left: edgs,
                            right: edgs,
                            top: edgs,
                            bottom: 12,
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Find your favorite mentor",
                                        hintStyle: greyFontStyle,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: whiteColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        // NOTE: LIST CATEGORY
                        Container(
                          height: 35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mockCategory.length,
                            itemBuilder: (context, index) {
                              return CategoryCardWidgets(
                                category: mockCategory[index],
                                index: index,
                                isSelected:
                                    categorySelected == mockCategory[index].id,
                                onTap: () {
                                  setState(() {
                                    categorySelected = mockCategory[index].id;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        // NOTE: MENTOR
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edgs),
                          child: Text(
                            "Top Mentor",
                            style: blackFontStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // NOTE: CARD MENTOR
                        Container(
                          height: 194,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mockMentor.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 194,
                                width: 160,
                                margin: EdgeInsets.only(
                                  left: index == 0 ? edgs : 12,
                                  right:
                                      index == mockMentor.length - 1 ? edgs : 0,
                                ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffF3F4F8),
                                ),
                                child: MentorCardWidgets(
                                  mentor: mockMentor[index],
                                ),
                              );
                            },
                          ),
                        ),
                        // NOTE: MENTOR TIPS
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edgs),
                          child: Text(
                            "Mentor Tips",
                            style: blackFontStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // NOTE: MENTOR CARD TIPS
                        Container(
                          height: 131,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mockTips.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 131,
                                width: 250,
                                margin: EdgeInsets.only(
                                  left: index == 0 ? edgs : 12,
                                  right:
                                      index == mockTips.length - 1 ? edgs : 0,
                                ),
                                child: TipsCardMentor(
                                  tips: mockTips[index],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 59)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
