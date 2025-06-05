import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  final Uri _githubUrl = Uri.parse('https://github.com/yourusername/yourrepo');

  void _launchGitHub() async {
    if (!await launchUrl(_githubUrl)) {
      throw 'Could not launch $_githubUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Light purple background
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
        backgroundColor: const Color(0xFFBA68C8), // Purple app bar
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/app_icon.png', width: 100),
              const SizedBox(height: 20),
              const Text(
                'Developed by:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Farhan Izazul\n2023371819\nCDCS251\nSARJANA MUDA SAINS KOMPUTER (KEPUJIAN) PENGKOMPUTERAN NETSENTRIK',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              const Text(
                '© 2025 UiTM Arau, Perlis',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              TextButton.icon(
                icon: const Icon(Icons.link, color: Colors.deepPurple),
                label: const Text(
                  'View on GitHub',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: _launchGitHub,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
