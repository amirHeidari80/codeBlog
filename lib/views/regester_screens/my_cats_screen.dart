// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/components/strings.dart';
import 'package:flutter_codeblog/controller/home_controller.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/models/tags_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyCatsScreen extends StatelessWidget {
  RxList<TagsModel> insertAddListSkill = RxList();

  MyCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.images.tcbot.path,
                      height: size.height / 8,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: MyStrings.textSuccessFulRegister,
                          style: theme.textTheme.titleLarge),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: bodyMargin),
                      child: TextField(
                        // controller: activeCodeEditingController,
                        onChanged: (value) {},
                        style: theme.textTheme.titleLarge,
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'نام و نام خانوادگی',
                          hintStyle: theme.textTheme.titleSmall,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(MyStrings.textChoosCats,
                        style: theme.textTheme.titleLarge),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 16, 15, 16),
                      child: SizedBox(
                        // width: double.infinity,
                        height: 85,
                        child: GridView.builder(
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                Get.find<HomeController>().tagsList.length,
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
                                  if (!insertAddListSkill.contains(
                                      Get.find<HomeController>()
                                          .tagsList[index])) {
                                    insertAddListSkill.add(
                                        Get.find<HomeController>()
                                            .tagsList[index]);
                                  }
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.tag_rounded,
                                          color: MyColors.colorPosterTitle,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: Text(
                                            Get.find<HomeController>()
                                                .tagsList[index]
                                                .title!,
                                            style: theme.textTheme.bodySmall,
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          insertAddListSkill[index].title!,
                                          style: theme.textTheme.titleLarge,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          insertAddListSkill.removeAt(index);
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
              )),
        ),
      ),
    );
  }
}
