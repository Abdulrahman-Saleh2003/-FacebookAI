import 'package:facebook/models/models.dart';
import 'package:facebook/widget/widget.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({super.key, required this.currentUser});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "What's on your mind?",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ],
          ),

          const Divider(height: 1, thickness: 0.5, color: Colors.grey),

          SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.videocam,
                  color: Colors.red,
                  label: 'Live',
                  onPressed: () => print('Live'),
                ),
                const VerticalDivider(width: 1, thickness: 0.8, color: Colors.grey),
                _buildActionButton(
                  icon: Icons.photo_library,
                  color: Colors.green,
                  label: 'Photo',
                  onPressed: () => print('Photo'),
                ),
                const VerticalDivider(width: 1, thickness: 0.8, color: Colors.grey),
                _buildActionButton(
                  icon: Icons.video_call,
                  color: Colors.purpleAccent,
                  label: 'Room',
                  onPressed: () => print('Room'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color, size: 26),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black87, fontSize: 13),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}