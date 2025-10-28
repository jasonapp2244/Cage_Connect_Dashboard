# Cage Connect Dashboard

A responsive Flutter application for MMA training management.

## Project Structure

```
lib/
├── main.dart                           # App entry point
├── screens/                            # Screen widgets
│   └── responsive_login_screen.dart    # Main responsive login screen
└── widgets/                            # Reusable widget components
    ├── login_form.dart                 # Login form widget
    └── login_image_section.dart        # Image section widget
```

## Features

### Responsive Design
- **Mobile (< 768px)**: Shows only the login form for optimal mobile experience
- **Desktop/Tablet (≥ 768px)**: Shows both image section and login form side by side
- **Large screens (> 1200px)**: Optimized layout with better proportions

### Components

#### LoginForm Widget
- Complete login form with email and password fields
- Form validation
- Remember me checkbox
- Forgot password link
- Responsive design with proper constraints

#### LoginImageSection Widget
- Background image with overlay
- Gradient overlay for better text visibility
- Branding elements (User Management, Tough Lab)
- Professional MMA training messaging

#### ResponsiveLoginScreen
- Uses `LayoutBuilder` to detect screen size
- Automatically switches between mobile and desktop layouts
- Maintains proper spacing and constraints for all screen sizes

## Usage

The app automatically detects screen size and adjusts the layout accordingly:

- On mobile devices, users see only the login form
- On larger screens, users see both the image section and login form
- The layout is optimized for different screen sizes with appropriate flex ratios

## Dependencies

- Flutter SDK ^3.9.2
- Material Design 3
- No additional dependencies required

## Assets

- `assets/images/login.png` - MMA cage background image

