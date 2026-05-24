import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_branding.dart';

/// Renders the app's brand mark from [AppBranding.logo] (SVG).
///
/// Pass [badge] to wrap the mark in a circular white container.
/// [color] only applies when falling back to [AppBranding.fallbackIcon].
class AppLogo extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? backgroundColor;

  /// When true, wraps the mark in a circular badge using [backgroundColor].
  final bool badge;

  const AppLogo({
    super.key,
    this.size = 56,
    this.color,
    this.backgroundColor,
    this.badge = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget mark = SvgPicture.asset(
      AppBranding.logo,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );

    if (!badge) return mark;

    final pad = size * 0.15;
    final bgColor = backgroundColor ?? Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      // ClipOval with antiAliasWithSaveLayer ensures the SVG is hard-clipped
      // to the circle boundary, preventing sub-pixel bleed that looks pixelated.
      child: ClipOval(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: EdgeInsets.all(pad),
          child: mark,
        ),
      ),
    );
  }
}
