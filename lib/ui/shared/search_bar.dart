import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) search;
  final String searchBarHintText;
  final String initialText;
  const SearchBar({
    Key? key,
    required this.search,
    required this.searchBarHintText,
    this.initialText = '',
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = widget.initialText;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      height: 40,
      child: TextFormField(
        controller: textController,
        textAlignVertical: TextAlignVertical.center,
        style: appTheme.textTheme.bodyText2,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
          ),
          hintText: widget.searchBarHintText,
          prefixIcon: const Icon(Icons.search),
        ),
        onChanged: (String word) {
          final wordToSearch = word.trim();
          widget.search(wordToSearch.toLowerCase());
        },
      ),
    );
  }
}
