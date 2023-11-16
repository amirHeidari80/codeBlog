// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/components/strings.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/views/my_cats_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:validators/validators.dart';

class RegesterIntroScreen extends StatelessWidget {
  RegesterIntroScreen(
      {super.key,
      required this.theme,
      required this.size,
      required this.bodyMargin});
  final Size size;
  final double bodyMargin;
  var theme;

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController activeCodeEditingController = TextEditingController();
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
            _showEmailBottomSheet(context);
          },
          child: SizedBox(
            width: size.width / 5,
            child: const Center(
              child: Text('ثبت نام'),
            ),
          ),
        ),
        SizedBox(
          height: size.height / 13,
        ),
      ],
    );
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 3,
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
                      controller: emailEditingController,
                      maxLines: 1,
                      onChanged: (value) {
                        if (isEmail(value)) {
                          print('email is Validate');
                        }
                      },
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
                    onPressed: () {
                      Navigator.pop(context);
                      _showActivateCodeBottomSheet(context);
                    },
                    child: SizedBox(
                      width: size.width / 5,
                      child: const Center(
                        child: Text('ادامه'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> _showActivateCodeBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 3,
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
                    MyStrings.textInsertActivateCode,
                    style: theme.textTheme.titleLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 15),
                    child: TextField(
                      controller: activeCodeEditingController,
                      onChanged: (value) {
                        if (isEmail(value)) {
                          print('Activate Code is Validate');
                        }
                      },
                      style: theme.textTheme.titleLarge,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 6,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: '******',
                        hintStyle: theme.textTheme.titleSmall,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, CupertinoPageRoute(
                              builder: (BuildContext context) {
                            return MyCatsScreen(
                                theme: theme,
                                size: size,
                                bodyMargin: bodyMargin);
                          }));
                        },
                        child: SizedBox(
                          width: size.width / 5,
                          child: const Center(
                            child: Text('ادامه'),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _showEmailBottomSheet(context);
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return MyColors.colorPrimery.withOpacity(0.2);
                              } else {
                                return Colors.transparent;
                              }
                            }),
                          ),
                          child: Text(
                            'ویرایش ایمیل',
                            style: theme.textTheme.titleLarge,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
