import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            CustomHeader(title: 'Inicio'),
            Expanded(child: Center(child: Text('Contenido Home'))),
          ],
        ),
      ),
    );
  }
}
