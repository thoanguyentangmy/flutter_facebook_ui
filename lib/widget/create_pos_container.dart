import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/models/models.dart';
import 'package:flutter_facebook_ui/widget/profile_avatar.dart';

class CreatePosContainer extends StatelessWidget {
  final User currentUser;

  const CreatePosContainer({Key key, @required this.currentUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl, ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?'),
                ),
              )
            ],
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () => print('Live'),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text('Live'),
                ),
                const VerticalDivider(width: 8),
                FlatButton.icon(
                  onPressed: () => print('Photo'),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text('Photo'),
                ),
                const VerticalDivider(width: 8),
                FlatButton.icon(
                  onPressed: () => print('Room'),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: Text('Room'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
