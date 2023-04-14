import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_loader.dart';
import '../../../home/route_paths.dart';

class ESplashScreen extends StatelessWidget {
  const ESplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 1 != 1
            ? const CircularProgressIndicator.adaptive()
            : StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (ctx, data) {
                  if (data.connectionState == ConnectionState.waiting) {
                    return const ECircularProgress();
                  } else if (data.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) => Navigator.pushReplacementNamed(
                        context,
                        ERoutePaths.dashboard,
                      ),
                    );
                    return const CircularProgressIndicator.adaptive();
                  } else {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) => Navigator.pushReplacementNamed(
                        context,
                        ERoutePaths.dashboard,
                      ),
                    );
                    return Container();
                  }
                }),
      ),
    );
  }
}
