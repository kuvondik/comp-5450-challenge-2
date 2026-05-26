import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/presentation/state/view_state.dart';
import '../../../../shared/constants/app_assets.dart';
import '../../../../shared/presentation/widgets/section_header.dart';
import '../../../about/presentation/views/about_page.dart';
import '../../../services/domain/entities/clinic_service.dart';
import '../../../services/presentation/views/service_detail_page.dart';
import '../../../services/presentation/widgets/service_card.dart';
import '../../../team/domain/entities/team_member.dart';
import '../../../team/presentation/views/team_member_detail_page.dart';
import '../../../team/presentation/widgets/team_member_card.dart';
import '../viewmodels/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onSeeAllServices;
  final VoidCallback onSeeAllTeam;
  final VoidCallback onContact;

  const HomePage({
    super.key,
    required this.onSeeAllServices,
    required this.onSeeAllTeam,
    required this.onContact,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () => context.read<HomeViewModel>().load(),
          child: ListView(
            padding: const EdgeInsets.only(bottom: 32),
            children: [
              _Hero(onBook: widget.onContact),
              const SizedBox(height: 24),
              _Stats(),
              const SizedBox(height: 32),
              const SectionHeader(
                eyebrow: 'What we offer',
                title: 'Health Services',
                subtitle:
                    'A multidisciplinary team under one roof — from family '
                    'medicine to rehabilitation and mental health.',
              ),
              const SizedBox(height: 12),
              Consumer<HomeViewModel>(
                builder: (context, vm, _) =>
                    _ServicesGrid(state: vm.featuredServices),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton(
                    onPressed: widget.onSeeAllServices,
                    child: const Text('See all services'),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const SectionHeader(
                eyebrow: 'Our practitioners',
                title: 'Meet the Team',
                subtitle:
                    'Physicians and allied health practitioners working '
                    'together for your care.',
              ),
              const SizedBox(height: 12),
              Consumer<HomeViewModel>(
                builder: (context, vm, _) => _TeamList(state: vm.featuredTeam),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton(
                    onPressed: widget.onSeeAllTeam,
                    child: const Text('See full team'),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: AppColors.divider),
                  ),
                  tileColor: AppColors.surface,
                  leading: const Icon(Icons.info_outline,
                      color: AppColors.primary),
                  title: const Text('About Infinity Health Centre'),
                  subtitle: const Text('Our story, values and mission'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AboutPage()),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _ContactCTA(onContact: widget.onContact),
            ],
          ),
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  final VoidCallback onBook;
  const _Hero({required this.onBook});

  Future<void> _openBookAppointment() async {
    final uri = Uri.parse(AppConstants.bookAppointmentUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      // ClipRRect keeps the photo and overlay inside the rounded corners.
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.cardBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.92),
                    AppColors.primaryLight.withValues(alpha: 0.62),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'TORONTO  •  OAKVILLE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  AppConstants.appName,
                  style: text.displayLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  AppConstants.tagline,
                  style: text.bodyLarge?.copyWith(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: _openBookAppointment,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                      ),
                      icon: const Icon(Icons.calendar_month, size: 18),
                      label: const Text('Book an Appointment'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = const [
      _StatItem(value: '17+', label: 'Services'),
      _StatItem(value: '15+', label: 'Practitioners'),
      _StatItem(value: '7d', label: 'a week'),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            Expanded(child: items[i]),
            if (i != items.length - 1) const SizedBox(width: 12),
          ]
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: text.headlineMedium?.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: text.labelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ServicesGrid extends StatelessWidget {
  final ViewState<List<ClinicService>> state;
  const _ServicesGrid({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const SizedBox(
        height: 180,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    final services = state.data ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.95,
        ),
        itemBuilder: (context, i) {
          final s = services[i];
          return ServiceCard(
            service: s,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ServiceDetailPage(service: s),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TeamList extends StatelessWidget {
  final ViewState<List<TeamMember>> state;
  const _TeamList({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const SizedBox(
        height: 160,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    final members = state.data ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          for (final m in members) ...[
            TeamMemberCard(
              member: m,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => TeamMemberDetailPage(member: m),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _ContactCTA extends StatelessWidget {
  final VoidCallback onContact;
  const _ContactCTA({required this.onContact});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.18)),
      ),
      child: Row(
        children: [
          const Icon(Icons.support_agent, color: AppColors.primary, size: 36),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Same-day appointments available',
                    style: text.titleLarge),
                const SizedBox(height: 4),
                Text(
                  'Reach out to either of our locations to get started.',
                  style: text.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: onContact,
            child: const Text('Contact'),
          ),
        ],
      ),
    );
  }
}
