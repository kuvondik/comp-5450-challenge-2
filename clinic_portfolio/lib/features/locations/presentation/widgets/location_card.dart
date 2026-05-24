import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/clinic_location.dart';

class LocationCard extends StatelessWidget {
  final ClinicLocation location;
  const LocationCard({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.location_on, color: AppColors.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                    child: Text(location.name, style: text.headlineMedium)),
              ],
            ),
            const SizedBox(height: 14),
            ContactRow(icon: Icons.home_outlined, text: location.address),
            const SizedBox(height: 8),
            for (final phone in location.phones) ...[
              ContactRow(icon: Icons.phone_outlined, text: phone),
              const SizedBox(height: 8),
            ],
            ContactRow(icon: Icons.email_outlined, text: location.email),
            const SizedBox(height: 16),
            Text('Hours', style: text.titleLarge?.copyWith(fontSize: 16)),
            const SizedBox(height: 8),
            for (final h in location.openingHours)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 16, color: AppColors.textMuted),
                    const SizedBox(width: 8),
                    Expanded(child: Text(h.days, style: text.bodyMedium)),
                    Text(
                      h.hours,
                      style: text.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContactRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: style)),
      ],
    );
  }
}
