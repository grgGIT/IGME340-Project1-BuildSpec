import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          // Taskbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFFA19FA2), // Taskbar color
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('flutter_design_to_spec_assets/assets/images/pickaxe.svg', width: 10),
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
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 90), // Add padding to account for the fixed taskbar
            child: Column(
              children: [
                // Oak Tree Section
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      // Gradient Background
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF244D3E),
                              Color(0xFFE8FDF5),
                              Color(0xFF324E44),
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white, // White border color
                            width: 2.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            // Oak Tree Image
                            Image.asset('flutter_design_to_spec_assets/assets/images/oaktree.png', width: 500),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                          ],
                        ),
                      ),
                      // Gray Box for Description
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF686868), // Gray box
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              'Oak Tree',
                              style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'RetroComputer',
                            ),
                            ),
                             SizedBox(height: 8), // Add space between title and description
                            Text(
                              loremIpsumText,
                              style:  TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'VT323'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 200), // Space between Oak Tree section and other content
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

                // New image section with text on top and bottom of image
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Stack(
                    alignment: Alignment.center, // Center the text on the image
                    children: [
                      // Image with adaptable size
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8), // Rounded corners for the image
                        child: Image.asset(
                          'flutter_design_to_spec_assets/assets/images/trees.jpg',
                          width: double.infinity,
                          height: 300, 
                          fit: BoxFit.cover, // Cover entire area while maintaining aspect ratio
                        ),
                      ),
                      // Text Overlay on top of the image
                      Positioned(
                        top: 16, // Text at the top of the image
                        left: 16,
                        right: 16,
                        child: Text(
                          'Trees are pretty cool. \n Right?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RetroComputer',
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 1), // Add shadow for readability
                                blurRadius: 6.0,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Text Overlay at the bottom of the image
                      Positioned(
                        bottom: 16, // Text at the bottom of the image
                        left: 16,
                        right: 16,
                        child: Text(
                          'Copyright 2024. \n RIT school of interactive games and media?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'RetroComputer',
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 1),
                                blurRadius: 6.0,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                border: Border.all(
                  color: Colors.white, // White border color
                  width: 2.0, // Border width
                ),
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 12,
                      fontFamily: 'RetroComputer',
                    ),
                  ),
                  const SizedBox(height: 20), // Space between image and text
                  Image.asset(imagePath, width: 60),
                ],
              ),
            ),
            // Right Side: Scrollable Description
            Expanded(
              child: SizedBox(
                height: 100, // Set a fixed height for scrolling
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'RetroComputer'),
                  ),
                ),
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
        contentPadding: EdgeInsets.zero,
        backgroundColor: const Color(0xFF686868), // Removes default padding
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
                  fontFamily: 'RetroComputer',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),

              // Green background around the image
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF324D44),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 400,
                    fit: BoxFit.cover, // Ensure the image fits within the container
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Scrollable description text
              SizedBox(
                height: 200, // Set a fixed height for the scrollable text
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // White background
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'RetroComputer',
                        color: Colors.black, // Black text in the white box
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Add padding to the button
            decoration: BoxDecoration(
              color: Colors.white, // White background for the button
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  fontFamily: 'RetroComputer',
                  fontSize: 13,
                ),
              ),
            ),
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
        title: const Text('About',
        style: TextStyle(
            fontFamily: 'RetroComputer', 
            fontSize: 20, 
          ),),
        
        content: const Text(
          'Created by Geoff Gracia\n\n'
          'Based on the work done in 235s design to spec homework\n\n'
          'September 2024',
          style: TextStyle(
            fontFamily: 'RetroComputer', 
            fontSize: 14, 
          ),
          textAlign: TextAlign.center, 
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok',
            style: TextStyle(
            fontFamily: 'RetroComputer', 
            fontSize: 11, 
          ),),
          ),
        ],
      );
    },
  );
}
}