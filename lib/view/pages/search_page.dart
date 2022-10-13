import 'package:flutter/material.dart';

import '../widget/home_page/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Container(
        margin:
            const EdgeInsets.only(top: 200, bottom: 50, right: 10, left: 10),
        child: SearchTextForm(),
      ),
    );
  }
}
