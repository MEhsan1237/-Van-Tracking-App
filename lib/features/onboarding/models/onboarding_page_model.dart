enum OnboardingType {
  tracking,
  qrSafety,
  notifications,
  connectedTransport,
}

class OnboardingPageModel {
  final String title;
  final String description;
  final OnboardingType type;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.type,
  });

  static final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: 'Track Every Journey',
      description: "Follow your child's school van in real time and stay informed throughout every journey.",
      type: OnboardingType.tracking,
    ),
    OnboardingPageModel(
      title: 'Safer Pickups & Drops',
      description: 'Secure QR verification helps confirm every authorized pickup and drop with greater confidence.',
      type: OnboardingType.qrSafety,
    ),
    OnboardingPageModel(
      title: 'Always Know Their Status',
      description: 'Receive timely updates for boarding, school arrival, return trips and important transport activity.',
      type: OnboardingType.notifications,
    ),
    OnboardingPageModel(
      title: 'Ready for Safer Journeys',
      description: 'Parents, students, drivers and schools stay connected through one smart transport experience.',
      type: OnboardingType.connectedTransport,
    ),
  ];
}
