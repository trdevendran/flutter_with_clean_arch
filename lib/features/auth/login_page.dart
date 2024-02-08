import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/core/ui/styles/app_colors.dart';
import 'package:flutter_poc/core/ui/styles/text_styles.dart';
import 'package:flutter_poc/core/util/alert_dialog_helper.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/constants.dart';
import '../../core/ui/styles/button_styles.dart';
import '../../core/ui/widgets/custom_text_field/custom_text_field.dart';
import '../../core/ui/widgets/gradiant_background.dart';
import '../../features/auth/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        /// To avoid using context within the asynchronous part of the code
        final currentContext = context;
        if (state is AuthSuccessState) {
          currentContext.go("/home");
        } else if (state is LoginState && state.message.isNotEmpty) {
          await AlertDialogHelper.showAlert(context, state.message);
          currentContext.read<AuthBloc>().add(const AcknowledgeToAlert());
        }
      },
      listenWhen: (previousState, currentState) =>
          previousState != currentState,
      builder: (context, state) => Scaffold(
        body: GradiantBackground(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: AppColors.loginBackground,
            spots: const [
              0.3,
              0.6,
              1,
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Log In",
                        style: TextStyles.largeTitle2,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                          hint: "Email",
                          type: TextInputType.emailAddress,
                          onChanged: (text) => context
                              .read<AuthBloc>()
                              .add(UserNameTextChanged(text))),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        obscureText: true,
                        hint: "Password",
                        type: TextInputType.visiblePassword,
                        onChanged: (text) => context
                            .read<AuthBloc>()
                            .add(PasswordTextChanged(text)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(const LoginEvent());
                            },
                            style: ButtonStyles.loginButtonStyle,
                            child: Text(
                              Constants.login,
                              style: TextStyles.title2,
                            ),
                          ))
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            Constants.forgotPassword,
                            style: TextStyles.forgotPasswordTextStyle,
                          )),
                    ],
                  )
                ],
                // )),
                // ),
              ),
            )),
      ),
    );
  }
}
