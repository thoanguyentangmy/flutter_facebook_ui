import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/data/data.dart';
import 'package:flutter_facebook_ui/models/post_model.dart';
import 'package:flutter_facebook_ui/widget/circle_button.dart';
import 'package:flutter_facebook_ui/widget/create_pos_container.dart';
import 'package:flutter_facebook_ui/widget/post_container.dart';
import 'package:flutter_facebook_ui/widget/rooms.dart';
import 'package:flutter_facebook_ui/widget/stories.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            actions: [
              CircleButton(
                  icon: Icons.search,
                  iconSize: 30,
                  onPressed: () => print("Search")),
              CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30,
                  onPressed: () => print("Messenger")),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePosContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
