


class MainComment{
  final List<CommentData> comments;
  final int total;
  final int skip;
  final int limit;
  MainComment({
    required this.comments,
    required this.limit,
    required this.skip,
    required this.total
});
}



class CommentData {
  final int id;
  final String body;
  final int postId;
  final UserData user;

  CommentData(
      {required this.id,
      required this.postId,
      required this.body,
      required this.user,
      });
  factory CommentData.fromJson(Map<String, dynamic> json){
    return CommentData(
      id: json['id'],
      body: json['body'],
      postId: json['postId'],
      user: UserData.fromJson(json['user'])
    );
  }
}

class UserData {
  final int id;
  final String username;
  UserData({required this.id, required this.username});

  factory UserData.fromJson(Map<String, dynamic> json){
      return UserData(id: json['id'], username: json['username']);
  }
}
