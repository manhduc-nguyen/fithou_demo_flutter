import 'package:fithou_demo/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginCubit _loginCubit = LoginCubit();
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  void _handleListener(_, newState) {
    if (newState is LoginSuccessState) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login success'),
      ));
      return;
    }
    if (newState is LoginFailureState) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failure'),
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
          listener: _handleListener,
          bloc: _loginCubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 30, right: 30),
              child: ListView(
                children: [
                  const Center(
                      child: Text(
                    'FITHOU',
                    style: TextStyle(fontSize: 40, color: Colors.blueAccent),
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: TextField(
                      controller: _userNameTextController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: TextField(
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (state is LoginLoadingState)
                    _loadingWidget()
                  else
                    TextButton(
                        onPressed: () {
                          _loginCubit.login(_userNameTextController.text,
                              _passwordTextController.text);
                        },
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 14)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blueAccent)),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ))
                ],
              ),
            );
          }),
    );
  }

  Widget _loadingWidget() => const Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
      );
}
