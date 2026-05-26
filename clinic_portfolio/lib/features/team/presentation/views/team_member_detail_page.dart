import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/team_member.dart';

class TeamMemberDetailPage extends StatelessWidget {
  final TeamMember member;
  const TeamMemberDetailPage({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(member.name)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: CircleAvatar(
              radius: 52,
              backgroundColor: AppColors.primary.withValues(alpha: 0.12),
              foregroundImage: NetworkImage(member.imageUrl),
              onForegroundImageError: (_, error) {},
              child: Text(
                member.initials,
                style: text.displayLarge?.copyWith(
                  color: AppColors.primary,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(child: Text(member.name, style: text.headlineLarge)),
          const SizedBox(height: 4),
          Center(child: Text(member.title, style: text.bodyLarge)),
          const SizedBox(height: 8),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                member.specialty,
                style: text.labelSmall?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),
          Text('About', style: text.titleLarge),
          const SizedBox(height: 8),
          Text(member.bio, style: text.bodyLarge),
          const SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: () async {
              final uri = Uri.parse(member.bookingUrl);
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
            icon: const Icon(Icons.calendar_month),
            label: const Text('Book with this practitioner'),
          ),
        ],
      ),
    );
  }
}
