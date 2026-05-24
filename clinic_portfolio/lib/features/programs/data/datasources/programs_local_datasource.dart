import 'package:flutter/material.dart';

import '../models/health_program_model.dart';

abstract class ProgramsLocalDataSource {
  Future<List<HealthProgramModel>> fetchAll();
}

class ProgramsLocalDataSourceImpl implements ProgramsLocalDataSource {
  const ProgramsLocalDataSourceImpl();

  @override
  Future<List<HealthProgramModel>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 250));
    return const [
      HealthProgramModel(
        id: 'weight-management',
        name: 'Weight Management',
        description:
            'A medically supervised program combining nutrition, exercise '
            'and behavioural support to help you reach and maintain a '
            'healthy weight.',
        highlights: [
          'Physician-led assessment',
          'Personalized nutrition plan',
          'Exercise programming',
          'Ongoing accountability',
        ],
        icon: Icons.monitor_weight,
      ),
      HealthProgramModel(
        id: 'sports-therapy',
        name: 'Advanced Sports Therapy',
        description:
            'For weekend warriors and competitive athletes alike — '
            'integrated care to optimize performance and recover quickly '
            'from injury.',
        highlights: [
          'Movement screens',
          'Manual therapy',
          'Strength & conditioning',
          'Return-to-sport testing',
        ],
        icon: Icons.sports_handball,
      ),
      HealthProgramModel(
        id: 'corporate-wellness',
        name: 'Corporate Wellness',
        description:
            'Bring evidence-based wellness programming on-site to your team '
            '— ergonomic assessments, lunch-and-learns, and preventive '
            'screening days.',
        highlights: [
          'Ergonomic audits',
          'Group workshops',
          'Annual screening days',
          'EAP-friendly billing',
        ],
        icon: Icons.business_center,
      ),
      HealthProgramModel(
        id: 'post-surgery',
        name: 'Post-Surgery Recovery',
        description:
            'Coordinated post-operative rehab to restore function and '
            'minimize complications — for orthopedic, abdominal and '
            'cardiac procedures.',
        highlights: [
          'Surgeon-aligned protocols',
          'Progressive mobility',
          'Pain management',
          'Outcome tracking',
        ],
        icon: Icons.health_and_safety,
      ),
      HealthProgramModel(
        id: 'mva-rehab',
        name: 'Motor Vehicle Accident Rehab',
        description:
            'Comprehensive rehab after a motor vehicle accident — including '
            'direct billing to insurers and coordinated multi-provider care.',
        highlights: [
          'Direct insurance billing',
          'Whiplash protocols',
          'Concussion screening',
          'Return-to-work planning',
        ],
        icon: Icons.directions_car,
      ),
    ];
  }
}
