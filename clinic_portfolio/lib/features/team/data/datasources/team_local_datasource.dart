import '../models/team_member_model.dart';

abstract class TeamLocalDataSource {
  Future<List<TeamMemberModel>> fetchAll();
}

class TeamLocalDataSourceImpl implements TeamLocalDataSource {
  const TeamLocalDataSourceImpl();
  static const _bookingUrl =
      'https://infinityhealthcentre.com/book-an-appointment/';

  @override
  Future<List<TeamMemberModel>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 250));
    return const [
      TeamMemberModel(
        id: 'daria-pylypiak',
        name: 'Dr. Daria Pylypiak',
        title: 'Family Physician',
        specialty: 'Family Medicine',
        initials: 'DP',
        imageUrl:
            'https://infinityhealthcentre.com/wp-content/uploads/2021/02/imageedit_2_7576836861-circle-e1614035721346.jpg',
        bookingUrl: _bookingUrl,
        bio:
            'Dr. Pylypiak provides comprehensive primary care for patients of '
            'all ages, with special interests in preventive medicine and '
            'women\'s health.',
      ),
      TeamMemberModel(
        id: 'james-yoon',
        name: 'Dr. James Yoon',
        title: 'Family Physician',
        specialty: 'Family Medicine',
        initials: 'JY',
        imageUrl:
            'https://infinityhealthcentre.com/wp-content/uploads/2021/02/Dr-James-Yoon-photo1.png',
        bookingUrl: _bookingUrl,
        bio:
            'Dr. Yoon is a family physician offering same-day urgent care and '
            'longitudinal primary care across the lifespan.',
      ),
      TeamMemberModel(
        id: 'suneel-sharman',
        name: 'Dr. Suneel Sharman',
        title: 'Family Physician',
        specialty: 'Family Medicine',
        initials: 'SS',
        imageUrl:
            'https://infinityhealthcentre.com/wp-content/uploads/2021/02/Suneel-circle-e1614035729107.jpg',
        bookingUrl: _bookingUrl,
        bio:
            'Dr. Sharman focuses on chronic disease management, men\'s health '
            'and travel medicine consultations.',
      ),
      TeamMemberModel(
        id: 'karim-riskallah',
        name: 'Dr. Karim Riskallah',
        title: 'Family Physician',
        specialty: 'Family Medicine',
        initials: 'KR',
        imageUrl:
            'https://infinityhealthcentre.com/wp-content/uploads/2021/02/pic-3-circle-scaled-e1614035702945.jpg',
        bookingUrl: _bookingUrl,
        bio:
            'Dr. Riskallah provides walk-in and continuity care with an '
            'interest in sports medicine and musculoskeletal complaints.',
      ),
      TeamMemberModel(
        id: 'simo-partanen',
        name: 'Simo Partanen',
        title: 'Registered Physiotherapist',
        specialty: 'Physiotherapy',
        initials: 'SP',
        imageUrl:
            'https://infinityhealthcentre.com/wp-content/uploads/2022/01/IMG-20220124-WA0003-uai-455x455.jpg',
        bookingUrl: _bookingUrl,
        bio:
            'Simo is a senior physiotherapist with expertise in manual '
            'therapy, sports rehab and post-surgical recovery.',
      ),
      TeamMemberModel(
        id: 'tim-lin',
        name: 'Tim Lin',
        title: 'Registered Massage Therapist',
        specialty: 'Massage Therapy',
        initials: 'TL',
        imageUrl:
            'https://infinityhealthcentre.com/wp-content/uploads/2021/03/TIM2-scaled-uai-1949x1949.jpg',
        bookingUrl: _bookingUrl,
        bio:
            'Tim is an RMT specializing in deep tissue, sports and '
            'therapeutic massage for desk-bound professionals.',
      ),
      TeamMemberModel(
        id: 'alan-fung',
        name: 'Alan Fung',
        title: 'Chiropractor',
        specialty: 'Chiropractic',
        initials: 'AF',
        imageUrl:
            'https://infinityhealthcentre.com/wp-content/uploads/2021/04/A2.png',
        bookingUrl: _bookingUrl,
        bio:
            'Dr. Fung treats spinal, joint and soft-tissue conditions using '
            'evidence-informed adjustments and rehabilitation.',
      ),
    ];
  }
}
