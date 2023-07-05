import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases_ext.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/movie_db_constants.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/auth/auth_model.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: MovieDbConstants.theMovieDbBackground,
            title: const Text(
              MovieDbConstants.theMovieDbAuthAppBar,
            )),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _LoginForm(),
            SizedBox(
              height: 24,
            ),
            _MainContainer(),
          ],
        ));
  }
}

class _MainContainer extends StatelessWidget {
  const _MainContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 16, color: Colors.black);

    return Column(
      children: [
        const Text(MovieDbConstants.theMovieDbHeader1, style: textStyle),
        const SizedBox(
          height: 16,
        ),
        const Text(MovieDbConstants.theMovieDbHeader2, style: textStyle),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              style: MovieDbConstants.baseTheMovieDbButton,
              child: const Text(MovieDbConstants.theMovieDbRegister),
            ),
            const SizedBox(
              width: 24,
            ),
            TextButton(
              onPressed: () {},
              style: MovieDbConstants.baseTheMovieDbButton,
              child: const Text(MovieDbConstants.theMovieDbVerifyEmail),
            )
          ],
        )
      ],
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessage(),
        Text(
          MovieDbConstants.theMovieDbUsername,
          style: BaseTextStyle.baseSimilarText(Colors.black),
        ),
        TextField(
          decoration: MovieDbConstants.authInputDecoration,
          controller: model?.usernameTextController,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          MovieDbConstants.theMovieDbPassword,
          style: BaseTextStyle.baseSimilarText(Colors.black),
        ),
        TextField(
          decoration: MovieDbConstants.authInputDecoration,
          obscureText: true,
          controller: model?.passwordTextController,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            _AuthButton(),
            const SizedBox(width: 24),
            TextButton(
                style: MovieDbConstants.baseTheMovieDbLinkButton,
                onPressed: () {},
                child: const Text(
                  MovieDbConstants.theMovieDbResetPassword,
                )),
          ],
        )
      ],
    );
  }
}

class _AuthButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final Widget child;
    child = model?.isAuthInProgress == true
        ? MovieDbConstants.loadingButton
        : const Text(MovieDbConstants.theMovieDbLogin);
    return ElevatedButton(
        style: MovieDbConstants.baseTheMovieDbButton,
        onPressed: onPressed,
        child: child);
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage();

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child:
          Text(errorMessage, style: BaseTextStyle.baseSimilarText(Colors.red)),
    );
  }
}
