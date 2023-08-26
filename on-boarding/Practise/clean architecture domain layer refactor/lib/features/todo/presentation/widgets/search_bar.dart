import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_basics/features/todo/presentation/bloc/task_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController queryController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            width: 379,
            height: 70.5,
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: queryController,
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          width: 52,
          height: 70.5,
          child: ElevatedButton(
            onPressed: () {
              _filterTasks(context); // Clear the search query
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Icon(
              Icons.search, // Clear icon
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }

  void _filterTasks(BuildContext context) {
    if (queryController.text.isNotEmpty ) {
      BlocProvider.of<TaskBloc>(context).add(FilterTasks(query: queryController.text));
    } else {
      BlocProvider.of<TaskBloc>(context).add(const LoadTasks());
    }
  }
}
