# TreeCare Pro - Professional Tree Pruning Services Website

A responsive Flutter web application for a tree pruning business, featuring parallax scrolling, mobile-responsive design, and a professional contact form.

## Features

- ✨ Responsive design that works on desktop, tablet, and mobile
- 🌊 Parallax scrolling effects
- 📱 Mobile-friendly navigation with hamburger menu
- 💚 Modern green color scheme suitable for tree care business
- 📞 Contact form with business information
- 🎨 Professional layout inspired by successful service websites

## Sections

1. **Hero Section** - Eye-catching header with call-to-action buttons
2. **Services** - Tree pruning, removal, health care, and emergency services
3. **Portfolio** - Recent projects showcase
4. **Contact** - Contact form and business details
5. **Footer** - Company branding and copyright

## GitHub Pages Deployment

This project is configured for automatic deployment to GitHub Pages using GitHub Actions.

### Setup Instructions:

1. **Fork or clone this repository to your GitHub account**

2. **Enable GitHub Pages in your repository:**
   - Go to your repository Settings
   - Scroll down to "Pages" in the left sidebar
   - Under "Source", select "GitHub Actions"

3. **Push to main branch:**
   - The GitHub Action will automatically build and deploy your site
   - Your site will be available at: `https://yourusername.github.io/tree_pruning_website/`

4. **Customize the content:**
   - Edit `lib/main.dart` to update business information
   - Change company name, contact details, services, etc.
   - Commit and push your changes

### Local Development

To run this project locally:

```bash
# Clone the repository
git clone https://github.com/yourusername/tree_pruning_website.git
cd tree_pruning_website

# Get dependencies
flutter pub get

# Run the web app
flutter run -d web-server --web-port 8080
```

Visit `http://localhost:8080` to see your local development version.

### Building for Production

To build the web app for production:

```bash
flutter build web --release
```

The built files will be in the `build/web` directory.

## Customization

### Updating Business Information

1. **Company Name**: Search for "TreeCare Pro" in `lib/main.dart` and replace with your business name
2. **Contact Information**: Update phone, email, and address in the `_buildContactInfo()` method
3. **Services**: Modify the services array in `_buildServiceCards()` method
4. **Colors**: Change the color scheme by updating the theme in the `TreePruningApp` widget

### Adding Images

To add real images instead of placeholder icons:

1. Create an `assets/images/` directory
2. Add your images to the directory
3. Update `pubspec.yaml` to include the assets
4. Replace the placeholder icons with `Image.asset()` widgets

## Technologies Used

- **Flutter 3.35.3** - Cross-platform UI framework
- **Google Fonts** - Typography
- **URL Launcher** - For phone and email links
- **GitHub Actions** - Automated deployment
- **GitHub Pages** - Free web hosting

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

If you need help with customization or deployment, please create an issue in this repository.