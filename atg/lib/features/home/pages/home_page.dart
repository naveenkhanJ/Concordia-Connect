import 'package:atg/features/Notification/notification_page.dart';
import 'package:atg/features/tasks/task_page.dart';
import 'package:atg/features/admin/admin_page.dart';
import 'package:atg/core/user_service.dart';
import 'package:flutter/material.dart';
import 'package:atg/features/spaces/space_page.dart'; // Import SpacePage
import 'package:lucide_icons/lucide_icons.dart';

// Add this import for the ChatPage
import '../../chat/chat_page.dart';

class EliteDashboardView extends StatefulWidget {
  const EliteDashboardView({super.key});

  @override
  State<EliteDashboardView> createState() => _EliteDashboardViewState();
}

class _EliteDashboardViewState extends State<EliteDashboardView> {
  int _currentIndex = 0;
  int _selectedTab = 0;

  // Premium UN Color System
  static const Color _unPrimary = Color(0xFF0065B3);
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

  // Premium Accent Colors
  static const Color _accentPurple = Color(0xFF9F7AEA);
  static const Color _accentGreen = Color(0xFF38B2AC);
  static const Color _accentRed = Color(0xFFF56565);
  static const Color _accentOrange = Color(0xFFED8936);
  static const Color _accentIndigo = Color(0xFF667EEA);
  static const Color _accentBlue = Color(0xFF4299E1);

  // Premium Typography
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

