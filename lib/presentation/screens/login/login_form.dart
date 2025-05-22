import 'package:burning_test/presentation/screens/login/text_efbook.dart';
import 'package:burning_test/presentation/screens/login/text_form_field_default.dart';
import 'package:burning_test/presentation/screens/login/text_form_field_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/login_repository_impl.dart';
import '../../../domain/usecases/login_use_case.dart';
import '../../bloc/product/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginUseCase(
        RepositoryProvider.of<LoginRepositoryImpl>(context),
      )),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, '/productList');
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 30, top: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // text
                const TextEfbook(),
                const SizedBox(height: 20),

                // user
                TextFormFieldDefault(
                  controller: _usernameController,
                  hintText: 'Tên đăng nhập',
                ),
                SizedBox(
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.16,
                ),

                // pass
                TextFormFieldWidgets(
                  controller: _passwordController,
                  hintText: 'Mật khẩu',
                ),
                const SizedBox(height: 10),

                // button
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_usernameController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          context.read<LoginBloc>().add(
                                LoginSubmitted(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Vui lòng nhập đầy đủ thông tin"),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
