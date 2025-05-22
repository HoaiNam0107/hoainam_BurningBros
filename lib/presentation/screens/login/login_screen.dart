import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/login_repository_impl.dart';
import '../../../data/sources/remote/login_remote_data_source.dart';
import 'login_form.dart';
import 'footer.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginRepositoryImpl>(
          create: (_) => LoginRepositoryImpl(LoginRemoteDataSourceImpl()),
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/login.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Gradient overlay
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.87),
                    Colors.greenAccent
                  ],
                  stops: const [0.0, 0.3, 1.0],
                ),
              ),
            ),
            // Login form
            Align(
              alignment: const Alignment(0.0, 1),
              child: const LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}