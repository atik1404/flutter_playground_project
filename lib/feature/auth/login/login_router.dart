import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/core/router/app_routes_name.dart';
import 'package:playground_flutter_project/core/router/base_router.dart';
import 'package:playground_flutter_project/domain/usecase/auth/fetch_profile_api_usecase.dart';
import 'package:playground_flutter_project/domain/usecase/auth/post_login_api_usecase.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_bloc.dart';
import 'package:playground_flutter_project/feature/auth/login/login_screen.dart';

final class LoginRouter extends BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.loginScreen,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => LoginBloc(
            postLoginApiUsecase: di.get<PostLoginApiUsecase>(),
            fetchProfileApiUseCase: di.get<FetchProfileApiUseCase>(),
          ),
          child: const LoginScreen(),
        );
      },
    ),
  ];
}
