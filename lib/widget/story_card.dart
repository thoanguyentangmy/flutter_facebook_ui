import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/models/story_model.dart';
import 'package:flutter_facebook_ui/models/user_model.dart';
import 'package:flutter_facebook_ui/widget/profile_avatar.dart';

class StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const StoryCard(
      {Key key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            height: double.infinity,
            width: 110.0,
            decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12.0),
            )),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add),
              iconSize: 30.0,
              color: Palette.facebookBlue,
              onPressed: () => print('Add to Story'),
            ),
          )
              : ProfileAvatar(
            imageUrl: story.user.imageUrl,
            hasBorder: !story.isViewed,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add to Story' : story.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
