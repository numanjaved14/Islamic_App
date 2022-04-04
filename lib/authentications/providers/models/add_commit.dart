class AddCommit {
  final String title;
  final String uid;
  final String photoUrl;

  const AddCommit({
    required this.title,
    required this.uid,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'uid': uid,
        'photoUrl': photoUrl,
        'dateTime': DateTime.now(),
      };
}
