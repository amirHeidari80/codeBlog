// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/components/strings.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/controller/regester_controller.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class RegesterIntroScreen extends StatelessWidget {
  const RegesterIntroScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
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
                    text: MyStrings.textWelcom,
                    style: theme.textTheme.titleLarge)),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showEmailBottomSheet(context);
                  },
                  child: SizedBox(
                    width: size.width / 5,
                    child: const Center(
                      child: Text('ثبت نام'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height / 13,
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> showEmailBottomSheet(BuildContext context) {
  var size = MediaQuery.of(context).size;
  var theme = Theme.of(context);
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    controller:
                        Get.find<RegesterController>().emailEditingController,
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
                Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      if (isEmail(Get.find<RegesterController>()
                              .emailEditingController
                              .text) ==
                          true) {
                        Get.find<RegesterController>()
                            .registerEmail(context: context);
                      } else {
                        showErorrSnackBar(
                            message: 'آدرس ایمیل را بدرستی وارد کنید.',
                            title: 'خطا');
                      }
                    },
                    child: SizedBox(
                      width: size.width / 5,
                      child: Get.find<RegesterController>().isLoading.value ==
                              false
                          ? const Center(
                              child: Text('ادامه'),
                            )
                          : const SpinKitThreeInOut(
                              color: Colors.white,
                              size: 20,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Future<dynamic> showActivateCodeBottomSheet(BuildContext context) {
  var size = MediaQuery.of(context).size;
  var theme = Theme.of(context);

  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    controller: Get.find<RegesterController>()
                        .activeCodeEditingController,
                    onChanged: (value) {
                      if (value.length == 6) {
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
                    Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          if (Get.find<RegesterController>()
                                  .activeCodeEditingController
                                  .text
                                  .length ==
                              6) {
                            Get.find<RegesterController>()
                                .verifayCode(context: context);
                          } else {
                            showErorrSnackBar(
                                message: 'کد تایید را به صورت کامل وارد کنید.',
                                title: 'خطا');
                          }
                        },
                        child: SizedBox(
                          width: size.width / 5,
                          child:
                              Get.find<RegesterController>().isLoading.value ==
                                      false
                                  ? const Center(
                                      child: Text('ادامه'),
                                    )
                                  : const SpinKitThreeInOut(
                                      color: Colors.white,
                                      size: 20,
                                    ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showEmailBottomSheet(context);
                          Get.find<RegesterController>()
                              .activeCodeEditingController;
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
