import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 45.0,left: 16,right: 16),
        child: Column(
          children: [
            TextFormField(
              controller: _searchTEController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                ),

                prefixIcon: Icon(Icons.search)
              ),

            )
          ],
        ),
      ),
    );
  }
}
