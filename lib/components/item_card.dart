import 'package:flutter/material.dart';
import 'package:practice4/global/lists.dart';
import 'package:practice4/pages/item_page.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key, required this.itemIndex, required this.removeNote});

  final int itemIndex; // Проп для названия заметки
  final Function removeNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        // Виджет для того, чтобы весь child стал кликабельным
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemPage(
                        itemIndex: itemIndex,
                      ))),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).primaryColor),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  items[itemIndex].imageLink,
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.black12, width: 2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Кнопка перехода на другую страницу
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              items[itemIndex].title,
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                items[itemIndex].author,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ))
                        ],
                      ),
                      Text(
                        "Страниц: ${items[itemIndex].pageCount}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  ),
                  onPressed: () => removeNote(itemIndex),
                )
              ],
            )),
          ),
        ));
  }
}
