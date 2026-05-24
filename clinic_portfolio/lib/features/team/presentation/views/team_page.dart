import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/presentation/widgets/section_header.dart';
import '../../../../shared/presentation/widgets/state_views.dart';
import '../viewmodels/team_viewmodel.dart';
import '../widgets/team_member_card.dart';
import 'team_member_detail_page.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TeamViewModel>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clinic Team')),
      body: Consumer<TeamViewModel>(
        builder: (context, vm, _) {
          if (vm.state.isLoading) return const LoadingView();
          if (vm.state.isError) {
            return ErrorRetryView(
              message: vm.state.errorMessage ?? 'Something went wrong',
              onRetry: vm.load,
            );
          }
          final members = vm.state.data ?? [];
          return ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              const SectionHeader(
                eyebrow: 'Caring professionals',
                title: 'Meet our Team',
                subtitle:
                    'Physicians and allied health practitioners — '
                    'collaborative, experienced and patient-focused.',
              ),
              const SizedBox(height: 8),
              for (final m in members)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: TeamMemberCard(
                    member: m,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => TeamMemberDetailPage(member: m),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
