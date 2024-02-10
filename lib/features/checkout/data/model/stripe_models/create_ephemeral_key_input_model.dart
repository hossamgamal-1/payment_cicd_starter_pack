class CreateEphemeralKeyInputModel {
  final String customerId;

  const CreateEphemeralKeyInputModel(this.customerId);

  Map<String, dynamic> toJson() => {'customer': customerId};
}
