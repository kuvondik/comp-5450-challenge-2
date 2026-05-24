import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/app_logo.dart';
import '../../../home/presentation/views/home_page.dart';
import '../../../locations/presentation/views/contact_page.dart';
import '../../../programs/presentation/views/programs_page.dart';
import '../../../services/presentation/views/services_page.dart';
import '../../../team/presentation/views/team_page.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  void _goTo(int i) => setState(() => _index = i);

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomePage(
        onSeeAllServices: () => _goTo(1),
        onSeeAllTeam: () => _goTo(3),
        onContact: () => _goTo(4),
      ),
      const ServicesPage(),
      const ProgramsPage(),
      const TeamPage(),
      const ContactPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 12,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: AppColors.divider),
        ),
        title: Row(
          children: [
            const AppLogo(size: 35, badge: true),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                AppConstants.appName,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(index: _index, children: pages),
      bottomNavigationBar: _BottomNavBar(
        currentIndex: _index,
        onTap: _goTo,
      ),
    );
  }
}

// ── Custom bottom nav ────────────────────────────────────────────────────────

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    const items = [
      _NavItemData(Icons.home_outlined, Icons.home, 'Home'),
      _NavItemData(Icons.medical_services_outlined, Icons.medical_services, 'Services'),
      _NavItemData(Icons.fact_check_outlined, Icons.fact_check, 'Programs'),
      _NavItemData(Icons.people_outline, Icons.people, 'Team'),
      _NavItemData(Icons.place, Icons.place, 'Location'),
    ];

    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1, thickness: 1, color: AppColors.divider),
        Material(
          color: Colors.white,
          // No SafeArea — the InkWell must reach the physical bottom edge so
          // the ripple fills the full vertical boundary. Content is kept in
          // the upper 62 px; the bottom inset is empty space inside the hit area.
          child: SizedBox(
            height: 62 + bottomInset,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int i = 0; i < items.length; i++)
                  Expanded(
                    child: _NavItem(
                      data: items[i],
                      selected: currentIndex == i,
                      onTap: () => onTap(i),
                      bottomInset: bottomInset,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _NavItemData {
  const _NavItemData(this.icon, this.activeIcon, this.label);

  final IconData icon;
  final IconData activeIcon;
  final String label;
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.data,
    required this.selected,
    required this.onTap,
    required this.bottomInset,
  });

  final _NavItemData data;
  final bool selected;
  final VoidCallback onTap;

  /// Safe-area inset at the bottom of the screen. The InkWell extends into
  /// this region so the ripple fills all the way to the physical bottom edge;
  /// the icon + label stay centred in the upper 62 px content area.
  final double bottomInset;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.textSecondary;

    // InkWell has containedInkWell: true by default, so the ripple is
    // clipped to this widget's own bounds and cannot bleed into neighbours.
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.primary.withValues(alpha: 0.12),
      highlightColor: AppColors.primary.withValues(alpha: 0.06),
      child: Column(
        children: [
          // Content occupies the upper 62 px, centred vertically within it.
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  selected ? data.activeIcon : data.icon,
                  color: color,
                  size: 24,
                ),
                const SizedBox(height: 2),
                Text(
                  data.label,
                  style: TextStyle(
                    fontSize: 11,
                    color: color,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Empty space equal to the safe-area inset — the InkWell still
          // covers it, so the ripple extends to the physical bottom edge.
          SizedBox(height: bottomInset),
        ],
      ),
    );
  }
}
