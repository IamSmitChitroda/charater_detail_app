import 'package:character_detail_app/utills/charactor_detail_utills.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> Data = (ModalRoute.of(context)?.settings.arguments ??
        freeFireCharacters[0]) as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(Data['name']),
        backgroundColor: Colors.amber,
      ),
      body: Hero(
        tag: 'tmp',
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/a5/d6/72/a5d672656c6b6fed6c145673ac686e46.jpg"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: size.height * 0.45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Data['image']),
                        fit: BoxFit.fitHeight),
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: size.height * 0.40,
                  width: double.infinity,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Ability:",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "                   ${Data['abilities'][0]}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.amberAccent),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Date of Brith:",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ("   ${Data['Date of birth']}"),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.amberAccent),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
