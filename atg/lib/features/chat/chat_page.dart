// lib/features/chat/chat_page.dart
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Using your blue color scheme
  static const Color _unPrimary = Color(0xFF1c97da);
  static const Color _unSecondary = Color(0xFF1E88E5);
  static const Color _unLight = Color(0xFFE3F2FD);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _bgLight = Color(0xFFF8FAFB);
  static const Color _bgCard = Color(0xFFFEFEFF);
  static const Color _borderLight = Color(0xFFF0F4F8);
  static const Color _textPrimary = Color(0xFF1A202C);
  static const Color _textSecondary = Color(0xFF4A5568);
  static const Color _textTertiary = Color(0xFF718096);
  static const Color _textQuaternary = Color(0xFFA0AEC0);
  static const Color _accentGreen = Color(0xFF38B2AC);
  static const Color _accentRed = Color(0xFFF56565);
  static const Color _accentOrange = Color(0xFFED8936);
  static const Color _accentIndigo = Color(0xFF667EEA);
  static const Color _accentBlue = Color(0xFF4299E1);

  int _selectedSpace = 0; // 0 = Personal, 1 = Community
  Map<String, dynamic>?
  _selectedChat; // Currently selected chat for conversation
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _messageFocusNode = FocusNode();

  // Personal Chats (Direct Messages)
  final List<Map<String, dynamic>> _personalChats = [
    {
      'id': '1',
      'name': 'Haritha Pawan',
      'role': 'Finance Director',
      'lastMessage': 'Can you review the Q4 financial report?',
      'time': '10:30 AM',
      'unread': 3,
      'avatar': 'HP',
      'color': 0xFF0065B3, // Blue
      'online': true,
      'lastSeen': '10:25 AM',
      'typing': false,
      'muted': false,
      'pinned': true,
      'messages': [
        {
          'id': '1',
          'text': 'Hi, how are you?',
          'sender': 'me',
          'time': '10:00 AM',
          'read': true,
        },
        {
          'id': '2',
          'text': 'I\'m good, thanks! How about the project?',
          'sender': 'HP',
          'time': '10:05 AM',
          'read': true,
        },
        {
          'id': '3',
          'text': 'Going well. Can you review the Q4 financial report?',
          'sender': 'HP',
          'time': '10:30 AM',
          'read': false,
        },
      ],
    },
    {
      'id': '2',
      'name': 'Naveen',
      'role': 'Operations Manager',
      'lastMessage': 'Meeting notes from the coordination session',
      'time': 'Yesterday',
      'unread': 0,
      'avatar': 'AC',
      'color': 0xFF9F7AEA, // Purple
      'online': true,
      'lastSeen': '2:15 PM',
      'typing': true,
      'muted': true,
      'pinned': true,
      'messages': [
        {
          'id': '1',
          'text': 'Meeting notes from the coordination session',
          'sender': 'AC',
          'time': 'Yesterday',
          'read': true,
        },
      ],
    },
    {
      'id': '3',
      'name': 'Tharindu',
      'role': 'Project Lead',
      'lastMessage': 'Project timeline updated, check the attachment',
      'time': '2 days ago',
      'unread': 1,
      'avatar': 'SJ',
      'color': 0xFF38B2AC, // Teal
      'online': false,
      'lastSeen': 'Yesterday',
      'typing': false,
      'muted': false,
      'pinned': false,
      'messages': [],
    },
    {
      'id': '4',
      'name': 'Sanuu',
      'role': 'Partnership Director',
      'lastMessage': '📎 Client partnership documents ready for review',
      'time': '3 days ago',
      'unread': 0,
      'avatar': 'MW',
      'color': 0xFFF56565, // Red
      'online': true,
      'lastSeen': '11:45 AM',
      'typing': false,
      'muted': false,
      'pinned': false,
      'messages': [],
    },
    {
      'id': '5',
      'name': 'Maneesha',
      'role': 'HR Manager',
      'lastMessage': 'Interview scheduled for tomorrow at 11 AM',
      'time': '4 days ago',
      'unread': 0,
      'avatar': 'EW',
      'color': 0xFFED8936, // Orange
      'online': false,
      'lastSeen': '2 days ago',
      'typing': false,
      'muted': true,
      'pinned': false,
      'messages': [],
    },
  ];

  // Community Chats (Group Chats)
  final List<Map<String, dynamic>> _communityChats = [
    {
      'id': '1',
      'name': 'Executive Team',
      'role': '12 members',
      'lastMessage': 'Nisindu: Q3 results meeting moved to Friday',
      'time': '10:15 AM',
      'unread': 5,
      'avatar': 'ET',
      'color': 0xFF0065B3,
      'online': true,
      'members': 12,
      'admins': ['HP', 'AC'],
      'muted': false,
      'pinned': true,
      'messages': [],
    },
    {
      'id': '2',
      'name': 'Project Alpha',
      'role': '8 members',
      'lastMessage': 'Nisindu: Final milestone achieved! 🎉',
      'time': 'Yesterday',
      'unread': 0,
      'avatar': 'PA',
      'color': 0xFF9F7AEA,
      'online': false,
      'members': 8,
      'admins': ['SJ'],
      'muted': true,
      'pinned': true,
      'messages': [],
    },
    {
      'id': '3',
      'name': 'Marketing Updates',
      'role': '24 members',
      'lastMessage': 'New campaign launch this Friday',
      'time': '2 days ago',
      'unread': 12,
      'avatar': 'MU',
      'color': 0xFF38B2AC,
      'online': true,
      'members': 24,
      'admins': ['MW', 'HP'],
      'muted': false,
      'pinned': false,
      'messages': [],
    },
    {
      'id': '4',
      'name': 'Finance Department',
      'role': '6 members',
      'lastMessage': 'Haritha: Budget review meeting at 3 PM',
      'time': '3 days ago',
      'unread': 0,
      'avatar': 'FD',
      'color': 0xFF667EEA,
      'online': false,
      'members': 6,
      'admins': ['HP'],
      'muted': false,
      'pinned': false,
      'messages': [],
    },
  ];

  // Messages for the conversation view
  final List<Map<String, dynamic>> _conversationMessages = [];

  @override
  Widget build(BuildContext context) {
    // If a chat is selected, show conversation view
    if (_selectedChat != null) {
      return _buildConversationView();
    }

    // Otherwise show chat list view
    return Scaffold(
      backgroundColor: _white,
      body: SafeArea(
        child: Column(
          children: [
            // Clean Header
            _buildCleanHeader(),

            // Spaces Tabs (Personal/Community)
            _buildBeautifulSpacesTabs(),

            // Search Bar
            _buildBeautifulSearchBar(),

            // Conversations List
            Expanded(child: _buildBeautifulChatsList()),
          ],
        ),
      ),

      // New Message Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewChatDialog();
        },
        backgroundColor: _unPrimary,
        elevation: 8,
        shape: const CircleBorder(),
        child: const Icon(
          LucideIcons.messageSquarePlus,
          color: _white,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildCleanHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      decoration: BoxDecoration(
        color: _white,
        border: Border(bottom: BorderSide(color: _borderLight, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Chats',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: _textPrimary,
              letterSpacing: -1,
            ),
          ),

          // Action Buttons
          Row(
            children: [
              // Camera
              _buildHeaderIconButton(
                icon: LucideIcons.camera,
                onPressed: () {},
              ),
              const SizedBox(width: 12),

              // Search
              _buildHeaderIconButton(
                icon: LucideIcons.search,
                onPressed: () {},
              ),
              const SizedBox(width: 12),

              // More Options
              PopupMenuButton<String>(
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _bgLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    LucideIcons.moreVertical,
                    size: 20,
                    color: _textSecondary,
                  ),
                ),
                color: _white,
                surfaceTintColor: _white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: _borderLight, width: 1),
                ),
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'new_group',
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.users,
                            size: 18,
                            color: _textSecondary,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'New group',
                            style: TextStyle(color: _textPrimary, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'settings',
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.settings,
                            size: 18,
                            color: _textSecondary,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Settings',
                            style: TextStyle(color: _textPrimary, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'archived',
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.archive,
                            size: 18,
                            color: _textSecondary,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Archived chats',
                            style: TextStyle(color: _textPrimary, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: _bgLight, shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(icon, size: 20, color: _textSecondary),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildBeautifulSpacesTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: _white,
        border: Border(bottom: BorderSide(color: _borderLight, width: 1)),
      ),
      child: Row(
        children: [
          // Personal Tab
          _buildSpaceTab(
            label: 'Personal',
            isActive: _selectedSpace == 0,
            count: _personalChats.length,
            onTap: () => setState(() => _selectedSpace = 0),
          ),

          const SizedBox(width: 24),

          // Community Tab
          _buildSpaceTab(
            label: 'Community',
            isActive: _selectedSpace == 1,
            count: _communityChats.length,
            onTap: () => setState(() => _selectedSpace = 1),
          ),
        ],
      ),
    );
  }

  Widget _buildSpaceTab({
    required String label,
    required bool isActive,
    required int count,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isActive ? _unPrimary : _textTertiary,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: isActive ? _unPrimary.withOpacity(0.1) : _bgLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isActive ? _unPrimary : _textTertiary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isActive ? 32 : 0,
            height: 3,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [_unPrimary, _unSecondary],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBeautifulSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: _white,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: _bgLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Icon(LucideIcons.search, size: 18, color: _textTertiary),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: _textPrimary,
                  height: 1.4,
                ),
                decoration: InputDecoration(
                  hintText: 'Search messages or contacts...',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: _textQuaternary,
                    height: 1.4,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildBeautifulChatsList() {
    final chats = _selectedSpace == 0 ? _personalChats : _communityChats;

    // Sort: Pinned first, then by time
    chats.sort((a, b) {
      if (a['pinned'] != b['pinned']) {
        return b['pinned'] ? 1 : -1;
      }
      return 0;
    });

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return _buildBeautifulChatItem(chat);
      },
    );
  }

  Widget _buildBeautifulChatItem(Map<String, dynamic> chat) {
    bool isPersonal = _selectedSpace == 0;
    Color avatarColor = Color(chat['color'] as int);

    return Material(
      color: _white,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedChat = chat;
            if (chat['messages'] != null) {
              _conversationMessages.clear();
              _conversationMessages.addAll(
                chat['messages']!.cast<Map<String, dynamic>>(),
              );
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: _borderLight, width: 1)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar with online indicator
              Stack(
                children: [
                  // Avatar Circle
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: avatarColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: avatarColor.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        chat['avatar'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  // Online indicator for personal chats
                  if (isPersonal && chat['online'])
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: _accentGreen,
                          shape: BoxShape.circle,
                          border: Border.all(color: _white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 16),

              // Chat Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            chat['name'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: chat['unread'] > 0
                                  ? FontWeight.w700
                                  : FontWeight.w600,
                              color: _textPrimary,
                              height: 1.3,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Time
                        Text(
                          chat['time'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _textTertiary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 2),

                    // Role/Group info
                    Text(
                      chat['role'],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: _textTertiary,
                        height: 1.4,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Last message with status indicators
                    Row(
                      children: [
                        // Typing indicator
                        if (isPersonal && chat['typing'])
                          Expanded(
                            child: Text(
                              'typing...',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: _unPrimary,
                                fontStyle: FontStyle.italic,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        else
                          Expanded(
                            child: Row(
                              children: [
                                // Status icons (only for sent messages)
                                if (chat['unread'] == 0 && isPersonal)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: Icon(
                                      LucideIcons.checkCheck,
                                      size: 14,
                                      color: _accentBlue,
                                    ),
                                  ),

                                // Muted icon
                                if (chat['muted'])
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: Icon(
                                      LucideIcons.bellOff,
                                      size: 14,
                                      color: _textTertiary,
                                    ),
                                  ),

                                // Pinned icon
                                if (chat['pinned'])
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: Icon(
                                      LucideIcons.pin,
                                      size: 12,
                                      color: _accentOrange,
                                    ),
                                  ),

                                // Message preview
                                Expanded(
                                  child: Text(
                                    chat['lastMessage'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: chat['unread'] > 0
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      color: chat['unread'] > 0
                                          ? _textPrimary
                                          : _textSecondary,
                                      height: 1.4,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Unread count badge
                        if (chat['unread'] > 0)
                          Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [_unPrimary, _unSecondary],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: _unPrimary.withOpacity(0.3),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                chat['unread'] > 9 ? '9+' : '${chat['unread']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
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
    );
  }

  Widget _buildConversationView() {
    return Scaffold(
      backgroundColor: _white,
      appBar: AppBar(
        backgroundColor: _white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(LucideIcons.arrowLeft, color: _textPrimary, size: 24),
          onPressed: () {
            setState(() {
              _selectedChat = null;
              _conversationMessages.clear();
            });
          },
        ),
        title: GestureDetector(
          onTap: () {
            // TODO: Show contact info
          },
          child: Row(
            children: [
              // Avatar with tap animation
              Hero(
                tag: 'avatar_${_selectedChat!['id']}',
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(_selectedChat!['color'] as int),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(
                          _selectedChat!['color'] as int,
                        ).withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _selectedChat!['avatar'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedChat!['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _textPrimary,
                      ),
                    ),
                    Text(
                      _selectedSpace == 0
                          ? _selectedChat!['role']
                          : '${_selectedChat!['members']} members • ${_selectedChat!['online'] ? 'Online' : 'Offline'}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: _textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(LucideIcons.phone, color: _unPrimary, size: 22),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(LucideIcons.video, color: _unPrimary, size: 22),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              LucideIcons.moreVertical,
              color: _textSecondary,
              size: 22,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(child: _buildMessagesList()),

          // Message Input
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [_white, _bgLight],
        ),
      ),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(20),
        reverse: false,
        itemCount: _conversationMessages.length,
        itemBuilder: (context, index) {
          final message = _conversationMessages[index];
          final isMe = message['sender'] == 'me';

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildMessageBubble(message, isMe),
          );
        },
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message, bool isMe) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe) ...[
          // Avatar for received messages
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Color(_selectedChat!['color'] as int),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _selectedChat!['avatar'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],

        // Message bubble
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isMe ? _unPrimary : _white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: isMe
                    ? const Radius.circular(20)
                    : const Radius.circular(4),
                bottomRight: isMe
                    ? const Radius.circular(4)
                    : const Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isMe ? 0.1 : 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message['text'],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: isMe ? _white : _textPrimary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      message['time'],
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: isMe ? _white.withOpacity(0.8) : _textTertiary,
                      ),
                    ),
                    if (isMe) ...[
                      const SizedBox(width: 4),
                      Icon(
                        message['read'] == true
                            ? LucideIcons.checkCheck
                            : LucideIcons.check,
                        size: 12,
                        color: message['read'] == true
                            ? _accentGreen
                            : _white.withOpacity(0.6),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),

        if (isMe) const SizedBox(width: 32), // Spacing for sent messages
      ],
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _white,
        border: Border(top: BorderSide(color: _borderLight, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Emoji button
          _buildInputIconButton(icon: LucideIcons.smile, onPressed: () {}),

          // Attachment button
          _buildInputIconButton(icon: LucideIcons.paperclip, onPressed: () {}),

          // Message input field
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: _bgLight,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _messageController,
                focusNode: _messageFocusNode,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: _textPrimary,
                  height: 1.4,
                ),
                decoration: InputDecoration(
                  hintText: 'Message...',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: _textTertiary,
                    height: 1.4,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                maxLines: 4,
                minLines: 1,
                onSubmitted: (value) {
                  _sendMessage();
                },
              ),
            ),
          ),

          // Send button
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: _messageController.text.isEmpty ? 40 : 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: _messageController.text.isEmpty
                  ? null
                  : const LinearGradient(
                      colors: [_unPrimary, _unSecondary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
              color: _messageController.text.isEmpty ? _bgLight : null,
              shape: BoxShape.circle,
              boxShadow: _messageController.text.isEmpty
                  ? null
                  : [
                      BoxShadow(
                        color: _unPrimary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: IconButton(
              icon: Icon(
                _messageController.text.isEmpty
                    ? LucideIcons.mic
                    : LucideIcons.send,
                size: 20,
                color: _messageController.text.isEmpty
                    ? _textSecondary
                    : _white,
              ),
              onPressed: _sendMessage,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: _bgLight, shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(icon, size: 20, color: _textSecondary),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) {
      // TODO: Implement voice recording
      return;
    }

    setState(() {
      _conversationMessages.add({
        'id': '${_conversationMessages.length + 1}',
        'text': _messageController.text,
        'sender': 'me',
        'time':
            '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
        'read': false,
      });

      // Clear input
      _messageController.clear();

      // Scroll to bottom
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });

      // Update last message in chat list
      if (_selectedChat != null) {
        _selectedChat!['lastMessage'] = _conversationMessages.last['text'];
        _selectedChat!['time'] = _conversationMessages.last['time'];
        _selectedChat!['unread'] = 0; // Reset unread when we send a message
      }
    });

    // Simulate reply after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _selectedChat != null) {
        setState(() {
          _conversationMessages.add({
            'id': '${_conversationMessages.length + 1}',
            'text': _getAutoReply(_selectedChat!['name']),
            'sender': _selectedChat!['avatar'],
            'time':
                '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
            'read': true,
          });

          // Mark previous sent message as read
          if (_conversationMessages.length > 2) {
            _conversationMessages[_conversationMessages.length - 3]['read'] =
                true;
          }
        });
      }
    });
  }

  String _getAutoReply(String name) {
    final replies = [
      'Got it, thanks!',
      'I\'ll check that now.',
      'Sounds good!',
      'Let me get back to you on that.',
      'Perfect, thanks for the update!',
    ];
    return replies[DateTime.now().millisecondsSinceEpoch % replies.length];
  }

  void _showNewChatDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: _white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _borderLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Text(
                  'New Message',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: _textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: _bgLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: _textPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search contacts...',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: _textTertiary,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(LucideIcons.search, color: _textTertiary),
                  ),
                ),
              ),
              // TODO: Add contact list here
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Implement starting new chat
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _unPrimary,
                    foregroundColor: _white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Start New Chat',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
}
