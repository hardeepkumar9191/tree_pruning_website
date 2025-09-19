# 🌳 TreeCare Pro - Professional Tree Pruning Website

A stunning, responsive Flutter web application for a tree pruning business inspired by modern service websites. Features elegant parallax scrolling, mobile-responsive design, and professional DM Serif Text typography.

## 🌐 Live Demo

**Website URL:** [Your site will be available here after deployment]
- Desktop: Full-featured with parallax effects and smooth scrolling
- Mobile: Optimized with hamburger menu and touch-friendly interface
- Tablet: Adaptive layout that scales beautifully

## ✨ Features

- 🎨 **Professional Design** - Inspired by successful service websites like ProShot Roofing
- 📱 **Fully Responsive** - Perfect on desktop, tablet, and mobile devices
- 🌊 **Parallax Scrolling** - Engaging visual effects in the hero section
- 🍃 **Tree Care Theme** - Green color scheme with nature-inspired icons
- 📞 **Contact Integration** - Clickable phone and email links
- 🎯 **Call-to-Action** - Strategic placement of "Free Estimate" buttons
- 🔤 **Premium Typography** - DM Serif Text font for elegant appearance
- ⚡ **Fast Loading** - Optimized Flutter web build
- 🤖 **Auto-Deploy** - GitHub Actions workflow for seamless updates

## 📋 Website Sections

### 1. Hero Section
- Eye-catching parallax background with green gradient
- Compelling headline: "Professional Tree Pruning Services"
- Dual call-to-action buttons (Get Free Estimate / Our Services)
- Responsive text sizing for all devices

### 2. Services Section
- **Tree Pruning** - Professional pruning for health and appearance
- **Tree Removal** - Safe removal of hazardous trees
- **Tree Health Care** - Disease treatment and preventive care
- **Emergency Services** - 24/7 storm damage response

### 3. Portfolio Section
- Grid layout showcasing recent projects
- Responsive columns (3 on desktop, 2 on tablet, 1 on mobile)
- Project examples: Oak Tree Pruning, Emergency Cleanup, etc.

### 4. Contact Section
- Professional contact form with validation
- Business information panel
- Clickable contact details (phone, email)
- "Why Choose TreeCare Pro?" highlights

### 5. Footer
- Company branding
- Copyright information
- Consistent styling

## 🚀 Quick Start

