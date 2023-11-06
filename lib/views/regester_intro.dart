// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/const/colors.dart';
import 'package:flutter_codeblog/const/strings.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegesterIntroScreen extends StatelessWidget {
  RegesterIntroScreen(
      {super.key,
      required this.theme,
      required this.size,
      required this.bodyMargin});
  final Size size;
  final double bodyMargin;
  var theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.images.tcbot.path,
          height: size.height / 8,
        ),
        const SizedBox(
          height: 12,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: MyStrings.textWelcom, style: theme.textTheme.titleLarge)),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: size.height / 2.7,
                      decoration: const BoxDecoration(
                        color: MyColors.colorScaffoldBG,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            MyStrings.textInsertEmail,
                            style: theme.textTheme.titleLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 15),
                            child: TextField(
                              style: theme.textTheme.titleLarge,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'amir@gmail.com',
                                hintStyle: theme.textTheme.titleSmall,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('ادامه'),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Text('بزن بریم'),
        ),
        SizedBox(
          height: size.height / 13,
        ),
      ],
    );
  }
}
