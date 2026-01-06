import 'package:atg/features/feed/widgets/reaction_section.dart';
import 'package:flutter/material.dart';
import './models/Post_model.dart';

class FeedPostCard extends StatefulWidget {
  final PostModel post;
  final Function(bool)? onLike;
  final VoidCallback? onShare;
  final VoidCallback? onSave;
  final VoidCallback? onComment;

  const FeedPostCard({
    super.key,
    required this.post,
    this.onLike,
    this.onShare,
    this.onSave,
    this.onComment,
  });

  @override
  State<FeedPostCard> createState() => _FeedPostCardState();
}

class _FeedPostCardState extends State<FeedPostCard> {
  bool _isLiked = false;
  bool _isSaved = false;
  double _imageHeight = 280;
  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.post.isLiked;
    _isSaved = widget.post.isSaved;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
    widget.onLike?.call(_isLiked);
  }

  void _toggleSave() {
    setState(() {
      _isSaved = !_isSaved;
    });
    widget.onSave?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFF0F0F0), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info with menu
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 12),
            child: Row(
              children: [
                // Profile with story indicator
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: widget.post.hasStory
                        ? const LinearGradient(
                            colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                  ),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(widget.post.UserImage),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // User info with verification badge
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.post.username,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          if (widget.post.isVerified)
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.verified,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            widget.post.timeAgo,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            Icons.public,
                            size: 12,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // More options button
                IconButton(
                  onPressed: () {
                    _showMoreOptions(context);
                  },
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.grey.shade600,
                    size: 24,
                  ),
                  splashRadius: 20,
                ),
              ],
            ),
          ),

          // Post content with read more
          if (widget.post.postContent.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildPostContent(),
            ),

          // Post image with zoom capability
          if (widget.post.postImage.isNotEmpty)
            GestureDetector(
              onTap: () {
                // Open full screen image view
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // Image with fade-in animation
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _imageLoaded ? 1.0 : 0.0,
                        child: Image.asset(
                          widget.post.postImage,
                          width: double.infinity,
                          height: _imageHeight,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Loading indicator
                      if (!_imageLoaded)
                        Container(
                          height: _imageHeight,
                          width: double.infinity,
                          color: Colors.grey.shade100,
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF2196F3),
                              ),
                            ),
                          ),
                        ),

                      // Image overlay for interactions
                      if (_imageLoaded)
                        Positioned(
                          bottom: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.photo_library,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${widget.post.imageCount}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

          // Preload image and set loaded state
          if (widget.post.postImage.isNotEmpty)
            FutureBuilder(
              future: _preloadImage(widget.post.postImage),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!_imageLoaded) {
                      setState(() {
                        _imageLoaded = true;
                      });
                    }
                  });
                }
                return const SizedBox.shrink();
              },
            ),

          // Stats bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Like reactions
                _buildReactionIcons(),
                const Spacer(),
                // Comments and shares count
                if (widget.post.commentCount > 0)
                  Row(
                    children: [
                      Text(
                        '${widget.post.commentCount} comments',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                if (widget.post.shareCount > 0)
                  Text(
                    '${widget.post.shareCount} shares',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
              ],
            ),
          ),

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade100,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: _isLiked ? Icons.favorite : Icons.favorite_outline,
                  label: 'Like',
                  isActive: _isLiked,
                  onTap: _toggleLike,
                  activeColor: Colors.red,
                ),
                _buildActionButton(
                  icon: Icons.mode_comment_outlined,
                  label: 'Comment',
                  onTap: widget.onComment,
                ),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onTap: widget.onShare,
                ),
                _buildActionButton(
                  icon: _isSaved ? Icons.bookmark : Icons.bookmark_outline,
                  label: 'Save',
                  isActive: _isSaved,
                  onTap: _toggleSave,
                  activeColor: Colors.amber,
                ),
              ],
            ),
          ),

          // Reaction section (existing)
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Future<void> _preloadImage(String imagePath) async {
    try {
      final image = AssetImage(imagePath);
      await precacheImage(image, context);
    } catch (e) {
      // Handle image loading error
      print('Error loading image: $e');
    }
  }

  Widget _buildPostContent() {
    const int maxLines = 3;
    final text = widget.post.postContent;
    final exceeded = text.length > 150;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exceeded ? '${text.substring(0, 150)}...' : text,
          style: const TextStyle(
            fontSize: 15,
            height: 1.5,
            color: Color(0xFF333333),
          ),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        if (exceeded)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: GestureDetector(
              onTap: () {
                // Show full content
              },
              child: Text(
                'See more',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildReactionIcons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.red, size: 16),
          const SizedBox(width: 2),
          Text(
            _formatNumber(widget.post.likeCount),
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.thumb_up, color: Colors.blue, size: 16),
          const SizedBox(width: 2),
          Text(
            '${widget.post.reactionCount}',
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    bool isActive = false,
    Color? activeColor,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isActive
                      ? activeColor ?? Theme.of(context).primaryColor
                      : Colors.grey.shade600,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isActive
                        ? activeColor ?? Theme.of(context).primaryColor
                        : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOptionTile(
                icon: Icons.notifications_off_outlined,
                title: 'Mute notifications',
                onTap: () {},
              ),
              _buildOptionTile(
                icon: Icons.flag_outlined,
                title: 'Report post',
                onTap: () {},
                color: Colors.red,
              ),
              _buildOptionTile(
                icon: Icons.block,
                title: 'Block user',
                onTap: () {},
                color: Colors.red,
              ),
              _buildOptionTile(
                icon: Icons.content_copy,
                title: 'Copy link',
                onTap: () {},
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.grey.shade700),
      title: Text(
        title,
        style: TextStyle(color: color ?? Colors.grey.shade800, fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    );
  }
}

// Add these properties to your PostModel class
extension PostModelExtension on PostModel {
  bool get isLiked => false; // Add this property to your model
  bool get isSaved => false; // Add this property to your model
  bool get isVerified => false; // Add this property to your model
  bool get hasStory => false; // Add this property to your model
  String get timeAgo => ''; // Add this property to your model
  int get likeCount => 0; // Add this property to your model
  int get reactionCount => 0; // Add this property to your model
  int get commentCount => 0; // Add this property to your model
  int get shareCount => 0; // Add this property to your model
  int get imageCount => 1; // Add this property to your model
}
