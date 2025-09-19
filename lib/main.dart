import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const TreePruningApp()); // Removed portfolio, using required images
}

class TreePruningApp extends StatelessWidget {
  const TreePruningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TreeCare Pro - Professional Tree Pruning Services',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.openSansTextTheme(),
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
              _buildContactSection(context),
              _buildFooter(context),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final scrollProgress = (_scrollOffset / 200).clamp(0.0, 1.0);
    final backgroundColor = Color.lerp(
      Colors.white.withOpacity(0.95),
      Colors.white,
      scrollProgress,
    )!;
    final elevation = scrollProgress * 8;

    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      pinned: true,
      snap: true,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shadowColor: Colors.black26,
      forceElevated: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: EdgeInsets.zero,
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.9),
                Colors.white,
              ],
            ),
          ),
        ),
        title: Container(
          height: kToolbarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo and company name
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: 28 + (6 * (1 - scrollProgress)),
                          width: 28 + (6 * (1 - scrollProgress)),
                          child: SvgPicture.asset(
                            'assets/images/logo.svg',
                            height: 28 + (6 * (1 - scrollProgress)),
                            width: 28 + (6 * (1 - scrollProgress)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            style: GoogleFonts.openSans(
                              fontSize: 18 + (3 * (1 - scrollProgress)),
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            child: const Text(
                              'TreeCare Pro',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Navigation menu
                  if (MediaQuery.of(context).size.width > 768)
                    Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (constraints.maxWidth > 900) ...[
                            _buildNavButton('Home', () {}, scrollProgress),
                            _buildNavButton('Services', () => _scrollToSection(1), scrollProgress),
                            _buildNavButton('Contact', () => _scrollToSection(2), scrollProgress),
                            const SizedBox(width: 16),
                          ],
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            child: ElevatedButton(
                              onPressed: () => _scrollToSection(2),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16 + (6 * (1 - scrollProgress)),
                                  vertical: 10 + (2 * (1 - scrollProgress)),
                                ),
                                elevation: 2 + (2 * (1 - scrollProgress)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Free Estimate',
                                style: TextStyle(
                                  fontSize: 13 + (1 * (1 - scrollProgress)),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black87,
                          size: 22 + (3 * (1 - scrollProgress)),
                        ),
                        onPressed: () => _showMobileMenu(context),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(String text, VoidCallback onPressed, double scrollProgress) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 12 + (4 * (1 - scrollProgress)),
            vertical: 8 + (2 * (1 - scrollProgress)),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 14 + (1 * (1 - scrollProgress)),
          ),
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
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(2);
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Firefly_Generate images of tree cutting near a domestic neighbourhood 29638.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.green.withOpacity(0.3),
                ],
              ),
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
                    style: GoogleFonts.openSans(
                      fontSize: screenWidth > 768 ? 48 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Expert tree care, pruning, and maintenance for your property',
                    style: GoogleFonts.openSans(
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
                        onPressed: () => _scrollToSection(2),
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
    return Column(
      children: [
        // Services Header
        Container(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  'Our Professional Services',
                  style: GoogleFonts.openSans(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
        // Individual Service Sections
        _buildServiceParallaxSection(
          title: 'Professional Tree Pruning',
          description: 'Expert pruning techniques to enhance tree health, promote proper growth, and maintain aesthetic appeal. Our certified arborists understand the unique needs of each tree species.',
          features: [
            'Crown thinning and shaping',
            'Deadwood removal',
            'Structural pruning',
            'Seasonal timing optimization'
          ],
          imagePath: 'assets/images/img1.png',
          imageOnLeft: true,
        ),
        _buildServiceParallaxSection(
          title: 'Safe Tree Removal',
          description: 'When trees become hazardous or need to be removed, our team ensures safe, efficient removal with minimal impact to your property and surrounding landscape.',
          features: [
            'Hazardous tree assessment',
            'Precision cutting techniques',
            'Complete stump grinding',
            'Debris cleanup and disposal'
          ],
          imagePath: 'assets/images/img2.png',
          imageOnLeft: false,
        ),
        _buildServiceParallaxSection(
          title: 'Tree Health & Disease Management',
          description: 'Comprehensive tree health services including disease diagnosis, treatment, and preventive care to ensure your trees remain healthy and vibrant year-round.',
          features: [
            'Disease identification and treatment',
            'Pest management solutions',
            'Soil analysis and fertilization',
            'Tree health monitoring'
          ],
          imagePath: 'assets/images/img3.png',
          imageOnLeft: true,
        ),
        _buildServiceParallaxSection(
          title: '24/7 Emergency Services',
          description: 'Storm damage and emergency tree situations require immediate attention. Our emergency response team is available around the clock to address urgent tree safety concerns.',
          features: [
            'Storm damage cleanup',
            'Emergency tree removal',
            'Power line clearance',
            'Insurance claim assistance'
          ],
          imagePath: 'assets/images/Firefly_Generate images of tree pruning, cutting, trimming, and lawn mowing 949191.jpg',
          imageOnLeft: false,
        ),
      ],
    );
  }

  Widget _buildServiceParallaxSection({
    required String title,
    required String description,
    required List<String> features,
    required String imagePath,
    required bool imageOnLeft,
  }) {
    return Container(
      height: 600,
      margin: const EdgeInsets.symmetric(vertical: 20),
      clipBehavior: Clip.hardEdge, // Prevent overflow
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate parallax offset relative to this specific section
          final parallaxOffset = (_scrollOffset * 0.1).clamp(-50.0, 50.0);
          // Fixed opacity for gradient overlay (not tied to global scroll)
          const gradientOpacity = 0.85;

          return Stack(
            clipBehavior: Clip.hardEdge, // Ensure content stays within bounds
            children: [
              // Parallax Background Image
              Positioned.fill(
                child: ClipRect( // Clip the image to container bounds
                  child: Transform.translate(
                    offset: Offset(0, parallaxOffset),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: imageOnLeft ? Alignment.centerRight : Alignment.centerLeft,
                            end: imageOnLeft ? Alignment.centerLeft : Alignment.centerRight,
                            colors: [
                              Colors.white.withOpacity(gradientOpacity),
                              Colors.white.withOpacity(gradientOpacity * 0.8),
                              Colors.white.withOpacity(gradientOpacity * 0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Content
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                  child: constraints.maxWidth > 768
                      ? Row(
                          children: imageOnLeft
                              ? [
                                  const Expanded(flex: 1, child: SizedBox()),
                                  Expanded(flex: 1, child: _buildServiceContent(title, description, features, 1.0)),
                                ]
                              : [
                                  Expanded(flex: 1, child: _buildServiceContent(title, description, features, 1.0)),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                        )
                      : Center(
                          child: _buildServiceContent(title, description, features, 1.0),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildServiceContent(String title, String description, List<String> features, double opacity) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.openSans(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: GoogleFonts.openSans(
                fontSize: 16,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _scrollToSection(2),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: Text(
                'Get Free Estimate',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
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
            style: GoogleFonts.openSans(
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
              style: GoogleFonts.openSans(
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
          style: GoogleFonts.openSans(
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
          style: GoogleFonts.openSans(
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
              SvgPicture.asset(
                'assets/images/logo.svg',
                height: 32,
                width: 32,
                colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
              ),
              const SizedBox(width: 10),
              Text(
                'TreeCare Pro',
                style: GoogleFonts.openSans(
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