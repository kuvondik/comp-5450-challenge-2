import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/presentation/widgets/section_header.dart';
import '../../../../shared/presentation/widgets/state_views.dart';
import '../viewmodels/programs_viewmodel.dart';
import '../widgets/program_card.dart';

class ProgramsPage extends StatefulWidget {
  const ProgramsPage({super.key});

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProgramsViewModel>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Programs')),
      body: Consumer<ProgramsViewModel>(
        builder: (context, vm, _) {
          if (vm.state.isLoading) return const LoadingView();
          if (vm.state.isError) {
            return ErrorRetryView(
              message: vm.state.errorMessage ?? 'Something went wrong',
              onRetry: vm.load,
            );
          }
          final programs = vm.state.data ?? [];
          return ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              const SectionHeader(
                eyebrow: 'Multidisciplinary',
                title: 'Structured Programs',
                subtitle:
                    'Coordinated, evidence-based programs combining the right '
                    'mix of providers around a single goal.',
              ),
              const SizedBox(height: 8),
              for (final p in programs)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: ProgramCard(program: p),
                ),
            ],
          );
        },
      ),
    );
  }
}
