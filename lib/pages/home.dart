import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userToDo;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['Купить продукты', 'Помыть посуду', 'Погладить вещи']);
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('Меню'),
            centerTitle: true,),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }, child: Text('На главный экран',
                  style: TextStyle(fontSize: 30))),
            ],
          )
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Список дел'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: _menuOpen,
                icon: Icon(Icons.menu_outlined)
            ),
          ],
        ),
      body: ListView.builder(
        itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_sweep_outlined,
                          color: Colors.red
                        ),
                        onPressed: () {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },
                      ),
                  ),
              ),
            onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
            },
          );
          }
      ),
      floatingActionButton: FloatingActionButton( //при нажатии на кнопку появляется всплывающее окно
        backgroundColor: Colors.cyan,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Добавить задачу'),
              content: TextField(      //текстовое поле
                onChanged: (String value) {
                  _userToDo = value; //значение элемента
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {  //при нажатии на кнопку добавляется новый элемент списка
                  setState(() {
                    todoList.add(_userToDo); //записываем значение из переменной выше
                  });
                  Navigator.of(context).pop();  //после добавления задачи окно закрывается
                }, child: Text('Готово'))
              ],
            );
          });
        },
        child: Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
