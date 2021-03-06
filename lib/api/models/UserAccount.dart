class UserAccount {
  int id;
  String url;
  String bio;
  String avatar;
  String avatarName;
  String cover;
  String coverName;
  int reputation;
  String reputationName;
  int created;
  bool proExpiration;
  UserFollow userFollow;
  bool isBlocked;

  UserAccount(
      {this.id,
        this.url,
        this.bio,
        this.avatar,
        this.avatarName,
        this.cover,
        this.coverName,
        this.reputation,
        this.reputationName,
        this.created,
        this.proExpiration,
        this.userFollow,
        this.isBlocked});

  UserAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    bio = json['bio'];
    avatar = json['avatar'];
    avatarName = json['avatar_name'];
    cover = json['cover'];
    coverName = json['cover_name'];
    reputation = json['reputation'];
    reputationName = json['reputation_name'];
    created = json['created'];
    proExpiration = json['pro_expiration'];
    userFollow = json['user_follow'] != null
        ? new UserFollow.fromJson(json['user_follow'])
        : null;
    isBlocked = json['is_blocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['bio'] = this.bio;
    data['avatar'] = this.avatar;
    data['avatar_name'] = this.avatarName;
    data['cover'] = this.cover;
    data['cover_name'] = this.coverName;
    data['reputation'] = this.reputation;
    data['reputation_name'] = this.reputationName;
    data['created'] = this.created;
    data['pro_expiration'] = this.proExpiration;
    if (this.userFollow != null) {
      data['user_follow'] = this.userFollow.toJson();
    }
    data['is_blocked'] = this.isBlocked;
    return data;
  }
}

class UserFollow {
  bool status;

  UserFollow({this.status});

  UserFollow.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}