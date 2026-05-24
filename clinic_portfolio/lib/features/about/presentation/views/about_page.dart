import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/section_header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          const SectionHeader(
            eyebrow: 'Our story',
            title: 'About Infinity Health Centre',
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Text(AppConstants.missionStatement, style: text.bodyLarge),
          ),
          const SectionHeader(
            eyebrow: 'What guides us',
            title: 'Our values',
          ),
          const SizedBox(height: 8),
          ..._values.map((v) => _ValueTile(value: v)),
          const SizedBox(height: 24),
          const SectionHeader(
            eyebrow: 'By the numbers',
            title: 'Two cities. One standard of care.',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: const [
                Expanded(child: _StatBox(value: '20+', label: 'Years serving Toronto & Oakville')),
                SizedBox(width: 12),
                Expanded(child: _StatBox(value: '7 days', label: 'a week availability')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueDef {
  final IconData icon;
  final String title;
  final String description;
  const _ValueDef(this.icon, this.title, this.description);
}

const _values = [
  _ValueDef(
    Icons.diversity_3,
    'Collaborative care',
    'Our physicians and allied practitioners work as one team around every patient.',
  ),
  _ValueDef(
    Icons.bolt,
    'Convenient access',
    'Same-day appointments, evening and weekend hours, and walk-in availability.',
  ),
  _ValueDef(
    Icons.science,
    'Evidence-informed',
    'We blend the best of modern medicine with effective complementary therapies.',
  ),
  _ValueDef(
    Icons.favorite,
    'Patient first',
    'Listening carefully, explaining clearly, and treating each person as a partner.',
  ),
];

class _ValueTile extends StatelessWidget {
  final _ValueDef value;
  const _ValueTile({required this.value});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(value.icon, color: AppColors.accent),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value.title, style: text.titleLarge),
                    const SizedBox(height: 4),
                    Text(value.description, style: text.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;
  const _StatBox({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style: text.displayLarge?.copyWith(
                  color: AppColors.primary, fontSize: 28)),
          const SizedBox(height: 4),
          Text(label, style: text.bodyMedium),
        ],
      ),
    );
  }
}
