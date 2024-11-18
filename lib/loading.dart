// ignore_for_file: file_names

import "package:flutter/material.dart";

import "utils/routes.dart";
// import "package:flutter/widgets.dart";
// import "package:flutter/widgets.dart";

// ignore: camel_case_types
class lodingpage extends StatelessWidget {
  const lodingpage({super.key});
  void wait(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, myroutes.homeroute);
  }

  @override
  Widget build(BuildContext context) {
    // Execute the wait function after the first frame is built
    Future.microtask(() => wait(context));
    return Material(
        color: const Color.fromARGB(255, 58, 128, 154),
        child: Column(
          children: [
            Image.asset(
              "assets/images/image2.webp",
              height: 500,
              width: 350,
            )
          ],
        )
        );
  }
}
