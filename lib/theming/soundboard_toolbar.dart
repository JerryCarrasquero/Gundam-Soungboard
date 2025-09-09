import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoundboardToolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const SoundboardToolbar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Row(
            children: [
              SvgPicture.asset(
                'assets/svgLogo/Earth_Federation_Forces_emblem.svg',
                height: 32,
                width: 32,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
          actions: actions,
          elevation: 0,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
