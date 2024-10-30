import 'package:flutter/material.dart';
import 'package:memoirverse/features/user/signin/widget/password_signin.dart';
import 'package:memoirverse/features/user/signin/widget/signin.dart';
import 'package:memoirverse/features/user/signin/widget/signup.dart';
import 'package:memoirverse/features/user/signin/widget/sms_signin.dart';
import 'package:memoirverse/features/user/signin/widget/user_info.dart';
import 'package:memoirverse/services/UserService.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    int signin_type = context.watch<UserService>().signin_type;
    if (signin_type == 0 || signin_type == 1) {
      return SignIn();
    } else if (signin_type == 2) {
      return SignUp();
    } else if (signin_type == 3) {
      return UserInfo();
    }
    return Container();
  }
}
