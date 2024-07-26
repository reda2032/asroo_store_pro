import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';

class TestOneScreen extends StatelessWidget {
  const TestOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pushName(AppRoutes.testTwo);
          },
          child: const Text(
            'Go Two Screen',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
