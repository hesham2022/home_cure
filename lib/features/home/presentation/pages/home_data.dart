import 'package:home_cure/gen/assets.gen.dart';

class Service {
  Service({
    required this.title,
    required this.photo,
    required this.children,
    required this.mainService,
    this.numberOfSessions = false,
    this.price,
    this.period,
    this.days,
    this.features,
    this.isPackage = false,
  });
  final bool isPackage;
  final String title;
  final String mainService;
  final String? photo;
  final double? price;
  final int? period;
  final int? days;
  final bool numberOfSessions;
  final List<Service> children;
  final Map<String, dynamic>? features;
  @override
  String toString() {
    return title;
  }
}

final homeDoctor = Service(
  mainService: 'Home Doctor', //630a21791f84589ab92621cf
  title: 'Home Doctor',
  photo: Assets.img.image1.path,
  children: [
    Service(
      mainService: 'Home Doctor',
      title: 'Neurologists',

      ///630a225cb1d9ba9bff24fef6
      photo: Assets.svg.brain.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Cardiology', //630a2397b1d9ba9bff24ff05
      photo: Assets.svg.cardiolgy.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Geriatic Medicine',
      photo: Assets.svg.graiticMediciene.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Internal diseases',
      photo: Assets.svg.spcialist.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Pulmonology',
      photo: Assets.svg.pulmonolgy.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'ophthalmology',
      photo: Assets.svg.opthalomogy.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Urology',
      photo: Assets.svg.urology.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Psychiatry',
      photo: Assets.svg.psycharity.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Orthopedics',
      photo: Assets.svg.orthopedics.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'General Surgery',
      photo: Assets.svg.generalSurgery.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Dermatology',
      photo: Assets.svg.dermatology.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'General practitioner',
      photo: Assets.svg.generalPractitioner.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Pediatrician',
      photo: Assets.svg.pediatrician.path,
      children: subHomeDoctor,
    ),
    Service(
      mainService: 'Home Doctor',
      title: 'Corona Care',
      photo: Assets.svg.coronaCare.path,
      children: subHomeDoctor,
    ),
  ],
);
final subHomeDoctor = [
//   {
//     "title": "Consultant",
//     "description": "Consultant",
//     "active": true,
//     "timeSlots": ["62a6a4359a31d3e0bbdca6e4"],
//     "holidays": [
//         1
//     ],
//     "photo":"assets/svg/consultant.svg",
//     "price": 850,
//     "priceDiscount": 20
// }

// {
//     "title": "Spicialist",
//     "description": "Spicialist",
//     "active": true,
//     "timeSlots": ["62a6a4359a31d3e0bbdca6e4"],
//     "holidays": [
//         1
//     ],
//     "photo":"assets/svg/spcialist.svg",
//     "price": 550,
//     "priceDiscount": 20
// }
  Service(
    mainService: 'Home Doctor',
    title: 'Consultant',
    photo: Assets.svg.consultant.path,
    price: 850,
    children: [],
  ),
  Service(
    mainService: 'Home Doctor',
    title: 'Spicialist',
    photo: Assets.svg.spcialist.path,
    price: 550,
    children: [],
  ),
];
final subVdeoConsultant = [
  Service(
    mainService: 'Home Doctor',
    title: 'Consultant',
    photo: Assets.svg.consultant.path,
    price: 150,
    children: [],
  ),
  Service(
    mainService: 'Home Doctor',
    title: 'Spicialist',
    photo: Assets.svg.spcialist.path,
    price: 250,
    children: [],
  ),
];
final homeNursing = Service(
  mainService: 'Home Nursing',
  title: 'Home Nursing',
  photo: Assets.img.doctorMeasuringBloodPressureOlderPatient8557411302.path,
  children: [
    Service(
      mainService: 'Home Nursing',
      title: 'Nurse',
      photo: Assets.svg.professionalNurse.path,
      children: [
        Service(
          mainService: 'Home Nursing',
          title: '12 hrs',
          photo: '',
          children: [],
          price: 550,
        ),
        Service(
          mainService: 'Home Nursing',
          title: '24 hrs',
          photo: '',
          children: [],
          price: 950,
        ),
        Service(
          mainService: 'Home Nursing',
          title: 'Quick Service (catheterization, wound, care, bed sores)',
          photo: Assets.svg.quickService.path,
          children: [],
          price: 650,
        )
      ],
    ),
    Service(
      mainService: 'Home Nursing',
      title: 'Professional Nurse',
      photo: Assets.svg.professionalNurse.path,
      children: [
        Service(
          mainService: 'Home Nursing',
          title: '12 hrs',
          photo: '',
          children: [],
          price: 550,
        ),
        Service(
          mainService: 'Home Nursing',
          title: '24 hrs',
          photo: '',
          children: [],
          price: 950,
        ),
        Service(
          mainService: 'Home Nursing',
          title: 'Quick Service (catheterization, wound, care, bed sores)',
          photo: Assets.svg.quickService.path,
          children: [],
          price: 650,
        )
      ],
    ),
    Service(
      mainService: 'Home Nursing',
      title: 'Nurse Aid',
      photo: Assets.svg.nurseAid.path,
      children: [
        Service(
          mainService: 'Home Nursing',
          title: '12 hrs',
          photo: '',
          children: [],
          price: 450,
        ),
        Service(
          mainService: 'Home Nursing',
          title: '24 hrs',
          photo: '',
          children: [],
          price: 650,
        ),
      ],
    ),
  ],
);

