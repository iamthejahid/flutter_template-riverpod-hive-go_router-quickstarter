import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    required this.state,
    super.key,
  });
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: GlobalColor.textDanger,
        //color Changed Here
        title: const Text(
          'Something went wrong!',
          // style: CustomTextStyles.appBarText,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                'Error log: ${state.error}',
                // style: CustomTextStyles.style1TextDanger,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
