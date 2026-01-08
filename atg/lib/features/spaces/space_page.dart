// lib/features/spaces/space_page.dart
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SpacePage extends StatefulWidget {
  const SpacePage({super.key});

  @override
  State<SpacePage> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
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
  static const Color _accentPink = Color(0xFFED64A6);

  // State variables
  int _selectedTab = 0; // 0: Feed, 1: Events, 2: Files, 3: Chat
  bool _showOrganizationDetails = false;
  Map<String, dynamic>? _selectedOrganization;

  // Grid layout configuration
  final ScrollController _scrollController = ScrollController();
  double _elevation = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _elevation = _scrollController.offset > 10 ? 1 : 0;
    });
  }

  // Spaces Data
  final List<Map<String, dynamic>> _spaces = [
    {
      'id': '1',
      'name': 'Finance Department',
      'description': 'Financial operations, budgeting, and reporting',
      'members': 42,
      'activeProjects': 8,
      'category': 'Finance',
      'role': 'Lead',
      'avatar': 'FD',
      'color': _accentGreen,
      'recentActivity': 'Budget review completed',
      'isFavorited': true,
      'joinStatus': 'joined',
    },
    {
      'id': '2',
      'name': 'Operations Team',
      'description': 'Daily operations and process management',
      'members': 28,
      'activeProjects': 12,
      'category': 'Operations',
      'role': 'Member',
      'avatar': 'OT',
      'color': _accentOrange,
      'recentActivity': 'New process implemented',
      'isFavorited': false,
      'joinStatus': 'joined',
    },
    {
      'id': '3',
      'name': 'Project Management',
      'description': 'All active projects and initiatives',
      'members': 56,
      'activeProjects': 15,
      'category': 'Projects',
      'role': 'Admin',
      'avatar': 'PM',
      'color': _accentPurple,
      'recentActivity': 'Q2 planning session',
      'isFavorited': true,
      'joinStatus': 'joined',
    },
    {
      'id': '4',
      'name': 'Technology & IT',
      'description': 'IT infrastructure and digital transformation',
      'members': 32,
      'activeProjects': 10,
      'category': 'Technology',
      'role': 'Member',
      'avatar': 'TI',
      'color': _accentBlue,
      'recentActivity': 'System upgrade completed',
      'isFavorited': true,
      'joinStatus': 'pending',
    },
    {
      'id': '5',
      'name': 'Human Resources',
      'description': 'Employee relations and talent management',
      'members': 24,
      'activeProjects': 6,
      'category': 'HR',
      'role': 'Member',
      'avatar': 'HR',
      'color': _accentPink,
      'recentActivity': 'New hires onboarding',
      'isFavorited': false,
      'joinStatus': 'joined',
    },
    {
      'id': '6',
      'name': 'Marketing Team',
      'description': 'Brand strategy and campaign management',
      'members': 36,
      'activeProjects': 9,
      'category': 'Marketing',
      'role': 'Member',
      'avatar': 'MT',
      'color': _accentIndigo,
      'recentActivity': 'Q1 campaign launched',
      'isFavorited': true,
      'joinStatus': 'pending',
    },
    {
      'id': '7',
      'name': 'Research & Development',
      'description': 'Innovation and product development',
      'members': 18,
      'activeProjects': 5,
      'category': 'R&D',
      'role': 'Member',
      'avatar': 'RD',
      'color': _accentRed,
      'recentActivity': 'New prototype testing',
      'isFavorited': true,
      'joinStatus': 'joined',
    },
    {
      'id': '8',
      'name': 'Customer Success',
      'description': 'Client support and satisfaction',
      'members': 45,
      'activeProjects': 7,
      'category': 'Support',
      'role': 'Lead',
      'avatar': 'CS',
      'color': _accentBlue,
      'recentActivity': 'Customer feedback review',
      'isFavorited': false,
      'joinStatus': 'joined',
    },
  ];

  // Organization-specific data (same as before)
  Map<String, dynamic> _getOrganizationData(String orgId) {
    switch (orgId) {
      case '1': // Finance Department
        return {
          'feedPosts': [
            {
              'id': 'f1',
              'author': 'Haritha Pawan',
              'role': 'Finance Director',
              'avatar': 'HP',
              'time': '2 hours ago',
              'content':
                  'Q4 budget review completed. All departments are within allocated budgets. Great work team! 💼📈',
              'likes': 24,
              'comments': 8,
              'shares': 3,
              'isLiked': true,
              'images': ['https://picsum.photos/400/300?random=10'],
            },
            {
              'id': 'f2',
              'author': 'Michael Chen',
              'role': 'Sr. Financial Analyst',
              'avatar': 'MC',
              'time': '1 day ago',
              'content':
                  'Annual audit preparation starts next week. Please have all documents ready by Friday.',
              'likes': 18,
              'comments': 5,
              'shares': 2,
              'isLiked': false,
              'images': [],
            },
            {
              'id': 'f3',
              'author': 'Sarah Williams',
              'role': 'Budget Manager',
              'avatar': 'SW',
              'time': '2 days ago',
              'content':
                  'Successfully implemented the new expense tracking system. Process efficiency improved by 35%!',
              'likes': 32,
              'comments': 12,
              'shares': 6,
              'isLiked': true,
              'images': ['https://picsum.photos/400/300?random=11'],
            },
          ],
          'events': [
            {
              'id': 'e1',
              'title': 'Quarterly Budget Review',
              'date': 'Today, 3:00 PM',
              'location': 'Conference Room A',
              'organizer': 'Haritha Pawan',
              'attendees': 12,
              'type': 'meeting',
              'color': _accentGreen,
            },
            {
              'id': 'e2',
              'title': 'Annual Audit Kick-off',
              'date': 'Jan 5, 10:00 AM',
              'location': 'Main Boardroom',
              'organizer': 'External Auditors',
              'attendees': 8,
              'type': 'meeting',
              'color': _accentBlue,
            },
            {
              'id': 'e3',
              'title': 'Financial Planning Workshop',
              'date': 'Jan 12, 9:00 AM',
              'location': 'Training Center',
              'organizer': 'Finance Team',
              'attendees': 25,
              'type': 'workshop',
              'color': _accentPurple,
            },
          ],
          'files': [
            {
              'id': 'file1',
              'name': 'Financial_Report_Q4_2023.pdf',
              'size': '3.2 MB',
              'uploadedBy': 'Haritha Pawan',
              'uploaded': 'Yesterday',
              'type': 'pdf',
              'color': _accentRed,
            },
            {
              'id': 'file2',
              'name': 'Budget_Allocation_2024.xlsx',
              'size': '2.1 MB',
              'uploadedBy': 'Michael Chen',
              'uploaded': '2 days ago',
              'type': 'excel',
              'color': _accentGreen,
            },
            {
              'id': 'file3',
              'name': 'Expense_Policy_Update.docx',
              'size': '1.5 MB',
              'uploadedBy': 'Sarah Williams',
              'uploaded': '3 days ago',
              'type': 'word',
              'color': _accentBlue,
            },
            {
              'id': 'file4',
              'name': 'Audit_Checklist.pdf',
              'size': '980 KB',
              'uploadedBy': 'David Kim',
              'uploaded': '1 week ago',
              'type': 'pdf',
              'color': _accentRed,
            },
          ],
          'chatMessages': [
            {
              'id': 'm1',
              'text': 'Has anyone reviewed the budget report?',
              'sender': 'HP',
              'time': '10:30 AM',
              'read': true,
            },
            {
              'id': 'm2',
              'text': 'Yes, I\'ve reviewed it. Looks good!',
              'sender': 'MC',
              'time': '10:35 AM',
              'read': true,
            },
            {
              'id': 'm3',
              'text': 'We need to discuss the Q4 expenses',
              'sender': 'SW',
              'time': '11:00 AM',
              'read': false,
            },
          ],
        };
      case '2': // Operations Team
        return {
          'feedPosts': [
            {
              'id': 'o1',
              'author': 'Alex Chen',
              'role': 'Operations Manager',
              'avatar': 'AC',
              'time': '1 hour ago',
              'content':
                  'Successfully implemented new workflow automation system! Process efficiency has improved by 40% 🚀',
              'likes': 42,
              'comments': 15,
              'shares': 8,
              'isLiked': true,
              'images': ['https://picsum.photos/400/300?random=20'],
            },
            {
              'id': 'o2',
              'author': 'Mike Rodriguez',
              'role': 'Process Engineer',
              'avatar': 'MR',
              'time': '5 hours ago',
              'content':
                  'Completed the inventory optimization project ahead of schedule! Reduced stock levels by 25% while maintaining service levels.',
              'likes': 28,
              'comments': 9,
              'shares': 4,
              'isLiked': false,
              'images': [],
            },
            {
              'id': 'o3',
              'author': 'Lisa Wang',
              'role': 'Supply Chain Lead',
              'avatar': 'LW',
              'time': 'Yesterday',
              'content':
                  'New vendor partnership finalized! This will reduce our material costs by 15% starting next quarter. Great teamwork everyone!',
              'likes': 36,
              'comments': 11,
              'shares': 7,
              'isLiked': true,
              'images': ['https://picsum.photos/400/300?random=21'],
            },
            {
              'id': 'o4',
              'author': 'David Park',
              'role': 'Quality Manager',
              'avatar': 'DP',
              'time': '2 days ago',
              'content':
                  'Achieved 99.8% quality compliance this month - our best record yet! The new quality control system is working perfectly.',
              'likes': 31,
              'comments': 8,
              'shares': 3,
              'isLiked': false,
              'images': [],
            },
          ],
          'events': [
            {
              'id': 'oe1',
              'title': 'Operations Weekly Meeting',
              'date': 'Every Monday, 10:00 AM',
              'location': 'Ops Control Room',
              'organizer': 'Alex Chen',
              'attendees': 18,
              'type': 'meeting',
              'color': _accentOrange,
            },
            {
              'id': 'oe2',
              'title': 'Process Improvement Workshop',
              'date': 'Jan 8, 9:00 AM',
              'location': 'Training Room 3',
              'organizer': 'Lisa Wang',
              'attendees': 22,
              'type': 'workshop',
              'color': _accentPurple,
            },
            {
              'id': 'oe3',
              'title': 'Vendor Management Review',
              'date': 'Jan 15, 2:00 PM',
              'location': 'Conference Room B',
              'organizer': 'Mike Rodriguez',
              'attendees': 12,
              'type': 'review',
              'color': _accentBlue,
            },
            {
              'id': 'oe4',
              'title': 'Quarterly Operations Review',
              'date': 'Jan 22, 11:00 AM',
              'location': 'Executive Boardroom',
              'organizer': 'Operations Team',
              'attendees': 28,
              'type': 'meeting',
              'color': _accentGreen,
            },
          ],
          'files': [
            {
              'id': 'of1',
              'name': 'Operations_Process_Flow.pdf',
              'size': '4.5 MB',
              'uploadedBy': 'Alex Chen',
              'uploaded': 'Today',
              'type': 'pdf',
              'color': _accentRed,
            },
            {
              'id': 'of2',
              'name': 'Inventory_Report_Q4.xlsx',
              'size': '3.2 MB',
              'uploadedBy': 'Mike Rodriguez',
              'uploaded': 'Yesterday',
              'type': 'excel',
              'color': _accentGreen,
            },
            {
              'id': 'of3',
              'name': 'Quality_Standards_2024.docx',
              'size': '2.8 MB',
              'uploadedBy': 'David Park',
              'uploaded': '2 days ago',
              'type': 'word',
              'color': _accentBlue,
            },
            {
              'id': 'of4',
              'name': 'Vendor_Agreements.zip',
              'size': '12.4 MB',
              'uploadedBy': 'Lisa Wang',
              'uploaded': '3 days ago',
              'type': 'zip',
              'color': _accentPurple,
            },
            {
              'id': 'of5',
              'name': 'Operations_Dashboard.pptx',
              'size': '5.6 MB',
              'uploadedBy': 'Alex Chen',
              'uploaded': '1 week ago',
              'type': 'powerpoint',
              'color': _accentOrange,
            },
          ],
          'chatMessages': [
            {
              'id': 'om1',
              'text': 'The new automation system is live!',
              'sender': 'AC',
              'time': '9:15 AM',
              'read': true,
            },
            {
              'id': 'om2',
              'text': 'Great! Any issues so far?',
              'sender': 'MR',
              'time': '9:20 AM',
              'read': true,
            },
            {
              'id': 'om3',
              'text': 'Running smoothly. Throughput increased by 25%',
              'sender': 'AC',
              'time': '9:25 AM',
              'read': true,
            },
            {
              'id': 'om4',
              'text': 'The quality metrics look excellent this week',
              'sender': 'DP',
              'time': '10:00 AM',
              'read': false,
            },
            {
              'id': 'om5',
              'text': 'Can we review the vendor contracts tomorrow?',
              'sender': 'LW',
              'time': '10:30 AM',
              'read': false,
            },
          ],
        };
      default: // Default/General
        return {'feedPosts': [], 'events': [], 'files': [], 'chatMessages': []};
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showOrganizationDetails && _selectedOrganization != null) {
      return _buildOrganizationDetailsView(_selectedOrganization!);
    }

    return Scaffold(
      backgroundColor: _white,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Header with dynamic elevation
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: _white,
              elevation: _elevation,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  color: _white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Organizations',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: _textPrimary,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Connect, collaborate, and grow together',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: _textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Your Spaces Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Spaces',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: _textPrimary,
                      ),
                    ),
                    Text(
                      '${_spaces.length} total',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: _textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Grid View for Spaces
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75, // Slightly taller cards
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final space = _spaces[index];
                  return _buildGridSpaceCard(space);
                }, childCount: _spaces.length),
              ),
            ),

            // Recommended Spaces Section
            SliverToBoxAdapter(
              child: Container(
                color: _bgLight,
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recommended for you',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: _textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Based on your activity and interests',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: _textTertiary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _unPrimary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'New',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: _unPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Recommended Spaces Grid
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  // Show first 4 spaces as recommendations
                  final recommendedSpaces = _spaces
                      .where((space) => !space['isFavorited'])
                      .toList();
                  final space =
                      recommendedSpaces[index % recommendedSpaces.length];
                  return _buildGridSpaceCard(space, isRecommended: true);
                }, childCount: 4),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: FloatingActionButton(
          onPressed: _createNewSpace,
          backgroundColor: _unPrimary,
          foregroundColor: _white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: const Icon(LucideIcons.plus, size: 24),
        ),
      ),
    );
  }

  Widget _buildGridSpaceCard(
    Map<String, dynamic> space, {
    bool isRecommended = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOrganization = space;
          _showOrganizationDetails = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: _borderLight, width: 1),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header with colored background and avatar
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: space['color'].withOpacity(0.15),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Background pattern
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Opacity(
                          opacity: 0.3,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: space['color'],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      // Main avatar
                      Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: space['color'],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: space['color'].withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              space['avatar'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Favorite icon
                      Positioned(
                        top: 12,
                        right: 12,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              space['isFavorited'] = !space['isFavorited'];
                            });
                          },
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: _white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              space['isFavorited']
                                  ? LucideIcons.star
                                  : LucideIcons.star,
                              size: 14,
                              color: space['isFavorited']
                                  ? _accentOrange
                                  : _textQuaternary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name and category
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                space['name'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: _textPrimary,
                                  height: 1.3,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isRecommended)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: _unPrimary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'NEW',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: _unPrimary,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          space['category'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: space['color'],
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Description
                        Expanded(
                          child: Text(
                            space['description'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: _textTertiary,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Stats row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Members
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${space['members']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: _textPrimary,
                                  ),
                                ),
                                Text(
                                  'Members',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: _textTertiary,
                                  ),
                                ),
                              ],
                            ),

                            // Projects
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${space['activeProjects']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: _textPrimary,
                                  ),
                                ),
                                Text(
                                  'Projects',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: _textTertiary,
                                  ),
                                ),
                              ],
                            ),

                            // Status badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _getJoinStatusColor(
                                  space['joinStatus'],
                                ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                space['joinStatus'] == 'joined'
                                    ? 'Joined'
                                    : 'Pending',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: _getJoinStatusColor(
                                    space['joinStatus'],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Role badge
            if (space['role'] != 'Member')
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: space['role'] == 'Admin'
                        ? _accentRed.withOpacity(0.9)
                        : space['role'] == 'Lead'
                        ? _accentGreen.withOpacity(0.9)
                        : _accentBlue.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    space['role'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getJoinStatusColor(String status) {
    switch (status) {
      case 'joined':
        return _accentGreen;
      case 'pending':
        return _accentOrange;
      default:
        return _textTertiary;
    }
  }

  // All other methods remain the same as before...
  Widget _buildOrganizationDetailsView(Map<String, dynamic> org) {
    final orgData = _getOrganizationData(org['id']);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: _white,
        appBar: AppBar(
          backgroundColor: _white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(LucideIcons.arrowLeft, color: Colors.black),
            onPressed: () {
              setState(() {
                _showOrganizationDetails = false;
                _selectedOrganization = null;
              });
            },
          ),
          title: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: org['color'],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    org['avatar'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    org['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${org['members']} members',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                org['isFavorited'] ? LucideIcons.star : LucideIcons.star,
                color: org['isFavorited'] ? _accentOrange : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  org['isFavorited'] = !org['isFavorited'];
                });
              },
            ),
            IconButton(
              icon: const Icon(LucideIcons.moreVertical, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            labelColor: _unPrimary,
            unselectedLabelColor: _textTertiary,
            indicatorColor: _unPrimary,
            tabs: const [
              Tab(icon: Icon(LucideIcons.home), text: 'Feed'),
              Tab(icon: Icon(LucideIcons.calendar), text: 'Events'),
              Tab(icon: Icon(LucideIcons.folder), text: 'Files'),
              Tab(icon: Icon(LucideIcons.messageSquare), text: 'Chat'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFeedTab(orgData['feedPosts'], org),
            _buildEventsTab(orgData['events']),
            _buildFilesTab(orgData['files']),
            _buildChatTab(orgData['chatMessages'], org),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedTab(List<dynamic> posts, Map<String, dynamic> org) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _borderLight),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [_unPrimary, _unSecondary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'HP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: _bgLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "What's happening in ${org['name']}?",
                          style: TextStyle(fontSize: 14, color: _textTertiary),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPostActionButton(
                      icon: LucideIcons.video,
                      label: 'Live',
                      color: _accentRed,
                    ),
                    _buildPostActionButton(
                      icon: LucideIcons.image,
                      label: 'Photo',
                      color: _accentGreen,
                    ),
                    _buildPostActionButton(
                      icon: LucideIcons.calendar,
                      label: 'Event',
                      color: _accentOrange,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ...posts.map((post) => _buildPostCard(post, org)).toList(),
        ],
      ),
    );
  }

  Widget _buildPostActionButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 20, color: color),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: _textSecondary,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      ),
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post, Map<String, dynamic> org) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: _white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [_unPrimary, _unSecondary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Center(
                    child: Text(
                      post['avatar'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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
                        post['author'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        post['role'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  post['time'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              post['content'],
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),
          if (post['images'] != null && post['images'].isNotEmpty)
            Container(
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(post['images'][0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: _unPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      LucideIcons.thumbsUp,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '${post['likes']}',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(width: 16),
                Text(
                  '${post['comments']} comments',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(width: 16),
                Text(
                  '${post['shares']} shares',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: _borderLight, width: 1)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        post['isLiked'] = !post['isLiked'];
                        if (post['isLiked']) {
                          post['likes'] += 1;
                        } else {
                          post['likes'] -= 1;
                        }
                      });
                    },
                    icon: Icon(
                      post['isLiked']
                          ? LucideIcons.thumbsUp
                          : LucideIcons.thumbsUp,
                      size: 18,
                      color: post['isLiked'] ? _unPrimary : Colors.grey,
                    ),
                    label: Text(
                      'Like',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: post['isLiked'] ? _unPrimary : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      LucideIcons.messageSquare,
                      size: 18,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      'Comment',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      LucideIcons.share2,
                      size: 18,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      'Share',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsTab(List<dynamic> events) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _borderLight),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: event['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: event['color'].withOpacity(0.3)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event['date'].split(',')[0],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: event['color'],
                        ),
                      ),
                      Text(
                        event['date'].split(',').length > 1
                            ? event['date'].split(',')[1].trim()
                            : '',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          LucideIcons.mapPin,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          event['location'],
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          LucideIcons.users,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${event['attendees']} attending',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(LucideIcons.calendarPlus),
                color: _unPrimary,
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilesTab(List<dynamic> files) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: files.length,
      itemBuilder: (context, index) {
        final file = files[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _borderLight),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: file['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    _getFileTypeIcon(file['type']),
                    size: 24,
                    color: file['color'],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file['name'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${file['size']} • Uploaded by ${file['uploadedBy']} • ${file['uploaded']}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(LucideIcons.moreVertical),
                color: Colors.grey,
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChatTab(List<dynamic> messages, Map<String, dynamic> org) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: _white,
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: org['color'],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    org['avatar'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
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
                      org['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${org['members']} members • Tap to see info',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(LucideIcons.phone, color: _unPrimary),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(LucideIcons.video, color: _unPrimary),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[messages.length - 1 - index];
              final isMe = message['sender'] == 'HP';

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: isMe
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!isMe)
                      Container(
                        width: 32,
                        height: 32,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: _unPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            message['sender'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    Flexible(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isMe ? _unPrimary : _bgLight,
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
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message['text'],
                              style: TextStyle(
                                fontSize: 15,
                                color: isMe ? Colors.white : Colors.black,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                message['time'],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: isMe
                                      ? Colors.white.withOpacity(0.8)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: _white,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: _bgLight,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message ${org['name']}...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _unPrimary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.send,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getFileTypeIcon(String type) {
    switch (type) {
      case 'pdf':
        return LucideIcons.fileText;
      case 'excel':
        return LucideIcons.fileSpreadsheet;
      case 'word':
        return LucideIcons.fileEdit;
      case 'powerpoint':
        return LucideIcons.presentation;
      case 'zip':
        return LucideIcons.archive;
      default:
        return LucideIcons.file;
    }
  }

  void _createNewSpace() {
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
                  'Create New Space',
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
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Space Name',
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: _borderLight),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: _unPrimary),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: _borderLight),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: _unPrimary),
                        ),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
                    'Create Space',
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
