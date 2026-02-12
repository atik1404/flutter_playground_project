import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:playground_flutter_project/common/logger/app_toast.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_bloc.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_state.dart';
import 'package:playground_flutter_project/feature/auth/login/widgets/login_footer.dart';
import 'package:playground_flutter_project/feature/auth/login/widgets/login_form.dart';
import 'package:playground_flutter_project/feature/auth/login/widgets/login_header.dart';
import 'package:playground_flutter_project/ui/components/app_scaffold.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final spacing = context.spacingSizes;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          AppToast.toast(
            message: state.toastMessage,
            toastType: ToastType.error,
          );
        }
      },
      child: AppScaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;

            return Center(
              child: SingleChildScrollView(
                padding: AppSpacing.horizontal(spacing.lg),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isWide ? 400 : double.infinity,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SpacerBox(height: spacing.lg),
                      const LoginHeader(),
                      SpacerBox(height: spacing.xl),
                      const LoginForm(),
                      SpacerBox(height: spacing.xxl),
                      const LoginFooter(),
                      SpacerBox(height: spacing.lg),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
