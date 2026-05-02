import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/extensions/snackbar_extension.dart';
import '../../../../../for_admin/admin_dashboard/presentation/page/admin_dashboard/admin_dashboard_page.dart';
import '../../../../dashboard/presentation/page/dashboard/dashboard_page.dart';
import '../../../../../../core/constants/app_loader.dart';
import '../../../../../../core/utils/secure_preference_manager.dart';
import '../../bloc/login_register_bloc/login_register_bloc.dart';
import '../login_register_widgets/sign_in_body_widget.dart';
import '../login_register_widgets/sign_in_app_bar_widget.dart';
import '../../../../../../core/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  LoginRegisterBloc? loginRegisterBloc;
  bool isLoading = false;

  @override
  void initState() {
    loginRegisterBloc = context.read<LoginRegisterBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondPrimaryColor,
        appBar: signInAppBarWidget(context),
        body: BlocConsumer<LoginRegisterBloc, LoginRegisterState>(
          listener: (context, state) {
            if (state is LoadingState) {
              if (state.isLoading ?? false) {
                showLoader();
                isLoading = state.isLoading!;
              } else {
                hideLoader();
                isLoading = false;
              }
            }
            if (state is LoginSuccessState) {
              navigateToNextPage(context, state);
            }
          },
          builder: (context, state) {
            return SignInBodyWidget(loginRegisterBloc: context.read<LoginRegisterBloc>());
          },
        ),
      ),
    );
  }
}

Future<void> navigateToNextPage(BuildContext context, LoginSuccessState state) async {
  if (state.signInModel.success == true) {
    if (state.signInModel.user?.role == "admin") {
      await SecurePreferenceManager.saveData(AppStrings.authToken, state.signInModel.token);
      context.showSuccessSnackbar(state.signInModel.message ?? AppStrings.loginSuccessfullyMassage);
      context.pushAndRemoveAll(AdminDashboardPage());
    } else {
      await SecurePreferenceManager.saveData(AppStrings.authToken, state.signInModel.token);
      context.showSuccessSnackbar(state.signInModel.message ?? AppStrings.loginSuccessfullyMassage);
      context.pushAndRemoveAll(DashboardPage());
    }
  } else {
    context.showErrorSnackbar(state.signInModel.message ?? AppStrings.somethingWentWrongMassage);
  }
}
