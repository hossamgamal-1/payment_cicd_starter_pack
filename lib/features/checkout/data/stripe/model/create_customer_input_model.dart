class CreateCustomerInputModel {
  final String email;
  final String name;

  const CreateCustomerInputModel({
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
    };
  }
}