class ElderyPackage {
  ElderyPackage(this.title, this.price);

  final String title;
  final int price;
}

final elderyPackages = <ElderyPackage>[
  //
  ElderyPackage('', 0)
  //
];

final eldryCare = Service(
  mainService: 'Eldery Care',
  title: 'Eldery Care',
  photo: Assets.img.caregiverHoldingOldManSShoulder232148239034.path,
  children: [
    Service(
      mainService: 'Eldery Care',
      // title: 'Professional Nurse',
      title: 'Nurse Assistant 12 Hours',

      photo: Assets.svg.professionalNurse.path,

      children: [
        Service(
          mainService: 'Eldery Care',
          title: '1 day',
          photo: '',
          days: 1,
          price: 100,
          children: [],
        ),
        Service(
          mainService: 'Eldery Care',
          title: '7 days',
          days: 7,
          photo: '',
          price: 3500,
          children: [],
        ),
        Service(
          mainService: 'Eldery Care',
          title: '15 days',
          photo: '',
          price: 6500,
          days: 15,
          children: [],
        ),
        Service(
          mainService: 'Eldery Care',
          title: '30 days',
          photo: '',
          days: 30,
          children: [],
          price: 11500,
        ),
      ],
    ),
    Service(
      mainService: 'Eldery Care',
      // title: 'Nurse Aid',
      title: 'Nurse Assistant 24 Hours',
      photo: Assets.svg.professionalNurse.path,

      // photo: Assets.svg.nurseAid.path,
      children: [
        Service(
          mainService: 'Eldery Care',
          title: '1',
          days: 1,
          photo: '',
          price: 200,
          children: [],
        ),
        Service(
          mainService: 'Eldery Care',
          title: '7 days',
          photo: '',
          price: 5000,
          days: 7,
          children: [],
        ),
        Service(
          mainService: 'Eldery Care',
          title: '15 days',
          photo: '',
          days: 15,
          children: [],
          price: 9500,
        ),
        Service(
          mainService: 'Eldery Care',
          title: '30 days',
          days: 30,
          photo: '',
          children: [],
          price: 19000,
        ),
      ],
    ),
  ],
);

final videoConsultation = Service(
  mainService: 'Video Consultation',
  title: 'Video Consultation',
  photo: Assets.img.image1.path,
  children: [
    Service(
      mainService: 'Video Consultation',
      title: 'Neurologists',
      photo: Assets.svg.brain.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Cardiology',
      photo: Assets.svg.cardiolgy.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Geriatic Medicine',
      photo: Assets.svg.graiticMediciene.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Internal diseases',
      photo: Assets.svg.spcialist.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Pulmonology',
      photo: Assets.svg.pulmonolgy.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'ophthalmology',
      photo: Assets.svg.opthalomogy.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Urology',
      photo: Assets.svg.urology.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Psychiatry',
      photo: Assets.svg.psycharity.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Orthopedics',
      photo: Assets.svg.orthopedics.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'General Surgery',
      photo: Assets.svg.generalSurgery.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Dermatology',
      photo: Assets.svg.dermatology.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'General practitioner',
      photo: Assets.svg.generalPractitioner.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Pediatrician',
      photo: Assets.svg.pediatrician.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Video Consultation',
      title: 'Corona Care',
      photo: Assets.svg.coronaCare.path,
      children: subVdeoConsultant,
    ),
  ],
);

