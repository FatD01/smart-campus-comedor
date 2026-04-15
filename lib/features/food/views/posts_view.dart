import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/voting/views/voting_widget_view.dart';

class PostsScreen extends StatelessWidget {
   
  const PostsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Column(
          children: [
            Text('PostsScreen'),
            Expanded(child: VotingWidget()),
          ],
         ),
      ),
    );
  }
}