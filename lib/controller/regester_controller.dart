// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_codeblog/components/api_constant.dart';
import 'package:flutter_codeblog/components/storage_key.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/main.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:flutter_codeblog/views/regester_screens/regester_intro.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegesterController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController activeCodeEditingController = TextEditingController();
  RxBool isLoading = false.obs;
  var box = GetStorage();
// user id 261

  registerEmail({BuildContext? context}) async {
    activeCodeEditingController.text = '';
    isLoading.value = true;
    try {
      Map<String, dynamic> inputEmailMap = {
        "email": emailEditingController.text,
        "command": "register"
      };
      var response = await DioService().postMethod(
        map: inputEmailMap,
        url: "${ApiConstant.baseUrl}register/action.php",
      );

      if (response.statusCode == 200 && response.data['response'] == true) {
        isLoading.value = false;
        Navigator.pop(context!);
        showActivateCodeBottomSheet(context);
        box.write(userIdKey, response.data["user_id"]);
      }
    } catch (e) {
      log("#Catch Post register Email => $e");
      isLoading.value = false;
    }
  }

  verifayCode({required BuildContext context}) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> map = {
        "email": emailEditingController.text,
        "user_id": box.read(userIdKey),
        "code": activeCodeEditingController.text,
        "command": "verify"
      };

      var response = await DioService().postMethod(
          map: map, url: "${ApiConstant.baseUrl}register/action.php");
      if (response.statusCode == 200) {
        isLoading.value = false;

        switch (response.data['response']) {
          case 'verified':
            Get.offAllNamed(routeMainScreen);

            box.write(tokenKey, response.data["token"]);
            emailEditingController.text = '';
            activeCodeEditingController.text = '';
            showErorrSnackBar(message: 'ثبت نام شما انجام شد.', title: 'موفق');
            break;
          case 'incorrect_code':
            showErorrSnackBar(
                message: 'کد تایید را به صورت صحیح وارد کنید.', title: 'خطا');
            break;

          case 'expired':
            showErorrSnackBar(message: 'کد تایید منقضی شده است.', title: 'خطا');
            break;
        }
      }
    } catch (e) {
      log("#Catch Post register Email => $e");
      isLoading.value = false;
      showErorrSnackBar(message: 'اتصال اینترنت خود را چک کنید', title: 'خطا');
    }
  }
}
