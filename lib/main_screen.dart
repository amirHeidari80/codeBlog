import 'package:flutter/material.dart';
import 'package:flutter_codeblog/const/colors.dart';
import 'package:flutter_codeblog/const/strings.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/models/fakedata.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu_rounded),
                  Image.asset(
                    Assets.images.splash.path,
                    height: size.height / 13.6,
                  ),
                  const Icon(Icons.search_rounded),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: size.width / 1.19,
                height: size.height / 4.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(homePagePosterMap["imageUrl"])
                                .image),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: MyGradintColors.gradintCoverHomePost,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: MyGradintColors.gradintCoverHomePost,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                homePagePosterMap["writer"] +
                                    ' - ' +
                                    homePagePosterMap["date"],
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                homePagePosterMap["viwe"],
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Text(
                            homePagePosterMap["title"],
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listHshtak.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: index == 0 ? bodyMargin : 0, left: 10),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                                colors: MyGradintColors.gradintTags,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, top: 32, bottom: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.mode_edit_outline_rounded,
                      color: MyColors.colorTitle,
                      size: 22,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      MyStrings.textViweHotBlog,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 3.4,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: blogList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: index == 0 ? bodyMargin : 0, left: 16),
                        child: SizedBox(
                          width: size.width / 2.4,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: size.height / 4.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            blogList[index].imageUrl),
                                      ),
                                    ),
                                    foregroundDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: LinearGradient(
                                            colors:
                                                MyGradintColors.gradintBlogs,
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter)),
                                  ),
                                  Positioned(
                                    left: 10,
                                    bottom: 10,
                                    right: 10,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            blogList[index].writer,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ),
                                        Text(
                                          blogList[index].views,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: MyColors.colorPosterSubText,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                blogList[index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: theme.textTheme.titleLarge,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: size.height / 4,
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.red,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
