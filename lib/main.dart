import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const CaloTrekLandingPage());
}

class CaloTrekLandingPage extends StatelessWidget {
  const CaloTrekLandingPage({super.key});

  //AppVersion
  static const appVersion = 'v0.4.75-beta';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaloTrek',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Background full-screen image
            Positioned.fill(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                  'assets/background_landscape.jpg',
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    color: Colors.black.withOpacity(0), // Required for blur to work
                  ),
                ),
                ],
              ),
            ),
            // Overlay content
            Center(
              child: Container(
                height: 500,
                padding: const EdgeInsets.all(24),
                color: Colors.black.withOpacity(0.5), // semi-transparent bg
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          applogo(),
                          titlelogo(),
                          // Play Store button
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Replace with your actual Play Store link
                              launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.appdocdeveloper.calotrek'));
                            },
                            icon: const Icon(Icons.android),
                            
                            label: const Text('Get it on Google Play'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[700],
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              textStyle: const TextStyle(fontSize: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Coming Soon labels
                          // const Text(
                          //   'iOS Coming Soon',
                          //   style: TextStyle(fontSize: 16, color: Colors.white70),
                          // ),
                          // const SizedBox(height: 5),
                          // const Text(
                          //   'Web App Coming Soon',
                          //   style: TextStyle(fontSize: 16, color: Colors.white70),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget applogo(){
    return Column(children: [
          const SizedBox(height: 24),
        // App Logo with BETA Badgeku
        Center(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/CaloTrek_Logo.jpg',
                  height: 120,
                  width: 120,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow:const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: const Text(
                    'BETA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
         // App Motto
        // const Text(
        //   "— Every Meal Counts —",
        //   style: TextStyle(
        //     fontSize: 16,
        //     fontStyle: FontStyle.italic,
        //     fontWeight: FontWeight.w500,
        //     color: Colors.grey,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
        // const SizedBox(height: 12),
        const Padding(padding: EdgeInsets.all(8),
                    child: Text(appVersion,style: TextStyle(
                            fontSize: 10,
                            color: Colors.white54,
                          ),),),
       
        const SizedBox(height: 24),
    ],);
  }

  Widget titlelogo(){
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/calotrek_textisolated.png',
          height: 50,
          width: 200,
          scale: 10,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
