import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/assets.dart';
import 'package:furni_move/view/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAnimate = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isAnimate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(MyAssets.logo),
            const SizedBox(height: 100),
            SizedBox(
              height: 500,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    left: isAnimate ? 70 : 0,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(seconds: 3),
                    onEnd: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.welcomeRoute);
                    },
                    child: Image.asset(
                      MyAssets.logo,
                      width: 250,
                      height: 250,
                    ),
                  ),
                  AnimatedPositioned(
                      bottom: isAnimate ? 140 : 0,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(seconds: 3),
                      onEnd: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.welcomeRoute);
                      },
                      child: Text(
                        'FurniMove',
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
