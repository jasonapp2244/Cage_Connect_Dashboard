import 'package:flutter/material.dart';

class ScreenSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late Orientation orientation;
  static late double pixelRatio;
  static late double textScaleFactor;
  static late EdgeInsets padding;
  static late Brightness platformBrightness;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    pixelRatio = _mediaQueryData.devicePixelRatio;
    textScaleFactor = _mediaQueryData.textScaleFactor;
    padding = _mediaQueryData.padding;
    platformBrightness = _mediaQueryData.platformBrightness;

    // Divide screen into 100 blocks horizontally and vertically
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    // Calculate safe area blocks (considering notches, status bars, etc.)
    _safeAreaHorizontal = padding.left + padding.right;
    _safeAreaVertical = padding.top + padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

class Adaptive {
  final BuildContext context;

  Adaptive(this.context) {
    ScreenSize.init(context);
  }

  // Screen size breakpoints with more granular control
  bool get isWatch => screenWidth < 300;
  bool get isSmallMobile => screenWidth >= 300 && screenWidth < 400;
  bool get isMediumMobile => screenWidth >= 400 && screenWidth < 500;
  bool get isLargeMobile => screenWidth >= 500 && screenWidth < 600;
  bool get isMobile => screenWidth >= 300 && screenWidth < 600;
  bool get isSmallTablet => screenWidth >= 600 && screenWidth < 800;
  bool get isLargeTablet => screenWidth >= 800 && screenWidth < 1024;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isSmallDesktop => screenWidth >= 1024 && screenWidth < 1366;
  bool get isMediumDesktop => screenWidth >= 1366 && screenWidth < 1920;
  bool get isLargeDesktop => screenWidth >= 1920;
  bool get isDesktop => screenWidth >= 1024;

  // Orientation helpers
  bool get isPortrait => ScreenSize.orientation == Orientation.portrait;
  bool get isLandscape => ScreenSize.orientation == Orientation.landscape;

  // Platform brightness
  bool get isDarkMode => ScreenSize.platformBrightness == Brightness.dark;

  // Screen dimensions
  double get screenWidth => ScreenSize.screenWidth;
  double get screenHeight => ScreenSize.screenHeight;
  double get pixelRatio => ScreenSize.pixelRatio;
  double get textScaleFactor => ScreenSize.textScaleFactor;

  // Responsive sizing utilities
  double width(double percent) => ScreenSize.blockSizeHorizontal * percent;
  double height(double percent) => ScreenSize.blockSizeVertical * percent;
  double safeWidth(double percent) => ScreenSize.safeBlockHorizontal * percent;
  double safeHeight(double percent) => ScreenSize.safeBlockVertical * percent;

  double fontSize(
    double size, {
    double min = 10,
    double max = double.infinity,
  }) {
    final baseWidth =
        1440.0; // a design reference width (e.g. desktop Figma width)
    final scale = ScreenSize.screenWidth / baseWidth;

    // Multiply the base size by scale, but never let it exceed the min/max limits
    double scaled = size * scale;

    // Adjust further for text scale factor (accessibility)
    scaled *= ScreenSize.textScaleFactor;

    return scaled.clamp(min, max);
  }

  // Spacing utilities
  EdgeInsets paddingAll(double percent) => EdgeInsets.all(width(percent));
  EdgeInsets paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(
        horizontal: width(horizontal),
        vertical: height(vertical),
      );
  EdgeInsets paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: width(left),
    top: height(top),
    right: width(right),
    bottom: height(bottom),
  );

  // Spacer widgets
  SizedBox verticalSpace(double height) => SizedBox(height: (height));
  SizedBox horizontalSpace(double width) => SizedBox(width: (width));
  SizedBox space(double width, double height) =>
      SizedBox(width: (width), height: (height));

  // Adaptive layout builder
  Widget builder({
    Widget? watch,
    Widget? smallMobile,
    Widget? mediumMobile,
    Widget? largeMobile,
    Widget? mobile,
    Widget? smallTablet,
    Widget? largeTablet,
    Widget? tablet,
    Widget? smallDesktop,
    Widget? mediumDesktop,
    Widget? largeDesktop,
    Widget? desktop,
    Widget? defaultWidget,
  }) {
    if (isWatch && watch != null) return watch;
    if (isSmallMobile && smallMobile != null) return smallMobile;
    if (isMediumMobile && mediumMobile != null) return mediumMobile;
    if (isLargeMobile && largeMobile != null) return largeMobile;
    if (isMobile && mobile != null) return mobile;
    if (isSmallTablet && smallTablet != null) return smallTablet;
    if (isLargeTablet && largeTablet != null) return largeTablet;
    if (isTablet && tablet != null) return tablet;
    if (isSmallDesktop && smallDesktop != null) return smallDesktop;
    if (isMediumDesktop && mediumDesktop != null) return mediumDesktop;
    if (isLargeDesktop && largeDesktop != null) return largeDesktop;
    if (isDesktop && desktop != null) return desktop;
    return defaultWidget ?? const SizedBox.shrink();
  }
}

class Responsive extends StatelessWidget {
  final Widget? watch;
  final Widget? smallMobile;
  final Widget? mediumMobile;
  final Widget? largeMobile;
  final Widget? mobile;
  final Widget? smallTablet;
  final Widget? largeTablet;
  final Widget? tablet;
  final Widget? smallDesktop;
  final Widget? mediumDesktop;
  final Widget? largeDesktop;
  final Widget? desktop;
  final Widget? defaultWidget;

  const Responsive({
    super.key,
    this.watch,
    this.smallMobile,
    this.mediumMobile,
    this.largeMobile,
    this.mobile,
    this.smallTablet,
    this.largeTablet,
    this.tablet,
    this.smallDesktop,
    this.mediumDesktop,
    this.largeDesktop,
    this.desktop,
    this.defaultWidget,
  });

  @override
  Widget build(BuildContext context) {
    final adaptive = Adaptive(context);
    return adaptive.builder(
      watch: watch,
      smallMobile: smallMobile,
      mediumMobile: mediumMobile,
      largeMobile: largeMobile,
      mobile: mobile,
      smallTablet: smallTablet,
      largeTablet: largeTablet,
      tablet: tablet,
      smallDesktop: smallDesktop,
      mediumDesktop: mediumDesktop,
      largeDesktop: largeDesktop,
      desktop: desktop,
      defaultWidget: defaultWidget,
    );
  }

  // Quick access to adaptive utilities without needing to instantiate
  static Adaptive of(BuildContext context) => Adaptive(context);
}
