class DoneParams {
  DoneParams({required this.id, required this.providerComment});

  final String id;
  final String providerComment;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'providerComment': providerComment,
    };
  }
}