### Prerequisites
- [Flutter SDK 3.35.3+](https://flutter.dev/docs/get-started/install)
- [Git](https://git-scm.com/downloads)
- Web browser (Chrome, Firefox, Safari, Edge)

### Local Development

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/tree_pruning_website.git
cd tree_pruning_website

# 2. Install dependencies
flutter pub get

# 3. Run the development server
flutter run -d web-server --web-port 8080

# 4. Open your browser
# Visit: http://localhost:8080
```

### Building for Production

```bash
# Build optimized web version
flutter build web --release

# Output will be in build/web/ directory
# Deploy these files to any web hosting service
```

## 🌍 GitHub Pages Deployment

This project includes automatic GitHub Pages deployment via GitHub Actions.

### One-Time Setup:

1. **Fork/Create Repository**
   ```bash
   # If creating new repo
   gh repo create tree_pruning_website --public

   # Push your code
   git remote add origin https://github.com/yourusername/tree_pruning_website.git
   git branch -M main
   git push -u origin main
   ```

2. **Enable GitHub Pages**
   - Go to repository **Settings**
   - Navigate to **Pages** section
   - Set **Source** to "GitHub Actions"
   - Save settings

3. **Automatic Deployment**
   - Every push to `main` branch triggers deployment
   - GitHub Action builds Flutter web app
   - Deploys to: `https://yourusername.github.io/tree_pruning_website/`
   - Build status visible in Actions tab

### Manual Deployment (Alternative)

```bash
# Build and deploy manually
flutter build web --release --base-href "/tree_pruning_website/"

# Copy build/web/* to your hosting provider
# Or use GitHub Pages, Netlify, Vercel, etc.
```

## 🎨 Customization Guide

### Business Information

**Update Company Details:**
```dart
// In lib/main.dart, find and replace:

// Company name (appears in header and footer)
'TreeCare Pro' → 'Your Business Name'

// Contact information in _buildContactInfo() method:
'(555) 123-4567' → 'Your Phone Number'
'info@treecarepro.com' → 'your@email.com'
'123 Tree Street, Green City, ST 12345' → 'Your Address'
```

**Update Services:**
```dart
// In _buildServiceCards() method, modify the services array:
final services = [
  {
    'icon': Icons.your_icon,
    'title': 'Your Service',
    'description': 'Your service description',
  },
  // Add more services...
];
```

### Visual Customization

**Colors:**
```dart
// In TreePruningApp widget, update theme:
theme: ThemeData(
  primarySwatch: Colors.blue, // Change from green
  // ...
)

// Update gradient colors in _buildHeroSection():
colors: [
  Color(0xFF1976D2), // Your primary color
  Color(0xFF2196F3), // Your secondary color
],
```

**Typography:**
```dart
// Already using DM Serif Text
// To change font, update all GoogleFonts.dmSerifText() calls
GoogleFonts.yourFontName(
  fontSize: 24,
  fontWeight: FontWeight.bold,
)
```

### Adding Real Images

1. **Create assets directory:**
   ```bash
   mkdir assets/images
   # Add your images here
   ```

2. **Update pubspec.yaml:**
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```

3. **Replace placeholder icons:**
   ```dart
   // Replace Icon widgets with:
   Image.asset(
     'assets/images/your-image.jpg',
     width: 64,
     height: 64,
   )
   ```

## 📱 Responsive Breakpoints

- **Desktop:** > 768px width - Full layout with side-by-side sections
- **Tablet:** 600px - 768px - Adaptive grid layouts
- **Mobile:** < 600px - Single column, hamburger menu

## 🛠 Tech Stack

| Technology | Purpose | Version |
|------------|---------|---------|
| **Flutter** | UI Framework | 3.35.3+ |
| **Dart** | Programming Language | 3.9.2+ |
| **Google Fonts** | Typography (DM Serif Text) | 6.2.1 |
| **URL Launcher** | Phone/Email Links | 6.3.1 |
| **GitHub Actions** | CI/CD Pipeline | Latest |
| **GitHub Pages** | Hosting | Latest |

## 🔧 Development Commands

```bash
# Development
flutter run -d web-server --web-port 8080  # Run dev server
flutter hot-reload                          # Quick reload
flutter hot-restart                         # Full restart

# Analysis
flutter analyze                             # Code analysis
flutter test                               # Run tests

# Building
flutter build web --release               # Production build
flutter build web --release --wasm       # WebAssembly build (experimental)

# Dependencies
flutter pub get                           # Install dependencies
flutter pub upgrade                       # Update dependencies
flutter pub outdated                      # Check for updates
```

## 📊 Performance Tips

- **Optimize Images:** Use WebP format for better compression
- **Tree Shaking:** Unused code automatically removed in release builds
- **Font Loading:** Google Fonts cached automatically
- **Code Splitting:** Flutter web handles this automatically
- **PWA Support:** Can be configured for offline functionality

## 🐛 Troubleshooting

**Common Issues:**

1. **Hot reload not working:**
   ```bash
   flutter clean
   flutter pub get
   flutter run -d web-server
   ```

2. **Font not loading:**
   - Ensure internet connection for Google Fonts
   - Check browser console for errors

3. **Build errors:**
   ```bash
   flutter doctor          # Check Flutter installation
   flutter clean           # Clean build cache
   flutter pub get         # Reinstall dependencies
   ```

4. **GitHub Pages not updating:**
   - Check Actions tab for build status
   - Ensure GitHub Pages source is set to "GitHub Actions"
   - Wait 5-10 minutes for changes to propagate

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🆘 Support

- **Issues:** [GitHub Issues](https://github.com/yourusername/tree_pruning_website/issues)
- **Discussions:** [GitHub Discussions](https://github.com/yourusername/tree_pruning_website/discussions)
- **Flutter Docs:** [flutter.dev](https://flutter.dev/docs)

---

**Built with ❤️ using Flutter Web**

🤖 *Generated with [Claude Code](https://claude.ai/code)*