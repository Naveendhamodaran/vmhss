class StaffModel {
  String image;
  String fullName;
  String mobileNumber;
  String gender;
  String address;
  String email;
  DateTime dob;
  DateTime joiningDate;
  String qualification;
  String totalExperience;
  String designation;
  String esi;
  String aadhaarCardNumber;
  String panCardNumber;
  String aadhaarCardImage;
  String panCardImage;
  String resumeImage;

  StaffModel(
      {required this.image,
      required this.fullName,
      required this.mobileNumber,
      required this.gender,
      required this.address,
      required this.email,
      required this.dob,
      required this.joiningDate,
      required this.qualification,
      required this.totalExperience,
      required this.designation,
      required this.esi,
      required this.aadhaarCardNumber,
      required this.panCardNumber,
      required this.aadhaarCardImage,
      required this.panCardImage,
      required this.resumeImage});

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "full_name": fullName,
      "mobile_number": mobileNumber,
      "gender": gender,
      "address": address,
      "email": email,
      "dob": dob,
      "joining_date": joiningDate,
      "qualification": qualification,
      "totalExperience": totalExperience,
      "designation": designation,
      "esi": esi,
      "aadhar_card_number": aadhaarCardNumber,
      "pan_card_number": panCardNumber,
      "aadhar_card_image": aadhaarCardImage,
      "pan_card_image": panCardImage,
      "resume_image": resumeImage
    };
  }
}
