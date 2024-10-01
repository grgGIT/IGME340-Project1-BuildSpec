import 'package:flutter/material.dart';

const String loremIpsumText = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget turpis in urna aliquam fermentum. Etiam sit amet velit sit amet purus viverra dictum. Sed ultricies nunc sed augue laoreet, quis malesuada dolor vehicula.

Pellentesque tincidunt, magna vel interdum convallis, velit felis vulputate leo, nec consequat ligula sapien nec libero. Nam malesuada ligula sed odio egestas, vel suscipit nulla suscipit. Praesent vehicula arcu eu interdum lobortis.

Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi dapibus, elit vitae malesuada tempus, orci urna efficitur mauris, sit amet elementum nunc libero et felis. Curabitur viverra risus sed tortor dictum volutpat.
""";

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
                image: AssetImage('flutter_design_to_spec_assets/assets/images/valley.jpg'),
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
                  Image.asset('flutter_design_to_spec_assets/assets/images/pickaxe.svg', width: 40),
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
          Expanded(
            // top: 100,
            // left: 16,
            // right: 16,
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
                        Image.asset('flutter_design_to_spec_assets/assets/images/oaktree.png', width: 500),
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
                    'flutter_design_to_spec_assets/assets/images/planks.png',
                    const Color(0xFF686868),
                    loremIpsumText,
                  ),
                  _buildGuideSection(
                    context,
                    'Chest',
                    'flutter_design_to_spec_assets/assets/images/chest.png',
                    const Color(0xFF686868),
                    loremIpsumText,
                  ),
                  _buildGuideSection(
                    context,
                    'Stick',
                    'flutter_design_to_spec_assets/assets/images/stick.png',
                    const Color(0xFF686868),
                    loremIpsumText,
                  ),
                  _buildGuideSection(
                    context,
                    'Stairs',
                    'flutter_design_to_spec_assets/assets/images/stairs.png',
                    const Color(0xFF686868),
                    loremIpsumText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideSection(
    BuildContext context, 
    String title, 
    String imagePath, 
    Color color, 
    String description,
  ) {
    return GestureDetector(
      onTap: () {
        _showDetailsPopup(context, title, imagePath, color, description);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Left Side: Framed Image
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFF244D3E), // Frame color
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(imagePath, width: 60),
            ),
            // Right Side: Title and Scrollable Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    child: Text(
                      description,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailsPopup(BuildContext context, String title, String imagePath, Color color, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero, // Removes default padding
          content: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF686868), // Gray outer box
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Item name (title) at the top
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Green background around the image
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: color, // Green background color (same as the section)
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(imagePath, width: 100),
                ),
                
                const SizedBox(height: 16),
                
                // White bordered box for description text
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black, // Black text in the white box
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
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

  void _showAccountPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About'),
          content: const Text(
            'Created by Geoff Gracia\n\n'
            'Based on the work in 235\n\n'
            'September 2024',
          ),
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