final telemedicine = Service(
  mainService: 'Telemedicine',
  title: 'Telemedicine',
  photo: Assets.img.doctorOfferingMedicalTeleconsultation232149328978.path,
  children: [
    Service(
      mainService: 'Telemedicine',
      title: 'Neurologists',
      photo: Assets.svg.brain.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Cardiology',
      photo: Assets.svg.cardiolgy.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Geriatic Medicine',
      photo: Assets.svg.graiticMediciene.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Internal diseases',
      photo: Assets.svg.spcialist.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Pulmonology',
      photo: Assets.svg.pulmonolgy.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'ophthalmology',
      photo: Assets.svg.opthalomogy.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Urology',
      photo: Assets.svg.urology.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Psychiatry',
      photo: Assets.svg.psycharity.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Orthopedics',
      photo: Assets.svg.orthopedics.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'General Surgery',
      photo: Assets.svg.generalSurgery.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Dermatology',
      photo: Assets.svg.dermatology.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'General practitioner',
      photo: Assets.svg.generalPractitioner.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Pediatrician',
      photo: Assets.svg.pediatrician.path,
      children: subVdeoConsultant,
    ),
    Service(
      mainService: 'Telemedicine',
      title: 'Corona Care',
      photo: Assets.svg.coronaCare.path,
      children: subVdeoConsultant,
    ),
  ],
);
final services = [
  homeDoctor,
  homeNursing,
  Service(
    isPackage: true,
    price: 500,
    mainService: 'Radiology',
    title: 'Radiology',
    photo: Assets.img.portraitConfidentYoungMaleDoctor1713375165.path,
    children: [],
    features: <String, dynamic>{'1': 'Laps/Radiology Requests'},
  ),
  Service(
    mainService: 'Physiotherapy',
    title: 'Physiotherapy',
    photo: Assets.img.physiotherapist.path,
    children: [
      Service(
        numberOfSessions: true,
        mainService: 'Home Doctor',
        title: 'Consultant',
        photo: Assets.svg.consultant.path,
        children: [],
      ),
      Service(
        numberOfSessions: true,
        mainService: 'Home Doctor',
        title: 'Spicialist',
        photo: Assets.svg.spcialist.path,
        children: [],
      ),
    ],
  ),
  telemedicine,
  videoConsultation,
  eldryCare,
  Service(
    isPackage: true,
    price: 500,
    mainService: 'Maternity Care',
    title: 'Maternity Care',
    photo: Assets.img.pregnantWomanGynecologistDoctorHospital319651155.path,
    children: [],
    features: <String, dynamic>{'1': 'Maternity Follow up Request'},
  ),

  /// TDOD
  Service(
    mainService: 'Our Doctors',
    title: 'Our Doctors',
    photo: Assets.img.ourDoctors.path,
    children: [
      Service(
        mainService: 'Our Doctors',
        title: 'Cardiology',
        photo: Assets.svg.cardiolgy.path,
        children: [],
      ),
      Service(
        mainService: 'Our Doctors',
        title: 'INTERNAL MEDICINE',
        photo: Assets.svg.spcialist.path,
        children: [],
      ),
      Service(
        mainService: 'Our Doctors',
        title: 'OEB/GYN',
        photo: Assets.svg.maternity.path,
        children: [],
      ),
      Service(
        mainService: 'Our Doctors',
        title: 'E.N.T',
        photo: Assets.svg.ent.path,
        children: [],
      ),
      Service(
        mainService: 'Our Doctors',
        title: 'PEDIATRICS',
        photo: Assets.svg.pediatrics.path,
        children: [],
      ),
      Service(
        mainService: 'Our Doctors',
        title: 'GERIATRICS',
        photo: Assets.svg.geriatrics.path,
        children: [],
      ),
      Service(
        mainService: 'Our Doctors',
        title: 'CHEST',
        photo: Assets.svg.pulmonolgy.path,
        children: [],
      ),
    ],
  ),
];
