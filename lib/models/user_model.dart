// User Model

class UserModel {
  final String firstName, lastName, website;
  const UserModel(this.firstName, this.lastName, this.website);

  UserModel.fromJson(
    Map<String, dynamic> json,
  )   : firstName = json["first_name"],
        lastName = json["last_name"],
        website = json["website"];
}

// UserList Model

class UserListModel {
  final List<UserModel> userList;
  UserListModel(this.userList);

  UserListModel.fromJson(List<dynamic> usersJson)
      : userList = usersJson.map((user) => UserModel.fromJson(user)).toList();
}
