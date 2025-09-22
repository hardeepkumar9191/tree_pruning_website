import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Professional color system for TreeCare Pro
class AppColors {
  // Primary green palette
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color accentGreen = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFFE8F5E8);
  static const Color darkGreen = Color(0xFF1B5E20);

  // Accent colors
  static const Color primaryRed = Color(0xFFD32F2F);
  static const Color accentRed = Color(0xFFE57373);

  // Neutral palette
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFEEEEEE);
  static const Color neutral300 = Color(0xFFE0E0E0);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral600 = Color(0xFF757575);
  static const Color neutral700 = Color(0xFF616161);
  static const Color neutral800 = Color(0xFF424242);
  static const Color neutral900 = Color(0xFF212121);

  // Surface colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF7F7F7);
  static const Color surfaceContainer = Color(0xFFF3F3F3);
}

void main() {
  runApp(const TreePruningApp()); // Tree pruning app - fully responsive with scrollable content
}

class TreePruningApp extends StatelessWidget {
  const TreePruningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TreeCare Pro - Professional Tree Pruning Services',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryGreen,
          brightness: Brightness.light,
          primary: AppColors.primaryGreen,
          secondary: AppColors.accentGreen,
          tertiary: AppColors.darkGreen,
          surface: AppColors.surface,
          surfaceVariant: AppColors.surfaceVariant,
          surfaceContainer: AppColors.surfaceContainer,
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          displayLarge: GoogleFonts.inter(
            fontSize: 57,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.25,
          ),
          displayMedium: GoogleFonts.inter(
            fontSize: 45,
            fontWeight: FontWeight.w400,
          ),
          displaySmall: GoogleFonts.inter(
            fontSize: 36,
            fontWeight: FontWeight.w400,
          ),
          headlineLarge: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.43,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.33,
          ),
          labelLarge: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 1,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            side: const BorderSide(width: 1.5),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surfaceContainer,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.neutral300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
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
      AppColors.surface.withOpacity(0.95),
      AppColors.surface,
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
      shadowColor: AppColors.neutral400,
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
                AppColors.surface.withOpacity(0.9),
                AppColors.surface,
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
                            style: GoogleFonts.inter(
                              fontSize: 18 + (3 * (1 - scrollProgress)),
                              fontWeight: FontWeight.bold,
                              color: AppColors.neutral800,
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
                                backgroundColor: AppColors.primaryGreen,
                                foregroundColor: AppColors.surface,
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
                          color: AppColors.neutral800,
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
            color: AppColors.neutral800,
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
                  AppColors.neutral900.withOpacity(0.4),
                  AppColors.primaryGreen.withOpacity(0.3),
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
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: screenWidth > 768 ? 48 : 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.surface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Expert tree care, pruning, and maintenance for your property',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: screenWidth > 768 ? 20 : 16,
                      color: AppColors.surface.withOpacity(0.7),
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
                          backgroundColor: AppColors.primaryRed,
                          foregroundColor: AppColors.surface,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text('Get Free Estimate'),
                      ),
                      const SizedBox(width: 20),
                      OutlinedButton(
                        onPressed: () => _scrollToSection(1),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.surface,
                          side: BorderSide(color: AppColors.surface),
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
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColors.neutral800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
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
      margin: const EdgeInsets.symmetric(vertical: 20),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate parallax offset relative to this specific section
          final parallaxOffset = (_scrollOffset * 0.1).clamp(-50.0, 50.0);
          // Fixed opacity for gradient overlay
          const gradientOpacity = 0.85;

          return Container(
            constraints: BoxConstraints(
              minHeight: (MediaQuery.of(context).size.height * 0.4).clamp(300.0, 600.0),
            ),
            child: Stack(
              children: [
                // Parallax Background Image
                Positioned.fill(
                  child: ClipRect(
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
                                AppColors.surface.withOpacity(gradientOpacity),
                                AppColors.surface.withOpacity(gradientOpacity * 0.8),
                                AppColors.surface.withOpacity(gradientOpacity * 0.3),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Content with dynamic sizing
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: (constraints.maxWidth * 0.05).clamp(16.0, 40.0),
                    vertical: (MediaQuery.of(context).size.height * 0.05).clamp(20.0, 60.0),
                  ),
                  child: constraints.maxWidth > 768
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: imageOnLeft
                              ? [
                                  const Expanded(flex: 1, child: SizedBox()),
                                  Expanded(
                                    flex: 1,
                                    child: _buildServiceContent(title, description, features, 1.0),
                                  ),
                                ]
                              : [
                                  Expanded(
                                    flex: 1,
                                    child: _buildServiceContent(title, description, features, 1.0),
                                  ),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                        )
                      : _buildServiceContent(title, description, features, 1.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceContent(String title, String description, List<String> features, double opacity) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        // Dynamic sizing based on screen dimensions
        final isSmallScreen = screenWidth < 768;
        final isMediumScreen = screenWidth >= 768 && screenWidth < 1200;
        final isLargeScreen = screenWidth >= 1200;

        // Responsive padding (2-4% of screen width)
        final horizontalPadding = (screenWidth * 0.03).clamp(12.0, 32.0);
        final verticalPadding = (screenHeight * 0.02).clamp(8.0, 24.0);

        // Responsive spacing
        final titleSpacing = isSmallScreen ? 6.0 : (isMediumScreen ? 8.0 : 12.0);
        final contentSpacing = isSmallScreen ? 6.0 : (isMediumScreen ? 8.0 : 12.0);
        final featureSpacing = isSmallScreen ? 1.0 : (isMediumScreen ? 2.0 : 3.0);
        final buttonSpacing = isSmallScreen ? 6.0 : (isMediumScreen ? 8.0 : 12.0);

        // Responsive bullet size
        final bulletSize = isSmallScreen ? 3.0 : (isMediumScreen ? 4.0 : 5.0);
        final bulletMargin = isSmallScreen ? 3.0 : (isMediumScreen ? 4.0 : 6.0);
        final bulletSpacing = isSmallScreen ? 6.0 : (isMediumScreen ? 8.0 : 12.0);

        // Responsive button height
        final buttonHeight = isSmallScreen ? 28.0 : (isMediumScreen ? 32.0 : 36.0);

        return AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 300),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: isSmallScreen ? double.infinity : (isMediumScreen ? 500 : 600),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface.withOpacity(0.95),
              borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neutral900.withOpacity(0.1),
                  blurRadius: isSmallScreen ? 10 : 20,
                  offset: Offset(0, isSmallScreen ? 5 : 10),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                // Dynamic title
                Text(
                  title,
                  style: isSmallScreen
                      ? Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.neutral800,
                          fontWeight: FontWeight.bold,
                        )
                      : isMediumScreen
                          ? Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.neutral800,
                              fontWeight: FontWeight.bold,
                            )
                          : Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: AppColors.neutral800,
                              fontWeight: FontWeight.bold,
                            ),
                ),
                SizedBox(height: titleSpacing),

                // Dynamic description
                Text(
                  description,
                  style: isSmallScreen
                      ? Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.neutral600,
                          height: 1.3,
                        )
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.neutral600,
                          height: 1.4,
                        ),
                ),
                SizedBox(height: contentSpacing),

                // Dynamic feature list
                ...features.map((feature) => Padding(
                  padding: EdgeInsets.symmetric(vertical: featureSpacing),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: bulletSize,
                        height: bulletSize,
                        margin: EdgeInsets.only(top: bulletMargin),
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: bulletSpacing),
                      Expanded(
                        child: Text(
                          feature,
                          style: isSmallScreen
                              ? Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.neutral800,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  fontSize: 11,
                                )
                              : Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.neutral800,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3,
                                ),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
                SizedBox(height: buttonSpacing),

                // Dynamic button
                SizedBox(
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () => _scrollToSection(2),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      foregroundColor: AppColors.surface,
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 12 : 16,
                        vertical: 0,
                      ),
                    ),
                    child: Text(
                      'Get Free Estimate',
                      style: isSmallScreen
                          ? Theme.of(context).textTheme.labelSmall
                          : Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
              ),
            ),
          ),
        );
      },
    );
  }



  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      color: AppColors.neutral50,
      child: Column(
        children: [
          Text(
            'Contact Us',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: AppColors.neutral800,
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
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Tell us about your project',
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: AppColors.surface,
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
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 30),
        _buildContactItem(Icons.phone, '(555) 123-4567', () => _launchPhone('5551234567')),
        _buildContactItem(Icons.email, 'info@treeccarepro.com', () => _launchEmail('info@treecarepro.com')),
        _buildContactItem(Icons.location_on, '123 Tree Street, Green City, ST 12345', () {}),
        _buildContactItem(Icons.access_time, 'Mon-Fri: 7AM-6PM, Sat: 8AM-4PM', () {}),
        const SizedBox(height: 30),
        Text(
          'Why Choose TreeCare Pro?',
          style: Theme.of(context).textTheme.titleLarge,
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
          Icon(icon, color: AppColors.primaryGreen),
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
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.neutral800,
        ),
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
                colorFilter: ColorFilter.mode(AppColors.primaryGreen, BlendMode.srcIn),
              ),
              const SizedBox(width: 10),
              Text(
                'TreeCare Pro',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.surface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© 2024 TreeCare Pro. All rights reserved.',
            style: TextStyle(color: AppColors.surface.withOpacity(0.7)),
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