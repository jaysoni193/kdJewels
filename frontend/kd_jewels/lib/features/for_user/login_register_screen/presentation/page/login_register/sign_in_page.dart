import 'package:flutter/material.dart';
import 'package:kd_jewels/core/extensions/snackbar_extension.dart';
import '../../../../../../core/constants/app_loader.dart';
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
              context.showSuccessSnackbar("Success");
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
