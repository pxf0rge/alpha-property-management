import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSvgIcon extends StatelessWidget {
  final String assetName; // e.g., 'location.svg'
  final double? size; // Optional size
  final Color? color; // Optional color override
  final bool tint;

  const CommonSvgIcon({
    super.key,
    required this.assetName,
    this.size,
    this.color,
    this.tint = true,
  });

  @override
  Widget build(BuildContext context) {
    final shouldApplyTint = tint && color != null;
    final iconColor = color ?? Theme.of(context).iconTheme.color;

    return SvgPicture.asset(
      'assets/icons/$assetName',
      width: size,
      height: size,
      colorFilter: shouldApplyTint
          ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
          : null,
    );
  }
}
