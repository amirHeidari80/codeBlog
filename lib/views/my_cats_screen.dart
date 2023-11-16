// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/components/strings.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';

import 'package:flutter_codeblog/models/fakedata.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCatsScreen extends StatefulWidget {
  MyCatsScreen(
      {super.key,
      required this.theme,
      required this.size,
      required this.bodyMargin});
  final Size size;
  final double bodyMargin;
  var theme;

  @override
  State<MyCatsScreen> createState() => _MyCatsScreenState();
}

class _MyCatsScreenState extends State<MyCatsScreen> {
  TextEditingController emailEditingController = TextEditingController();

  TextEditingController activeCodeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.images.tcbot.path,
                  height: widget.size.height / 8,
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.textSuccessFulRegister,
                      style: widget.theme.textTheme.titleLarge),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.bodyMargin),
                  child: TextField(
                    // controller: activeCodeEditingController,
                    onChanged: (value) {},
                    style: widget.theme.textTheme.titleLarge,
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'نام و نام خانوادگی',
                      hintStyle: widget.theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(MyStrings.textChoosCats,
                    style: widget.theme.textTheme.titleLarge),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 16, 15, 16),
                  child: SizedBox(
                    // width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: listHshtak.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.3,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (!insertAddListSkill
                                    .contains(listHshtak[index])) {
                                  insertAddListSkill.add(listHshtak[index]);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(
                                    colors: MyGradintColors.gradintTags,
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.tag_rounded,
                                      color: MyColors.colorPosterTitle,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      listHshtak[index].title.toString(),
                                      style: widget.theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Image.asset(
                  Assets.icons.downCatArrow.path,
                  scale: 3,
                ),
                //selected Tags
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 16, 15, 10),
                  child: SizedBox(
                    // width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: insertAddListSkill.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.2,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: MyColors.colorHintText,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    insertAddListSkill[index].title.toString(),
                                    style: widget.theme.textTheme.titleLarge,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        insertAddListSkill.removeAt(index);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete_forever_rounded,
                                      color: MyColors.colorDivider,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
