import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kartal/kartal.dart';
import 'package:myproject/feature/login/viewmodel/login_view_model.dart';
import 'package:myproject/feature/product/constant/image_enum.dart';
import 'package:myproject/feature/product/padding/padding.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String login = "Login";

  final String data = "Login";

  final String rememberMe = "Remember me";

  late final LoginViewModel _loginViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return _bodyView(context);
      },
    );
  }

  Scaffold _bodyView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          children: [
            AnimatedContainer(
              duration: context.durationLow,
              child: SizedBox(
                height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.2),
                width: context.dynamicWidth(0.3),
                child: Image.asset(ImageEnums.door.path),
              ),
            ),
            Text(
              login,
              style: context.textTheme.headline3,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Center(
                child: Text(data),
              ),
            ),
            CheckboxListTile(
              value: context.watch<LoginViewModel>().isCheckBoxOkay,
              title: Text(rememberMe),
              onChanged: (value) {
                context.read<LoginViewModel>().checkBoxChange(value ?? false);
              },
            )
          ],
        ),
      ),
    );
  }
}
