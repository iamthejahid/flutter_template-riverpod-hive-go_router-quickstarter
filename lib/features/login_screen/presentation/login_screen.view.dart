import 'package:app_ui/app_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/features/home_page/presentation/home_page.dart';

class LoginScreen extends HookConsumerWidget {
  static String get name => '/loginScreen';
  static String get path => '/loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final phoneNumberController = useTextEditingController(text: "");

    final phoneNumberControllerKey =
        useMemoized(() => GlobalKey<FormFieldState<String>>());

    final passwordController = useTextEditingController(text: "");

    final passwordControllerKey =
        useMemoized(() => GlobalKey<FormFieldState<String>>());

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            gap72,
            gap72,
            AppTextField(
              controller: phoneNumberController,
              key: phoneNumberControllerKey,
              hintText: 'Phone Number',
              keyboardType: TextInputType.phone,
              labelText: "Phone Number",
            ),
            gap16,
            AppTextField(
              controller: passwordController,
              key: passwordControllerKey,
              hintText: 'Phone Number',
              keyboardType: TextInputType.phone,
              labelText: "Phone Number",
            ),
            gap72,
            KRightElevatedButtonIcon(
              onPressed: () => context.goNamed(HomeScreen.name),
              buttonName: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
