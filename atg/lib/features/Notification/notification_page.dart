import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Premium Color System
  static const Color _primary = Color(0xFF0065B3);
  static const Color _primaryLight = Color(0xFF1E88E5);
  static const Color _primaryLighter = Color(0xFFE3F2FD);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _bgLight = Color(0xFFF8FAFB);
  static const Color _bgCard = Color(0xFFFEFEFF);
  static const Color _borderLight = Color(0xFFF0F4F8);
  static const Color _textPrimary = Color(0xFF1A202C);
  static const Color _textSecondary = Color(0xFF4A5568);
  static const Color _textTertiary = Color(0xFF718096);
  static const Color _textQuaternary = Color(0xFFA0AEC0);

  // Notification Type Colors
  static const Color _typeSuccess = Color(0xFF38B2AC);
  static const Color _typeInfo = Color(0xFF4299E1);
  static const Color _typeWarning = Color(0xFFED8936);
  static const Color _typeError = Color(0xFFF56565);
  static const Color _typeSystem = Color(0xFF9F7AEA);
  static const Color _typeTask = Color(0xFF48BB78);
  static const Color _typeMessage = Color(0xFFED64A6);
  static const Color _typeProject = Color(0xFF667EEA);

  // Typography
  static const TextStyle _display = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: _textPrimary,
    letterSpacing: -0.8,
    height: 1.2,
  );

  static const TextStyle _titleLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: _textPrimary,
    letterSpacing: -0.3,
    height: 1.3,
  );

  static const TextStyle _titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: _textPrimary,
    letterSpacing: -0.2,
    height: 1.4,
  );

  static const TextStyle _titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: _textPrimary,
    letterSpacing: -0.1,
    height: 1.4,
  );

  static const TextStyle _bodyLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: _textSecondary,
    height: 1.6,
    letterSpacing: 0.1,
  );

  static const TextStyle _bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _textSecondary,
    height: 1.5,
    letterSpacing: 0.1,
  );

  static const TextStyle _bodySmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: _textTertiary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  static const TextStyle _caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: _textTertiary,
    letterSpacing: 0.2,
  );

  static const TextStyle _label = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: _textQuaternary,
    letterSpacing: 0.5,
  );

  // Notification Categories
  final List<String> _categories = [
    'All',
    'Unread',
    'Tasks',
    'Messages',
    'System',
    'Projects',
    'Team',
    'Announcements',
  ];

  // Sample Notifications Data
  final List<Map<String, dynamic>> _notifications = [
    {
      'id': '1',
      'title': 'Task Completed',
      'message': 'Design dashboard layout has been completed by Alex Morgan',
      'type': 'task',
      'category': 'Tasks',
      'icon': LucideIcons.checkCircle,
      'iconColor': _typeTask,
      'time': DateTime.now().subtract(const Duration(minutes: 5)),
      'read': false,
      'important': true,
      'action': 'view_task',
      'sender': {
        'name': 'Alex Morgan',
        'avatar': 'AM',
        'role': 'UI/UX Designer',
      },
      'metadata': {'taskId': 'T-1234', 'project': 'Dashboard Redesign'},
    },
    {
      'id': '2',
      'title': 'New Message',
      'message': 'Lisa Wang sent you a message about the marketing campaign',
      'type': 'message',
      'category': 'Messages',
      'icon': LucideIcons.messageCircle,
      'iconColor': _typeMessage,
      'time': DateTime.now().subtract(const Duration(minutes: 15)),
      'read': false,
      'important': false,
      'action': 'open_chat',
      'sender': {'name': 'Lisa Wang', 'avatar': 'LW', 'role': 'Marketing Lead'},
      'metadata': {
        'conversationId': 'C-5678',
        'preview': 'Can we review the campaign metrics?',
      },
    },
    {
      'id': '3',
      'title': 'System Alert',
      'message': 'Database maintenance scheduled for tonight at 2:00 AM',
      'type': 'system',
      'category': 'System',
      'icon': LucideIcons.server,
      'iconColor': _typeSystem,
      'time': DateTime.now().subtract(const Duration(minutes: 30)),
      'read': true,
      'important': true,
      'action': 'view_details',
      'sender': {
        'name': 'System',
        'avatar': 'SYS',
        'role': 'System Notification',
      },
      'metadata': {'maintenanceTime': '2:00 AM - 4:00 AM', 'impact': 'Low'},
    },
    {
      'id': '4',
      'title': 'Project Update',
      'message': 'Backend Services project progress is now at 65%',
      'type': 'project',
      'category': 'Projects',
      'icon': LucideIcons.trendingUp,
      'iconColor': _typeProject,
      'time': DateTime.now().subtract(const Duration(hours: 1)),
      'read': true,
      'important': false,
      'action': 'view_project',
      'sender': {
        'name': 'Project Tracker',
        'avatar': 'PT',
        'role': 'Automated',
      },
      'metadata': {
        'projectId': 'P-9012',
        'progress': 65,
        'previousProgress': 45,
      },
    },
    {
      'id': '5',
      'title': 'Team Announcement',
      'message':
          'New team member joined: Raj Patel as Senior Backend Developer',
      'type': 'announcement',
      'category': 'Team',
      'icon': LucideIcons.users,
      'iconColor': _typeInfo,
      'time': DateTime.now().subtract(const Duration(hours: 2)),
      'read': true,
      'important': false,
      'action': 'view_profile',
      'sender': {
        'name': 'HR Department',
        'avatar': 'HR',
        'role': 'Human Resources',
      },
      'metadata': {
        'newMemberId': 'U-3456',
        'position': 'Senior Backend Developer',
      },
    },
    {
      'id': '6',
      'title': 'Deadline Reminder',
      'message': 'Budget Planning for Q1 task is due in 2 days',
      'type': 'reminder',
      'category': 'Tasks',
      'icon': LucideIcons.calendar,
      'iconColor': _typeWarning,
      'time': DateTime.now().subtract(const Duration(hours: 3)),
      'read': true,
      'important': true,
      'action': 'view_task',
      'sender': {'name': 'Task Reminder', 'avatar': 'TR', 'role': 'Automated'},
      'metadata': {
        'taskId': 'T-7890',
        'dueDate': DateTime.now().add(const Duration(days: 2)),
        'priority': 'High',
      },
    },
    {
      'id': '7',
      'title': 'Meeting Invitation',
      'message':
          'You are invited to the Q2 Planning Meeting tomorrow at 10:00 AM',
      'type': 'meeting',
      'category': 'Team',
      'icon': LucideIcons.video,
      'iconColor': _typeInfo,
      'time': DateTime.now().subtract(const Duration(hours: 4)),
      'read': true,
      'important': false,
      'action': 'respond_invitation',
      'sender': {
        'name': 'Maria Silva',
        'avatar': 'MS',
        'role': 'Operations Manager',
      },
      'metadata': {
        'meetingId': 'M-1234',
        'time': 'Tomorrow, 10:00 AM',
        'duration': '2 hours',
      },
    },
    {
      'id': '8',
      'title': 'Document Shared',
      'message':
          'Financial Report Q4 has been shared with you by Sarah Williams',
      'type': 'document',
      'category': 'Projects',
      'icon': LucideIcons.fileText,
      'iconColor': _typeSuccess,
      'time': DateTime.now().subtract(const Duration(hours: 5)),
      'read': true,
      'important': false,
      'action': 'view_document',
      'sender': {
        'name': 'Sarah Williams',
        'avatar': 'SW',
        'role': 'Financial Analyst',
      },
      'metadata': {'documentId': 'D-5678', 'type': 'PDF', 'size': '2.4 MB'},
    },
    {
      'id': '9',
      'title': 'Approval Required',
      'message': 'Your approval is needed for the new marketing budget',
      'type': 'approval',
      'category': 'Tasks',
      'icon': LucideIcons.thumbsUp,
      'iconColor': _typeWarning,
      'time': DateTime.now().subtract(const Duration(hours: 6)),
      'read': true,
      'important': true,
      'action': 'review_request',
      'sender': {
        'name': 'Finance Team',
        'avatar': 'FT',
        'role': 'Finance Department',
      },
      'metadata': {
        'requestId': 'R-9012',
        'amount': '\$25,000',
        'deadline': '48 hours',
      },
    },
    {
      'id': '10',
      'title': 'Security Alert',
      'message': 'New login detected from unknown device',
      'type': 'security',
      'category': 'System',
      'icon': LucideIcons.shieldAlert,
      'iconColor': _typeError,
      'time': DateTime.now().subtract(const Duration(hours: 8)),
      'read': true,
      'important': true,
      'action': 'review_security',
      'sender': {
        'name': 'Security System',
        'avatar': 'SEC',
        'role': 'Security',
      },
      'metadata': {
        'location': 'New York, USA',
        'device': 'Chrome on Windows',
        'time': 'Yesterday, 11:30 PM',
      },
    },
    {
      'id': '11',
      'title': 'Milestone Achieved',
      'message': 'Project "User Experience" has reached 50% completion',
      'type': 'milestone',
      'category': 'Projects',
      'icon': LucideIcons.flag,
      'iconColor': _typeSuccess,
      'time': DateTime.now().subtract(const Duration(days: 1)),
      'read': true,
      'important': false,
      'action': 'view_milestone',
      'sender': {
        'name': 'Project Tracker',
        'avatar': 'PT',
        'role': 'Automated',
      },
      'metadata': {
        'projectId': 'P-3456',
        'milestone': 'User Research Phase',
        'progress': 50,
      },
    },
    {
      'id': '12',
      'title': 'Team Collaboration',
      'message': 'Sam Chen mentioned you in a comment on API documentation',
      'type': 'mention',
      'category': 'Messages',
      'icon': LucideIcons.atSign,
      'iconColor': _typeMessage,
      'time': DateTime.now().subtract(const Duration(days: 2)),
      'read': true,
      'important': false,
      'action': 'view_comment',
      'sender': {
        'name': 'Sam Chen',
        'avatar': 'SC',
        'role': 'Backend Developer',
      },
      'metadata': {
        'documentId': 'D-7890',
        'section': 'Authentication API',
        'preview': 'Can you review this section?',
      },
    },
  ];

  // State Variables
  String _selectedCategory = 'All';
  bool _showOnlyUnread = false;
  String _searchQuery = '';
  int _unreadCount = 2; // Based on sample data

  @override
  Widget build(BuildContext context) {
    final filteredNotifications = _filterNotifications();

    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            // Categories Filter
            _buildCategoriesFilter(),
            // Notifications Content
            Expanded(child: _buildNotificationsContent(filteredNotifications)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      decoration: BoxDecoration(
        color: _bgCard,
        border: Border(bottom: BorderSide(color: _borderLight, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Notifications', style: _display.copyWith(fontSize: 24)),
                  const SizedBox(height: 4),
                  Text(
                    '$_unreadCount unread notifications',
                    style: _bodySmall.copyWith(color: _textTertiary),
                  ),
                ],
              ),
              const Spacer(),
              // Mark All as Read Button
              _buildHeaderAction(
                icon: LucideIcons.check,
                label: 'Mark All Read',
                onTap: _markAllAsRead,
              ),
              const SizedBox(width: 8),
              // Settings Button
              _buildHeaderAction(
                icon: LucideIcons.settings,
                label: 'Settings',
                onTap: _openNotificationSettings,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: _bgLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _borderLight, width: 1.5),
            ),
            child: Row(
              children: [
                Icon(LucideIcons.search, size: 18, color: _textTertiary),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search notifications...',
                      hintStyle: _bodySmall.copyWith(color: _textQuaternary),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: _bodyMedium,
                  ),
                ),
                if (_searchQuery.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _searchQuery = '';
                      });
                    },
                    child: Icon(LucideIcons.x, size: 16, color: _textTertiary),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _primary.withOpacity(0.2), width: 1),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: _primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: _caption.copyWith(
                color: _primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesFilter() {
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          // Unread Toggle
          GestureDetector(
            onTap: () {
              setState(() {
                _showOnlyUnread = !_showOnlyUnread;
                if (_showOnlyUnread) {
                  _selectedCategory = 'Unread';
                }
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: _showOnlyUnread ? _primary : _bgCard,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _showOnlyUnread ? _primary : _borderLight,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _showOnlyUnread ? LucideIcons.bell : LucideIcons.bell,
                    size: 14,
                    color: _showOnlyUnread ? _white : _textTertiary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Unread',
                    style: _caption.copyWith(
                      fontWeight: FontWeight.w600,
                      color: _showOnlyUnread ? _white : _textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Category Filters
          ..._categories.map((category) {
            if (category == 'Unread') return const SizedBox.shrink();
            final isActive = _selectedCategory == category;
            final count = _getCategoryCount(category);
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildCategoryChip(category, isActive, count),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category, bool isActive, int count) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
          _showOnlyUnread = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? _primary : _bgCard,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive ? _primary : _borderLight,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Text(
              category,
              style: _caption.copyWith(
                fontWeight: FontWeight.w600,
                color: isActive ? _white : _textTertiary,
              ),
            ),
            if (count > 0)
              Container(
                margin: const EdgeInsets.only(left: 6),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isActive
                      ? _white.withOpacity(0.2)
                      : _primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '$count',
                  style: _label.copyWith(
                    color: isActive ? _white : _primary,
                    fontSize: 9,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationsContent(List<Map<String, dynamic>> notifications) {
    if (notifications.isEmpty) {
      return _buildEmptyState();
    }

    // Group notifications by date
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    final todayNotifications = notifications.where((n) {
      final time = n['time'] as DateTime;
      return time.year == today.year &&
          time.month == today.month &&
          time.day == today.day;
    }).toList();

    final yesterdayNotifications = notifications.where((n) {
      final time = n['time'] as DateTime;
      return time.year == yesterday.year &&
          time.month == yesterday.month &&
          time.day == yesterday.day;
    }).toList();

    final olderNotifications = notifications.where((n) {
      final time = n['time'] as DateTime;
      return !(time.year == today.year &&
              time.month == today.month &&
              time.day == today.day) &&
          !(time.year == yesterday.year &&
              time.month == yesterday.month &&
              time.day == yesterday.day);
    }).toList();

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Today Section
        if (todayNotifications.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Text(
                'Today',
                style: _titleSmall.copyWith(
                  color: _textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        if (todayNotifications.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  0,
                  20,
                  index == todayNotifications.length - 1 ? 16 : 8,
                ),
                child: _buildNotificationCard(todayNotifications[index]),
              ),
              childCount: todayNotifications.length,
            ),
          ),

        // Yesterday Section
        if (yesterdayNotifications.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Text(
                'Yesterday',
                style: _titleSmall.copyWith(
                  color: _textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        if (yesterdayNotifications.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  0,
                  20,
                  index == yesterdayNotifications.length - 1 ? 16 : 8,
                ),
                child: _buildNotificationCard(yesterdayNotifications[index]),
              ),
              childCount: yesterdayNotifications.length,
            ),
          ),

        // Older Section
        if (olderNotifications.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Text(
                'Older',
                style: _titleSmall.copyWith(
                  color: _textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        if (olderNotifications.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  0,
                  20,
                  index == olderNotifications.length - 1 ? 20 : 8,
                ),
                child: _buildNotificationCard(olderNotifications[index]),
              ),
              childCount: olderNotifications.length,
            ),
          ),
      ],
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification) {
    final isUnread = notification['read'] == false;
    final isImportant = notification['important'] == true;
    final iconColor = notification['iconColor'] as Color;

    return GestureDetector(
      onTap: () => _handleNotificationTap(notification),
      onLongPress: () => _showNotificationOptions(notification),
      child: Container(
        decoration: BoxDecoration(
          color: _bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _borderLight, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Unread Indicator
            if (isUnread)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: _primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        notification['icon'] as IconData,
                        size: 20,
                        color: iconColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Time
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                notification['title'] as String,
                                style: _titleSmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isUnread
                                      ? _textPrimary
                                      : _textSecondary,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              _formatTime(notification['time'] as DateTime),
                              style: _caption.copyWith(color: _textTertiary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),

                        // Message
                        Text(
                          notification['message'] as String,
                          style: _bodyMedium.copyWith(color: _textSecondary),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 15),

                        // Sender and Actions
                        Row(
                          children: [
                            // Sender
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _borderLight,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: _textTertiary.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        (notification['sender']['avatar']
                                                as String)
                                            .substring(0, 1),
                                        style: _label.copyWith(
                                          color: _textTertiary,
                                          fontSize: 9,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    notification['sender']['name'] as String,
                                    style: _caption.copyWith(
                                      color: _textTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),

                            // Quick Actions
                            if (!isUnread)
                              Row(
                                children: [
                                  _buildQuickActionButton(
                                    icon: LucideIcons.archive,
                                    tooltip: 'Archive',
                                    onTap: () =>
                                        _archiveNotification(notification),
                                  ),
                                  const SizedBox(width: 8),
                                  _buildQuickActionButton(
                                    icon: LucideIcons.trash2,
                                    tooltip: 'Delete',
                                    onTap: () =>
                                        _deleteNotification(notification),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Important Badge
            if (isImportant)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: _typeError.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: _typeError.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.alertTriangle,
                        size: 10,
                        color: _typeError,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Important',
                        style: _label.copyWith(color: _typeError, fontSize: 9),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: _borderLight,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(child: Icon(icon, size: 14, color: _textTertiary)),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: _primaryLighter,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                LucideIcons.bellOff,
                size: 40,
                color: _textQuaternary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No notifications',
            style: _titleMedium.copyWith(color: _textPrimary),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              _selectedCategory == 'All'
                  ? 'You\'re all caught up! No notifications at the moment.'
                  : 'No ${_selectedCategory.toLowerCase()} notifications to show.',
              textAlign: TextAlign.center,
              style: _bodyMedium.copyWith(color: _textTertiary),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _markAllAsRead,
            style: ElevatedButton.styleFrom(
              backgroundColor: _primary,
              foregroundColor: _white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Mark All as Read'),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return DateFormat('MMM d').format(time);
    }
  }

  int _getCategoryCount(String category) {
    if (category == 'All') return _notifications.length;
    if (category == 'Unread')
      return _notifications.where((n) => n['read'] == false).length;
    return _notifications.where((n) => n['category'] == category).length;
  }

  List<Map<String, dynamic>> _filterNotifications() {
    List<Map<String, dynamic>> filtered = List.from(_notifications);

    // Apply category filter
    if (_selectedCategory != 'All') {
      if (_selectedCategory == 'Unread') {
        filtered = filtered.where((n) => n['read'] == false).toList();
      } else {
        filtered = filtered
            .where((n) => n['category'] == _selectedCategory)
            .toList();
      }
    }

    // Apply unread filter
    if (_showOnlyUnread) {
      filtered = filtered.where((n) => n['read'] == false).toList();
    }

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((n) {
        final title = n['title'] as String;
        final message = n['message'] as String;
        final sender = n['sender']['name'] as String;

        return title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            message.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            sender.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    // Sort by time (newest first)
    filtered.sort(
      (a, b) => (b['time'] as DateTime).compareTo(a['time'] as DateTime),
    );

    return filtered;
  }

  void _handleNotificationTap(Map<String, dynamic> notification) {
    // Mark as read
    if (notification['read'] == false) {
      setState(() {
        notification['read'] = true;
        _unreadCount--;
      });
    }

    // Handle different actions based on notification type
    final action = notification['action'] as String;

    switch (action) {
      case 'view_task':
        _showTaskDetails(notification);
        break;
      case 'open_chat':
        _openChat(notification);
        break;
      case 'view_details':
        _showDetails(notification);
        break;
      case 'view_project':
        _viewProject(notification);
        break;
      case 'view_profile':
        _viewProfile(notification);
        break;
      case 'respond_invitation':
        _respondToMeeting(notification);
        break;
      case 'view_document':
        _viewDocument(notification);
        break;
      case 'review_request':
        _reviewRequest(notification);
        break;
      case 'review_security':
        _reviewSecurity(notification);
        break;
      case 'view_milestone':
        _viewMilestone(notification);
        break;
      case 'view_comment':
        _viewComment(notification);
        break;
    }
  }

  void _showNotificationOptions(Map<String, dynamic> notification) {
    showModalBottomSheet(
      context: context,
      backgroundColor: _bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Notification Options',
              style: _titleMedium.copyWith(
                color: _textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            _buildOptionTile(
              icon: LucideIcons.check,
              title: 'Mark as Read',
              subtitle: 'Mark this notification as read',
              onTap: () {
                Navigator.pop(context);
                _markAsRead(notification);
              },
            ),
            _buildOptionTile(
              icon: LucideIcons.archive,
              title: 'Archive',
              subtitle: 'Move to archive',
              onTap: () {
                Navigator.pop(context);
                _archiveNotification(notification);
              },
            ),
            _buildOptionTile(
              icon: LucideIcons.trash2,
              title: 'Delete',
              subtitle: 'Remove this notification',
              color: _typeError,
              onTap: () {
                Navigator.pop(context);
                _deleteNotification(notification);
              },
            ),
            if (notification['read'] == false)
              _buildOptionTile(
                icon: LucideIcons.eyeOff,
                title: 'Mark as Unread',
                subtitle: 'Mark this notification as unread',
                onTap: () {
                  Navigator.pop(context);
                  _markAsUnread(notification);
                },
              ),
            _buildOptionTile(
              icon: LucideIcons.bellOff,
              title: 'Turn off this type',
              subtitle: 'Stop receiving similar notifications',
              onTap: () {
                Navigator.pop(context);
                _turnOffNotificationType(notification);
              },
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: _textSecondary,
                side: BorderSide(color: _borderLight),
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, size: 20, color: color ?? _textSecondary),
      title: Text(title, style: _bodyMedium),
      subtitle: Text(
        subtitle,
        style: _bodySmall.copyWith(color: _textTertiary),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }

  void _markAllAsRead() {
    setState(() {
      for (final notification in _notifications) {
        if (notification['read'] == false) {
          notification['read'] = true;
        }
      }
      _unreadCount = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('All notifications marked as read'),
        backgroundColor: _typeSuccess,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _markAsRead(Map<String, dynamic> notification) {
    setState(() {
      notification['read'] = true;
      _unreadCount--;
    });
  }

  void _markAsUnread(Map<String, dynamic> notification) {
    setState(() {
      notification['read'] = false;
      _unreadCount++;
    });
  }

  void _archiveNotification(Map<String, dynamic> notification) {
    setState(() {
      // In a real app, you would move to archive
      // For demo, we'll just mark as read
      notification['read'] = true;
      if (notification['read'] == false) _unreadCount--;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Notification archived'),
        backgroundColor: _typeInfo,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _deleteNotification(Map<String, dynamic> notification) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _bgCard,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: _borderLight, width: 1.5),
        ),
        title: Text(
          'Delete Notification',
          style: _titleMedium.copyWith(
            color: _textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          'Are you sure you want to delete this notification?',
          style: _bodyMedium.copyWith(color: _textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: _bodyMedium.copyWith(color: _textTertiary),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                // In a real app, remove from list
                // For demo, we'll just mark as read
                notification['read'] = true;
                if (notification['read'] == false) _unreadCount--;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Notification deleted'),
                  backgroundColor: _typeSuccess,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _typeError,
              foregroundColor: _white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _openNotificationSettings() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: _bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Notification Settings',
                      style: _titleLarge.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(LucideIcons.x),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Notification Types
              Text(
                'Notification Types',
                style: _titleSmall.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),

              _buildSettingSwitch(
                title: 'Task Notifications',
                subtitle: 'Task updates, completions, and reminders',
                value: true,
                onChanged: (value) {},
              ),
              _buildSettingSwitch(
                title: 'Message Notifications',
                subtitle: 'Chat messages and mentions',
                value: true,
                onChanged: (value) {},
              ),
              _buildSettingSwitch(
                title: 'Project Updates',
                subtitle: 'Project progress and milestones',
                value: true,
                onChanged: (value) {},
              ),
              _buildSettingSwitch(
                title: 'Team Announcements',
                subtitle: 'Team updates and announcements',
                value: true,
                onChanged: (value) {},
              ),
              _buildSettingSwitch(
                title: 'System Alerts',
                subtitle: 'System maintenance and security alerts',
                value: true,
                onChanged: (value) {},
              ),

              const SizedBox(height: 24),

              // Notification Preferences
              Text(
                'Preferences',
                style: _titleSmall.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),

              _buildSettingSwitch(
                title: 'Push Notifications',
                subtitle: 'Receive push notifications on your device',
                value: true,
                onChanged: (value) {},
              ),
              _buildSettingSwitch(
                title: 'Email Notifications',
                subtitle: 'Receive notifications via email',
                value: false,
                onChanged: (value) {},
              ),
              _buildSettingSwitch(
                title: 'Desktop Notifications',
                subtitle: 'Show notifications on desktop',
                value: true,
                onChanged: (value) {},
              ),
              _buildSettingSwitch(
                title: 'Sound Alerts',
                subtitle: 'Play sound for new notifications',
                value: true,
                onChanged: (value) {},
              ),
              _buildSettingSwitch(
                title: 'Do Not Disturb',
                subtitle: 'Silence notifications during work hours',
                value: false,
                onChanged: (value) {},
              ),

              const SizedBox(height: 30),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Settings saved successfully'),
                      backgroundColor: _typeSuccess,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primary,
                  foregroundColor: _white,
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Save Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: _bodyMedium.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: _bodySmall.copyWith(color: _textTertiary),
                ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged, activeColor: _primary),
        ],
      ),
    );
  }

  // Action Handlers (for demo purposes)
  void _showTaskDetails(Map<String, dynamic> notification) {
    _showActionDialog('View Task', 'Opening task details...', notification);
  }

  void _openChat(Map<String, dynamic> notification) {
    _showActionDialog(
      'Open Chat',
      'Opening chat with ${notification['sender']['name']}...',
      notification,
    );
  }

  void _showDetails(Map<String, dynamic> notification) {
    _showActionDialog(
      'View Details',
      'Showing notification details...',
      notification,
    );
  }

  void _viewProject(Map<String, dynamic> notification) {
    _showActionDialog(
      'View Project',
      'Opening project ${notification['metadata']['projectId']}...',
      notification,
    );
  }

  void _viewProfile(Map<String, dynamic> notification) {
    _showActionDialog(
      'View Profile',
      'Opening profile of ${notification['sender']['name']}...',
      notification,
    );
  }

  void _respondToMeeting(Map<String, dynamic> notification) {
    _showActionDialog(
      'Meeting Response',
      'Opening meeting response options...',
      notification,
    );
  }

  void _viewDocument(Map<String, dynamic> notification) {
    _showActionDialog(
      'View Document',
      'Opening document ${notification['metadata']['documentId']}...',
      notification,
    );
  }

  void _reviewRequest(Map<String, dynamic> notification) {
    _showActionDialog(
      'Review Request',
      'Opening budget approval request...',
      notification,
    );
  }

  void _reviewSecurity(Map<String, dynamic> notification) {
    _showActionDialog(
      'Security Review',
      'Opening security settings...',
      notification,
    );
  }

  void _viewMilestone(Map<String, dynamic> notification) {
    _showActionDialog(
      'View Milestone',
      'Opening milestone details...',
      notification,
    );
  }

  void _viewComment(Map<String, dynamic> notification) {
    _showActionDialog(
      'View Comment',
      'Opening comment thread...',
      notification,
    );
  }

  void _turnOffNotificationType(Map<String, dynamic> notification) {
    _showActionDialog(
      'Turn Off Notifications',
      'Turning off ${notification['type']} notifications...',
      notification,
    );
  }

  void _showActionDialog(
    String title,
    String message,
    Map<String, dynamic> notification,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _bgCard,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: _borderLight, width: 1.5),
        ),
        title: Text(title, style: _titleMedium),
        content: Text(message, style: _bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