  // Sample Data - Home Page Posts Only
  final List<Map<String, dynamic>> _posts = [
    {
      'id': '1',
      'title': 'Quarterly Financial Review',
      'content':
          'Comprehensive analysis of Q4 financial performance with insights on revenue growth and budget allocations.',
      'author': 'Haritha Pawan',
      'position': 'Finance Director',
      'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      'pinned': true,
      'avatar': 'HP',
      'category': 'Finance',
      'comments': 12,
      'likes': 42,
      'views': 156,
      'priority': 'High',
    },
    {
      'id': '2',
      'title': 'Team Coordination Meeting',
      'content':
          'Key decisions and action items from today\'s cross-departmental coordination session.',
      'author': 'Alex Chen',
      'position': 'Operations Manager',
      'createdAt': DateTime.now().subtract(const Duration(hours: 5)),
      'pinned': false,
      'avatar': 'AC',
      'category': 'Operations',
      'comments': 8,
      'likes': 28,
      'views': 89,
      'priority': 'Medium',
    },
    {
      'id': '3',
      'title': 'Project Status Update',
      'content':
          'Weekly progress report on all active projects with key milestones and upcoming deliverables.',
      'author': 'Sarah Johnson',
      'position': 'Project Lead',
      'createdAt': DateTime.now().subtract(const Duration(days: 1)),
      'pinned': true,
      'avatar': 'SJ',
      'category': 'Projects',
      'comments': 15,
      'likes': 56,
      'views': 124,
      'priority': 'High',
    },
    {
      'id': '4',
      'title': 'Client Partnership Review',
      'content':
          'Updates on strategic client partnerships and upcoming collaboration opportunities.',
      'author': 'Mike Williams',
      'position': 'Partnership Director',
      'createdAt': DateTime.now().subtract(const Duration(days: 2)),
      'pinned': false,
      'avatar': 'MW',
      'category': 'Clients',
      'comments': 6,
      'likes': 24,
      'views': 67,
      'priority': 'Medium',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Premium Header - shows based on current page
            _buildPremiumHeader(),

            // Content Area - switches between pages
            Expanded(child: _getCurrentPage()),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: _buildPremiumBottomNav(),
    );
  }

  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return _buildPremiumContent(); // Home page
      case 1:
        return const SpacePage(); // SpacePage from separate file
      case 2:
        return TaskManagementPage();
      case 3:
        return NotificationsPage();
      case 4:
        return const AdminPage(); // Admin page (only accessible to admins)
      default:
        return _buildPremiumContent();
    }
  }

  Widget _buildPremiumHeader() {
    String pageTitle;
    switch (_currentIndex) {
      case 0:
        pageTitle = 'Executive Platform';
        break;
      case 1:
        pageTitle = 'Organizations';
        break;
      case 2:
        pageTitle = 'Tasks';
        break;
      case 3:
        pageTitle = 'Alerts';
        break;
      case 4:
        pageTitle = 'Admin';
        break;
      default:
        pageTitle = 'Dashboard';
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: BoxDecoration(
        color: _white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo & User Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // UN Logo/Title - Dynamic title based on page
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logo.jpeg',
                      width: 46,
                      height: 46,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              // Message Icon + User Profile
              Row(
                children: [
                  // Message Icon (top-right corner)
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _bgCard,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _borderLight, width: 1.5),
                        ),
                        child: IconButton(
                          icon: Icon(
                            LucideIcons.messageSquare,
                            size: 18,
                            color: _textSecondary,
                          ),
                          onPressed: () {
                            // Navigate to Chat Page
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ChatPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: -3,
                        right: -3,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: _accentPurple,
                            shape: BoxShape.circle,
                            border: Border.all(color: _white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: _accentPurple.withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '5', // Unread message count
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 12),

                  // User Profile with Notification
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: _bgCard,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: _borderLight, width: 1),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [_unPrimary, _unSecondary],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: _unPrimary.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'HP',
                                  style: TextStyle(
                                    color: _white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'H. Pawan',
                                  style: _bodyMedium.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: _textPrimary,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'Member',
                                  style: _caption.copyWith(
                                    color: _textTertiary,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -3,
                        right: -3,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: _accentRed,
                            shape: BoxShape.circle,
                            border: Border.all(color: _white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: _accentRed.withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '3',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Search Bar - Only show on Home and Spaces pages
          if (_currentIndex == 0 || _currentIndex == 1)
            Container(
              height: 44,
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
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  Icon(LucideIcons.search, size: 18, color: _textTertiary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: _bodyMedium.copyWith(fontSize: 13),
                      decoration: InputDecoration(
                        hintText: _currentIndex == 0
                            ? 'Search posts, members, docs...'
                            : 'Search organizations, teams...',
                        hintStyle: _bodyMedium.copyWith(
                          color: _textQuaternary,
                          fontSize: 13,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [_unPrimary, _unSecondary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: _unPrimary.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        LucideIcons.filter,
                        size: 16,
                        color: _white,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPremiumContent() {
    final pinnedPosts = _posts.where((p) => p['pinned'] == true).toList();
    final recentPosts = _posts.where((p) => p['pinned'] == false).toList()
      ..sort((a, b) => b['createdAt'].compareTo(a['createdAt']));

    return Column(
      children: [
        // Action Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Row(
            children: [
              // Quick Actions
              Row(
                children: [
                  _buildQuickAction(
                    icon: LucideIcons.plus,
                    label: 'Create',
                    color: _unPrimary,
                    onTap: () {},
                    isSmall: true,
                  ),
                  const SizedBox(width: 8),
                  _buildQuickAction(
                    icon: LucideIcons.share2,
                    label: 'Share',
                    color: _accentPurple,
                    onTap: () {},
                    isSmall: true,
                  ),
                  const SizedBox(width: 8),
                  _buildQuickAction(
                    icon: LucideIcons.download,
                    label: 'Export',
                    color: _accentGreen,
                    onTap: () {},
                    isSmall: true,
                  ),
                ],
              ),
              const Spacer(),
              // View Toggle
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: _bgCard,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _borderLight, width: 1),
                ),
                child: Row(
                  children: [
                    _buildViewToggle(
                      icon: LucideIcons.grid,
                      isActive: true,
                      onTap: () {},
                      isSmall: true,
                    ),
                    _buildViewToggle(
                      icon: LucideIcons.list,
                      isActive: false,
                      onTap: () {},
                      isSmall: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Tab Navigation
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              color: _bgCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _borderLight, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildPremiumTab(
                  index: 0,
                  icon: LucideIcons.layoutGrid,
                  label: 'All Posts',
                  isActive: _selectedTab == 0,
                  count: _posts.length,
                  isSmall: true,
                ),
                _buildPremiumTab(
                  index: 1,
                  icon: LucideIcons.pin,
                  label: 'Pinned',
                  isActive: _selectedTab == 1,
                  count: pinnedPosts.length,
                  isSmall: true,
                ),
                _buildPremiumTab(
                  index: 2,
                  icon: LucideIcons.clock,
                  label: 'Recent',
                  isActive: _selectedTab == 2,
                  count: recentPosts.length,
                  isSmall: true,
                ),
              ],
            ),
          ),
        ),

        // Content Area
        const SizedBox(height: 12),
        Expanded(
          child: _selectedTab == 0
              ? _buildAllPostsView(pinnedPosts, recentPosts)
              : _selectedTab == 1
              ? _buildPinnedView(pinnedPosts)
              : _buildRecentView(recentPosts),
        ),
      ],
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    bool isSmall = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isSmall ? 12 : 14,
          vertical: isSmall ? 6 : 8,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(isSmall ? 10 : 12),
          border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, size: isSmall ? 14 : 16, color: color),
            SizedBox(width: isSmall ? 6 : 8),
            Text(
              label,
              style: _caption.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: isSmall ? 11 : 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewToggle({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
    bool isSmall = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isSmall ? 32 : 36,
        height: isSmall ? 32 : 36,
        decoration: BoxDecoration(
          color: isActive ? _unPrimary.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(isSmall ? 6 : 8),
        ),
        child: Center(
          child: Icon(
            icon,
            size: isSmall ? 16 : 18,
            color: isActive ? _unPrimary : _textTertiary,
          ),
        ),
      ),
    );
  }

  Widget _buildPremiumTab({
    required int index,
    required IconData icon,
    required String label,
    required bool isActive,
    required int count,
    bool isSmall = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            gradient: isActive
                ? const LinearGradient(
                    colors: [_unPrimary, _unSecondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            borderRadius: BorderRadius.circular(isSmall ? 8 : 10),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: _unPrimary.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: isSmall ? 14 : 16,
                  color: isActive ? _white : _textTertiary,
                  weight: isActive ? 1.5 : 1.0,
                ),
                SizedBox(width: isSmall ? 4 : 6),
                Text(
                  label,
                  style: _caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isActive ? _white : _textTertiary,
                    fontSize: isSmall ? 10 : 11,
                  ),
                ),
                if (count > 0) ...[
                  SizedBox(width: isSmall ? 2 : 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: isActive ? _white.withOpacity(0.2) : _borderLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '$count',
                      style: _label.copyWith(
                        fontSize: isSmall ? 8 : 9,
                        fontWeight: FontWeight.w800,
                        color: isActive ? _white : _textTertiary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAllPostsView(
    List<Map<String, dynamic>> pinnedPosts,
    List<Map<String, dynamic>> recentPosts,
  ) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Pinned Section
        if (pinnedPosts.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _accentPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _accentPurple.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(LucideIcons.pin, size: 14, color: _accentPurple),
                        const SizedBox(width: 6),
                        Text(
                          'Priority Updates',
                          style: _titleMedium.copyWith(
                            color: _textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${pinnedPosts.length} items',
                    style: _caption.copyWith(
                      color: _textTertiary,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),

        if (pinnedPosts.isNotEmpty)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildPremiumPostCard(pinnedPosts[index]),
                childCount: pinnedPosts.length,
              ),
            ),
          ),

        // Recent Section
        if (recentPosts.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _accentGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _accentGreen.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(LucideIcons.clock, size: 14, color: _accentGreen),
                        const SizedBox(width: 6),
                        Text(
                          'Recent Activity',
                          style: _titleMedium.copyWith(
                            color: _textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${recentPosts.length} items',
                    style: _caption.copyWith(
                      color: _textTertiary,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),

        if (recentPosts.isNotEmpty)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildPremiumPostCard(recentPosts[index]),
                childCount: recentPosts.length,
              ),
            ),
          ),

        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }

  Widget _buildPinnedView(List<Map<String, dynamic>> pinnedPosts) {
    return _buildPostListView(pinnedPosts, 'Priority Updates', _accentPurple);
  }

  Widget _buildRecentView(List<Map<String, dynamic>> recentPosts) {
    return _buildPostListView(recentPosts, 'Recent Activity', _accentGreen);
  }

  Widget _buildPostListView(
    List<Map<String, dynamic>> posts,
    String title,
    Color accentColor,
  ) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: accentColor.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(_getTitleIcon(title), size: 14, color: accentColor),
                      const SizedBox(width: 6),
                      Text(
                        title,
                        style: _titleMedium.copyWith(
                          color: _textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '${posts.length} items',
                  style: _caption.copyWith(
                    color: _textTertiary,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildPremiumPostCard(posts[index]),
              childCount: posts.length,
            ),
          ),
        ),

        if (posts.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: _borderLight,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      LucideIcons.inbox,
                      size: 32,
                      color: _textQuaternary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No posts found',
                    style: _titleMedium.copyWith(
                      color: _textTertiary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Create your first post to get started',
                    style: _bodyMedium.copyWith(
                      color: _textQuaternary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),

        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }

  IconData _getTitleIcon(String title) {
    switch (title) {
      case 'Priority Updates':
        return LucideIcons.pin;
      case 'Recent Activity':
        return LucideIcons.clock;
      default:
        return LucideIcons.fileText;
    }
  }

  Widget _buildPremiumPostCard(Map<String, dynamic> post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _borderLight, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Category and Actions
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(
                          post['category'],
                        ).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: _getCategoryColor(
                            post['category'],
                          ).withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        post['category'].toUpperCase(),
                        style: _label.copyWith(
                          color: _getCategoryColor(post['category']),
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Priority Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getPriorityColor(
                          post['priority'],
                        ).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: _getPriorityColor(
                            post['priority'],
                          ).withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              color: _getPriorityColor(post['priority']),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            post['priority'],
                            style: _label.copyWith(
                              color: _getPriorityColor(post['priority']),
                              fontWeight: FontWeight.w700,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (post['pinned']) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: _accentPurple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          LucideIcons.pin,
                          size: 10,
                          color: _accentPurple,
                        ),
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 12),

                // Title
                Text(
                  post['title'],
                  style: _titleMedium.copyWith(
                    fontSize: 16,
                    height: 1.4,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                // Content
                Text(
                  post['content'],
                  style: _bodyMedium.copyWith(
                    color: _textSecondary,
                    height: 1.6,
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                // Author Info
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [_unPrimary, _unSecondary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: _unPrimary.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          post['avatar'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['author'],
                            style: _caption.copyWith(
                              fontWeight: FontWeight.w600,
                              color: _textPrimary,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            post['position'],
                            style: _label.copyWith(
                              color: _textTertiary,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          Icon(
                            LucideIcons.clock,
                            size: 10,
                            color: _textTertiary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatTime(post['createdAt']),
                            style: _label.copyWith(
                              color: _textTertiary,
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Footer with Stats
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: _bgLight,
              border: Border(top: BorderSide(color: _borderLight, width: 1.5)),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildPostStat(
                      icon: LucideIcons.messageSquare,
                      count: post['comments'],
                      label: 'Comments',
                      color: _accentBlue,
                      isSmall: true,
                    ),
                    const SizedBox(width: 16),
                    _buildPostStat(
                      icon: LucideIcons.heart,
                      count: post['likes'],
                      label: 'Likes',
                      color: _accentRed,
                      isSmall: true,
                    ),
                    const SizedBox(width: 16),
                    _buildPostStat(
                      icon: LucideIcons.eye,
                      count: post['views'],
                      label: 'Views',
                      color: _accentGreen,
                      isSmall: true,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: _white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: _borderLight),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(LucideIcons.share2, size: 12, color: _textTertiary),
                      const SizedBox(width: 4),
                      Text(
                        'Share',
                        style: _label.copyWith(
                          color: _textTertiary,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostStat({
    required IconData icon,
    required int count,
    required String label,
    required Color color,
    bool isSmall = false,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: isSmall ? 14 : 16, color: color),
            SizedBox(width: isSmall ? 4 : 6),
            Text(
              '$count',
              style: _caption.copyWith(
                fontWeight: FontWeight.w700,
                color: _textSecondary,
                fontSize: isSmall ? 12 : 13,
              ),
            ),
          ],
        ),
        SizedBox(height: isSmall ? 1 : 2),
        Text(
          label,
          style: _label.copyWith(
            color: _textQuaternary,
            fontSize: isSmall ? 9 : 10,
          ),
        ),
      ],
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'finance':
        return _accentGreen;
      case 'operations':
        return _accentOrange;
      case 'projects':
        return _accentPurple;
      case 'clients':
        return _accentIndigo;
      default:
        return _unPrimary;
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return _accentRed;
      case 'medium':
        return _accentOrange;
      case 'low':
        return _accentGreen;
      default:
        return _unPrimary;
    }
  }

  Widget _buildPremiumBottomNav() {
    return Container(
      height: 68,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _borderLight, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: LucideIcons.home, label: 'Home', index: 0),
            _buildNavItem(icon: LucideIcons.users, label: 'Spaces', index: 1),
            _buildNavItem(
              icon: LucideIcons.checkSquare,
              label: 'Tasks',
              index: 2,
              showIndicator: true,
            ),
            _buildNavItem(
              icon: LucideIcons.bell,
              label: 'Alerts',
              index: 3,
              badgeCount: 3,
            ),
            // Admin tab - only visible for admin users
            if (UserService().isAdmin)
              _buildNavItem(
                icon: LucideIcons.shieldCheck,
                label: 'Admin',
                index: 4,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    int badgeCount = 0,
    bool showIndicator = false,
  }) {
    bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isActive
                        ? _unPrimary.withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: isActive ? _unPrimary : _textTertiary,
                  ),
                ),
                if (badgeCount > 0)
                  Positioned(
                    top: -1,
                    right: -2,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: _accentRed,
                        shape: BoxShape.circle,
                        border: Border.all(color: _bgCard, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: _accentRed.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          badgeCount > 9 ? '9+' : '$badgeCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w800,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (showIndicator && badgeCount == 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: _unPrimary,
                        shape: BoxShape.circle,
                        border: Border.all(color: _bgCard, width: 1.5),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: _label.copyWith(
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                color: isActive ? _unPrimary : _textTertiary,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoonPage(String pageName) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.construction, size: 64, color: _textQuaternary),
          const SizedBox(height: 16),
          Text(
            '$pageName Coming Soon',
            style: _titleLarge.copyWith(color: _textTertiary),
          ),
          const SizedBox(height: 8),
          Text(
            'This feature is under development',
            style: _bodyMedium.copyWith(color: _textQuaternary),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
    if (difference.inHours < 24) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';
    return '${time.day}/${time.month}/${time.year}';
  }
}
