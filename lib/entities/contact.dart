class Contact {
  String userId;
  String name;
  String avatar;

  Contact(this.userId, this.name, this.avatar);

  @override
  String toString() {
    return "UserId: $userId, Name: $name, Avatar $avatar";
  }
}
