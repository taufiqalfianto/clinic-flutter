import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../dashboard/page/dashboard_page.dart';
import '../bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validate() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            // LEFT CONTENT
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SpaceHeight(80.0),
                      const Center(
                        child: Text(
                          'Masuk Staff',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SpaceHeight(30.0),
                      CustomTextField(
                        labeltext: 'Nomor Ponsel atau Email',
                        controller: emailController,
                        label: 'Nomor Ponsel atau Email',
                      ),
                      const SpaceHeight(20.0),
                      CustomTextField(
                        labeltext: 'Kata Sandi',
                        controller: passwordController,
                        label: 'Kata Sandi',
                        // obscureText: true,
                      ),
                      const SpaceHeight(40.0),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            error: (message) {
                              return showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                  message:
                                      "Something went wrong. Please check your credentials and try again",
                                ),
                              );
                            },
                            succes: (data) {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.success(
                                  message: "Login Succes !!!",
                                ),
                              );
                              return Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashboardPage(),
                                ),
                              );
                            },
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return Button.filled(
                                onPressed: () {
                                  if (validate()) {
                                    context.read<LoginBloc>().add(
                                          LoginEvent.login(
                                            emailController.text,
                                            passwordController.text,
                                          ),
                                        );
                                  } else
                                    (showTopSnackBar(
                                      Overlay.of(context),
                                      CustomSnackBar.error(
                                        message: "All fields are required",
                                      ),
                                    ));
                                },
                                label: 'MASUK',
                              );
                            },
                            loading: () {
                              return Center(
                                  child: const CircularProgressIndicator());
                            },
                          );
                        },
                      ),
                      const SpaceHeight(20.0),
                      const SpaceHeight(100.0),
                      const Text(
                        '© 2024 FIC 15 | CWB CLINIC',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // RIGHT CONTENT
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: context.deviceWidth,
                  height: context.deviceHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                    image: DecorationImage(
                      image: Assets.images.splashScreen.provider(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 67.0, right: 15.0, left: 120.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Embark on efficiency with a single click, discover the seamless world of clinic management!',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        const SpaceHeight(50.0),
                        Flexible(child: Assets.images.dokterku.image()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
