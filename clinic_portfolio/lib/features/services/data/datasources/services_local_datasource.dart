import 'package:flutter/material.dart';

import '../models/clinic_service_model.dart';

abstract class ServicesLocalDataSource {
  Future<List<ClinicServiceModel>> fetchAll();
}

class ServicesLocalDataSourceImpl implements ServicesLocalDataSource {
  const ServicesLocalDataSourceImpl();

  @override
  Future<List<ClinicServiceModel>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 250));
    return const [
      ClinicServiceModel(
        id: 'family-medicine',
        name: 'Family Medicine',
        shortDescription: 'Primary care for every stage of life.',
        longDescription:
            'Our family physicians provide preventive care, chronic disease '
            'management, pediatric checkups, and ongoing support for the '
            'whole family — with same-day appointments available.',
        bookingUrl: 'https://infinityhealthcentre.com/book-an-appointment/',
        icon: Icons.family_restroom,
      ),
      ClinicServiceModel(
        id: 'walk-in',
        name: 'Walk-In Clinic',
        shortDescription: 'No appointment needed for urgent concerns.',
        longDescription:
            'Visit either of our locations during walk-in hours. Our team '
            'handles colds, infections, minor injuries, prescription refills '
            'and a wide range of urgent but non-emergency needs.',
        bookingUrl: 'https://infinityhealthcentre.com/book-an-appointment/',
        icon: Icons.local_hospital,
      ),
      ClinicServiceModel(
        id: 'physiotherapy',
        name: 'Physiotherapy',
        shortDescription: 'Restore movement, reduce pain, prevent injury.',
        longDescription:
            'Registered physiotherapists assess, diagnose and treat acute '
            'injuries, post-surgical recovery, and chronic musculoskeletal '
            'conditions using evidence-based manual therapy and exercise.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/physiotherapy',
        icon: Icons.accessibility_new,
      ),
      ClinicServiceModel(
        id: 'chiropractic',
        name: 'Chiropractic',
        shortDescription: 'Spinal and joint care for pain relief.',
        longDescription:
            'Chiropractic care focuses on the diagnosis and treatment of '
            'neuromuscular disorders, with an emphasis on the spine. Helps '
            'with back pain, neck pain, headaches, and posture-related issues.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/chiropractic',
        icon: Icons.self_improvement,
      ),
      ClinicServiceModel(
        id: 'naturopathic',
        name: 'Naturopathic Medicine',
        shortDescription: 'Whole-person, evidence-informed care.',
        longDescription:
            'Naturopathic doctors blend modern science with traditional '
            'therapies — nutrition, botanical medicine, acupuncture and '
            'lifestyle counselling — to address root causes.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/staff_member/7',
        icon: Icons.spa,
      ),
      ClinicServiceModel(
        id: 'osteopathy',
        name: 'Osteopathy',
        shortDescription: 'Hands-on therapy for body alignment.',
        longDescription:
            'Manual osteopathy uses gentle pressure, stretching and '
            'manipulation to relieve pain, improve mobility, and support the '
            'body\'s natural ability to heal.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/staff_member/13',
        icon: Icons.healing,
      ),
      ClinicServiceModel(
        id: 'psychotherapy',
        name: 'Psychotherapy',
        shortDescription: 'Confidential mental health support.',
        longDescription:
            'Our registered psychotherapists offer individual and couples '
            'sessions for anxiety, depression, stress, grief, life '
            'transitions, and trauma — in person or virtually.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/psychotherapy',
        icon: Icons.psychology,
      ),
      ClinicServiceModel(
        id: 'massage',
        name: 'Massage Therapy',
        shortDescription: 'Therapeutic massage by RMTs.',
        longDescription:
            'Registered Massage Therapists provide deep tissue, Swedish, '
            'sports, prenatal and relaxation massage — often covered by '
            'extended health benefits.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/massage-therapy',
        icon: Icons.spa_outlined,
      ),
      ClinicServiceModel(
        id: 'acupuncture',
        name: 'Medical Acupuncture',
        shortDescription: 'Evidence-based needle therapy.',
        longDescription:
            'Acupuncture is used to manage chronic pain, migraines, sports '
            'injuries, and stress. Our practitioners combine traditional '
            'techniques with contemporary medical understanding.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/staff_member/1/treatment/36',
        icon: Icons.medical_services,
      ),
      ClinicServiceModel(
        id: 'orthotics',
        name: 'Custom Orthotics',
        shortDescription: 'Foot support tailored to you.',
        longDescription:
            'Custom-made orthotics correct biomechanical foot issues and '
            'relieve pain in the feet, knees, hips and lower back. Includes '
            'gait analysis and fitting.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/discipline/8/treatment/58',
        icon: Icons.directions_walk,
      ),
      ClinicServiceModel(
        id: 'compression',
        name: 'Compression Stockings',
        shortDescription: 'Vascular support for legs and circulation.',
        longDescription:
            'Medical-grade compression stockings to support venous return, '
            'reduce swelling and treat varicose veins. Professional fitting '
            'available.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/staff_member/1/treatment/73',
        icon: Icons.fitness_center,
      ),
      ClinicServiceModel(
        id: 'vestibular',
        name: 'Vestibular Rehab',
        shortDescription: 'Therapy for dizziness and balance issues.',
        longDescription:
            'Specialized rehabilitation for vertigo, BPPV, post-concussion '
            'dizziness and balance disorders — helping you regain stability '
            'and confidence.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/staff_member/9',
        icon: Icons.balance,
      ),
      ClinicServiceModel(
        id: 'bracing',
        name: 'Custom Bracing',
        shortDescription: 'Joint support to keep you moving.',
        longDescription:
            'Custom and off-the-shelf bracing for knees, ankles, wrists and '
            'more — for injury recovery, arthritis support, and sport.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/staff_member/1/treatment/124',
        icon: Icons.airline_seat_legroom_extra,
      ),
      ClinicServiceModel(
        id: 'lab-tests',
        name: 'Lab Tests',
        shortDescription: 'On-site bloodwork and diagnostics.',
        longDescription:
            'Convenient on-site collection for routine bloodwork, screening '
            'panels and physician-ordered diagnostics.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/staff_member/7',
        icon: Icons.science,
      ),
      ClinicServiceModel(
        id: 'concussion',
        name: 'Concussion Rehab',
        shortDescription: 'Structured return-to-activity care.',
        longDescription:
            'Multidisciplinary concussion management — assessment, vestibular '
            'therapy, vision, exertion testing and gradual return to school, '
            'work and sport.',
        bookingUrl:
            'https://infinityhealthcentre.janeapp.com/locations/infinity-health-centre-toronto/book#/staff_member/9',
        icon: Icons.psychology_alt,
      ),
      ClinicServiceModel(
        id: 'travel',
        name: 'Travel Medicine',
        shortDescription: 'Pre-travel consults and vaccinations.',
        longDescription:
            'Destination-specific risk assessments, vaccinations, malaria '
            'prophylaxis prescriptions and travel health advice.',
        bookingUrl: 'https://infinityhealthcentre.janeapp.com/',
        icon: Icons.flight_takeoff,
      ),
      ClinicServiceModel(
        id: 'minor-procedures',
        name: 'Minor Procedures',
        shortDescription: 'In-office surgical procedures.',
        longDescription:
            'Skin lesion removal, cryotherapy, joint injections, suturing '
            'and other minor procedures performed by qualified physicians.',
        bookingUrl: 'https://infinityhealthcentre.janeapp.com/',
        icon: Icons.cut,
      ),
    ];
  }
}
