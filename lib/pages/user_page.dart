import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/models/user_model.dart';

class MyUserPage extends StatelessWidget {
  const MyUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text("FutureProvider Example"),
        ),
        Consumer(builder: (context, List<UserModel> userList, _) {
          return Expanded(
              child: userList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, ind) {
                        return Container(
                          height: 50,
                          color: Colors.grey[(ind * 200) % 400],
                          child: Center(
                            child: Text(
                                "${userList[ind].firstName} ${userList[ind].lastName} ${userList[ind].website}"),
                          ),
                        );
                      },
                    ));
        })
      ],
    );
  }
}
