import 'package:flutter/material.dart';
import 'package:practice4/components/item_card.dart';
import 'package:practice4/global/lists.dart';
import 'package:practice4/pages/add_book_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _navigateToAddNote(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddBookPage()),
    );

    if (result != null) {
      setState(() {
        items.add(result);
      });
    }
  }

  void _removeNote(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Книги"),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                "В библиотеке пусто 🤷\nПопробуйте добавить книгу",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCard(
                  itemIndex: index,
                  removeNote: _removeNote,
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddNote(context),
        tooltip: 'Добавить книгу',
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
