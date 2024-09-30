import 'package:flutter/material.dart';

void main() {
  runApp(const MinecraftGuideApp());
}

class MinecraftGuideApp extends StatelessWidget {
  const MinecraftGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minecraft Guide',
      theme: ThemeData(
        primaryColor: const Color(0xFF35363D),
        fontFamily: 'VT323',
      ),
      home: const GuideHome(),
    );
  }
}

class GuideHome extends StatelessWidget {
  const GuideHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/valley.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Header
          SafeArea(
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/pickaxe.svg', width: 40),
                  const Text(
                    'Trees & Wood',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'RetroComputer',
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.account_circle),
                    color: Colors.white,
                    onPressed: () {
                      _showAccountPopup(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          // Main Content
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Big Section: Oak Tree
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF244D3E),
                          Color(0xFFE8FDF5),
                          Color(0xFF324E44),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images/oaktree.png', width: 100),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Oak Tree',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Guide Sections
                  _buildGuideSection(
                    context,
                    'Planks',
                    'assets/images/planks.png',
                    const Color(0xFF324E44),
                    'Description of Planks...',
                  ),
                  _buildGuideSection(
                    context,
                    'Chest',
                    'assets/images/chest.png',
                    const Color(0xFF686868),
                    'Description of Chest...',
                  ),
                  _buildGuideSection(
                    context,
                    'Stick',
                    'assets/images/stick.png',
                    const Color(0xFF686868),
                    'Description of Stick...',
                  ),
                  _buildGuideSection(
                    context,
                    'Stairs',
                    'assets/images/stairs.png',
                    const Color(0xFF686868),
                    'Description of Stairs...',
                  ),
                  // Footer Image
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/trees.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'More about Trees',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'RetroComputer',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAccountPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account Credentials'),
          content: const Text('Your account credentials go here.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGuideSection(
      BuildContext context, String title, String imagePath, Color color, String description) {
    return GestureDetector(
      onTap: () {
        _showDetailsPopup(context, title, description);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 60),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailsPopup(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
