import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const TreePruningApp());
}

class TreePruningApp extends StatelessWidget {
  const TreePruningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TreeCare Pro - Professional Tree Pruning Services',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.dmSerifTextTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildHeroSection(context),
              _buildServicesSection(context),
              _buildPortfolioSection(context),
              _buildContactSection(context),
              _buildFooter(context),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 80,
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 2,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.nature, color: Colors.green, size: 32),
                  const SizedBox(width: 10),
                  Text(
                    'TreeCare Pro',
                    style: GoogleFonts.dmSerifText(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              if (MediaQuery.of(context).size.width > 768)
                Row(
                  children: [
                    _buildNavButton('Home', () {}),
                    _buildNavButton('Services', () => _scrollToSection(1)),
                    _buildNavButton('Portfolio', () => _scrollToSection(2)),
                    _buildNavButton('Contact', () => _scrollToSection(3)),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => _scrollToSection(3),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                      child: const Text('Free Estimate'),
                    ),
                  ],
                )
              else
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black87),
                  onPressed: () => _showMobileMenu(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Services'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(1);
              },
            ),
            ListTile(
              title: const Text('Portfolio'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(2);
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(3);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final parallaxOffset = _scrollOffset * 0.5;

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, parallaxOffset),
            child: Container(
              height: MediaQuery.of(context).size.height + 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2E7D32),
                    Color(0xFF4CAF50),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Professional Tree Pruning Services',
                    style: GoogleFonts.dmSerifText(
                      fontSize: screenWidth > 768 ? 48 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Expert tree care, pruning, and maintenance for your property',
                    style: GoogleFonts.dmSerifText(
                      fontSize: screenWidth > 768 ? 20 : 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _scrollToSection(3),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text('Get Free Estimate'),
                      ),
                      const SizedBox(width: 20),
                      OutlinedButton(
                        onPressed: () => _scrollToSection(1),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text('Our Services'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Our Services',
            style: GoogleFonts.dmSerifText(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  children: _buildServiceCards().map((card) => Expanded(child: card)).toList(),
                );
              } else {
                return Column(children: _buildServiceCards());
              }
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _buildServiceCards() {
    final services = [
      {
        'icon': Icons.content_cut,
        'title': 'Tree Pruning',
        'description': 'Professional pruning to maintain tree health and appearance',
      },
      {
        'icon': Icons.warning,
        'title': 'Tree Removal',
        'description': 'Safe removal of hazardous or unwanted trees',
      },
      {
        'icon': Icons.medical_services,
        'title': 'Tree Health Care',
        'description': 'Disease treatment and preventive care for your trees',
      },
      {
        'icon': Icons.build,
        'title': 'Emergency Services',
        'description': '24/7 emergency tree services for storm damage',
      },
    ];

    return services.map((service) => Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Icon(
              service['icon'] as IconData,
              size: 48,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              service['title'] as String,
              style: GoogleFonts.dmSerifText(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              service['description'] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    )).toList();
  }

  Widget _buildPortfolioSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Column(
        children: [
          Text(
            'Recent Projects',
            style: GoogleFonts.dmSerifText(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 900 ? 3 : constraints.maxWidth > 600 ? 2 : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) => _buildPortfolioCard(index),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioCard(int index) {
    final titles = [
      'Oak Tree Pruning',
      'Emergency Storm Cleanup',
      'Residential Tree Care',
      'Commercial Landscaping',
      'Tree Health Assessment',
      'Hazardous Tree Removal',
    ];

    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              ),
              child: Center(
                child: Icon(
                  Icons.nature,
                  size: 64,
                  color: Colors.green[600],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              titles[index],
              style: GoogleFonts.dmSerifText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Contact Us',
            style: GoogleFonts.dmSerifText(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildContactForm()),
                    const SizedBox(width: 50),
                    Expanded(child: _buildContactInfo()),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildContactForm(),
                    const SizedBox(height: 50),
                    _buildContactInfo(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get Your Free Estimate',
              style: GoogleFonts.dmSerifText(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Tell us about your project',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Send Message'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get In Touch',
          style: GoogleFonts.dmSerifText(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        _buildContactItem(Icons.phone, '(555) 123-4567', () => _launchPhone('5551234567')),
        _buildContactItem(Icons.email, 'info@treeccarepro.com', () => _launchEmail('info@treecarepro.com')),
        _buildContactItem(Icons.location_on, '123 Tree Street, Green City, ST 12345', () {}),
        _buildContactItem(Icons.access_time, 'Mon-Fri: 7AM-6PM, Sat: 8AM-4PM', () {}),
        const SizedBox(height: 30),
        Text(
          'Why Choose TreeCare Pro?',
          style: GoogleFonts.dmSerifText(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        _buildFeature('✓ Licensed & Insured'),
        _buildFeature('✓ 24/7 Emergency Service'),
        _buildFeature('✓ Free Estimates'),
        _buildFeature('✓ Satisfaction Guaranteed'),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 15),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.black87,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.nature, color: Colors.green, size: 32),
              const SizedBox(width: 10),
              Text(
                'TreeCare Pro',
                style: GoogleFonts.dmSerifText(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© 2024 TreeCare Pro. All rights reserved.',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(int section) {
    double offset = 0;
    switch (section) {
      case 1: // Services
        offset = MediaQuery.of(context).size.height;
        break;
      case 2: // Portfolio
        offset = MediaQuery.of(context).size.height + 600;
        break;
      case 3: // Contact
        offset = MediaQuery.of(context).size.height + 1200;
        break;
    }

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _launchPhone(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}