class StudentModel {
  String image;
  String fullName;
  String admissionNo;
  String gender;
  String address;
  String joiningSttanderd;
  DateTime dob;
  DateTime joiningDate;
  String medium;
  String firstLanguage;
  String nationality;
  String state;
  String religion;
  String cast;
  String community;
  String motherToungue;
  String previousSchool;
  String previousStanderds;

  StudentModel({
    required this.image,
    required this.fullName,
    required this.admissionNo,
    required this.gender,
    required this.address,
    required this.joiningSttanderd,
    required this.dob,
    required this.joiningDate,
    required this.cast,
    required this.community,
    required this.firstLanguage,
    required this.medium,
    required this.motherToungue,
    required this.nationality,
    required this.previousSchool,
    required this.previousStanderds,
    required this.religion,
    required this.state,
  });

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "full_name": fullName,
      "admission_No": admissionNo,
      "gender": gender,
      "address": address,
      "joining_standerd": joiningSttanderd,
      "dob": dob,
      "joining_date": joiningDate,
      "medium": medium,
      "first_language": firstLanguage,
      "nationality": nationality,
      "state": state,
      "religion": religion,
      "cast": cast,
      "community": community,
      "mother_tounge": motherToungue,
      "previous_school": previousSchool,
      "previous_statnderd": previousStanderds
    };
  }
}
