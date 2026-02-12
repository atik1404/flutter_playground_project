import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:playground_flutter_project/common/logger/app_logger.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/designsystem/resources/app_icons.dart';
import 'package:playground_flutter_project/designsystem/resources/app_strings.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_bloc.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_event.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_state.dart';
import 'package:playground_flutter_project/ui/components/button/app_filled_button.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';
import 'package:playground_flutter_project/ui/components/textfield/app_filled_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacingSizes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PhoneInput(),
        SpacerBox(height: spacing.lg),
        _PasswordInput(),
        SpacerBox(height: spacing.xl),
        _LoginButton(),
      ],
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return AppFilledTextField(
          labelText: AppStrings.labelPhoneAddress,
          errorText: state.emailValidationError,
          onChanged: (phone) => {
            context.read<LoginBloc>().add(LoginEvent.phoneChanged(phone)),
          },
          hintText: AppStrings.hintPhoneNumber,
          suffixIcon: SvgPicture.asset(
            AppIcons.icPhone,
            colorFilter: ColorFilter.mode(
              context.appColors.primaryContainer,
              BlendMode.srcIn,
            ),
          ),
          keyboardType: TextInputType.phone,
          maxLength: 11,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.obscurePassword != current.obscurePassword ||
          previous.passwordValidationError != current.passwordValidationError,
      builder: (context, state) {
        return AppFilledTextField(
          onChanged: (password) => context.read<LoginBloc>().add(
            LoginEvent.passwordChanged(password),
          ),
          hintText: AppStrings.hintPassword,
          errorText: state.passwordValidationError,
          labelText: AppStrings.labelPassword,
          obscureText: state.obscurePassword,
          suffixIcon: GestureDetector(
            onTap: () => context.read<LoginBloc>().add(
              const LoginEvent.obscurePasswordToggled(),
            ),
            child: SvgPicture.asset(
              AppIcons.icPasswordVisible,
              colorFilter: ColorFilter.mode(
                context.appColors.primaryContainer,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);
    final isLoading = context.select(
      (LoginBloc bloc) => bloc.state.status.isInProgress,
    );

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return AppFilledButton(
          isLoading: isLoading,
          label: AppStrings.actionSignIn,
          width: double.infinity,
          onPressed: () {
            AppLogger.log('Login button pressed');
            context.read<LoginBloc>().add(const LoginEvent.submitted());
          },
        );
      },
    );
  }
}
