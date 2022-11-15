import 'package:flutter/material.dart';
import 'lists.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Списки"),
        ),
        body: const UsersList(),
      ),
    ),
  );
}

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  UsersListState createState() => UsersListState();
}

class UsersListState extends State<UsersList> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: users.length,
            itemBuilder: _createListView,
          ),
        ),
        Expanded(
          child: Image.asset(
            selectedIndex == -1
                ? "assets/images/bf0.png"
                : userimages[selectedIndex],
            height: 180,
            width: 180,
            alignment: Alignment.topCenter,
          ),
        ),
        Expanded(
          child: Text(
            selectedIndex == -1 ? "" : detailsUsers[selectedIndex],
            style: const TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // устанавливаем индекс выделенного элемента
          selectedIndex = index;
        });
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: index == selectedIndex
              ? Color.fromARGB(255, 252, 239, 198)
              : Colors.white60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: SizedBox(
                  height: 30,
                  child: Text(
                    users[index],
                    style: const TextStyle(fontSize: 22),
                    selectionColor: index == selectedIndex
                        ? Color.fromARGB(255, 252, 239, 198)
                        : Colors.white60,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
