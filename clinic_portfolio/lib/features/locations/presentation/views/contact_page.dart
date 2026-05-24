import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/presentation/widgets/section_header.dart';
import '../../../../shared/presentation/widgets/state_views.dart';
import '../viewmodels/contact_viewmodel.dart';
import '../widgets/location_card.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContactViewModel>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact & Locations')),
      body: Consumer<ContactViewModel>(
        builder: (context, vm, _) {
          if (vm.state.isLoading) return const LoadingView();
          if (vm.state.isError) {
            return ErrorRetryView(
              message: vm.state.errorMessage ?? 'Something went wrong',
              onRetry: vm.load,
            );
          }
          final locations = vm.state.data ?? [];
          return ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              const SectionHeader(
                eyebrow: 'Get in touch',
                title: 'We\'re here to help',
                subtitle:
                    'Two convenient locations with extended hours. Same-day '
                    'appointments available.',
              ),
              const SizedBox(height: 12),
              for (final loc in locations)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: LocationCard(location: loc),
                ),
            ],
          );
        },
      ),
    );
  }
}
