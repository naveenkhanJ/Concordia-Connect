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
  int _selectedTab = 0; // 0: Feed, 1: Events, 2: Files, 3: Chat, 4: Tasks
  Map<String, dynamic>? _selectedOrganization;
  bool _showOrganizationDetails = false;
  bool _showCreateTask = false;

  // Task state
  String _newTaskTitle = '';
  String _newTaskDescription = '';
  DateTime? _newTaskDueDate;
  String _newTaskPriority = 'Medium';
  List<String> _selectedAssignees = [];
  String _newTaskStatus = 'To Do';

  // Sample team members for task assignment
  final List<Map<String, dynamic>> _teamMembers = [
    {
      'id': '1',
      'name': 'Haritha Pawan',
      'role': 'Finance Director',
      'avatar': 'HP',
      'email': 'haritha@company.com',
      'color': _accentGreen,
      'isSelected': false,
    },
    {
      'id': '2',
      'name': 'Michael Chen',
      'role': 'Sr. Financial Analyst',
      'avatar': 'MC',
      'email': 'michael@company.com',
      'color': _accentBlue,
      'isSelected': false,
    },
    {
      'id': '3',
      'name': 'Sarah Williams',
      'role': 'Budget Manager',
      'avatar': 'SW',
      'email': 'sarah@company.com',
      'color': _accentPurple,
      'isSelected': false,
    },
    {
      'id': '4',
      'name': 'Alex Johnson',
      'role': 'Account Manager',
      'avatar': 'AJ',
      'email': 'alex@company.com',
      'color': _accentOrange,
      'isSelected': false,
    },
    {
      'id': '5',
      'name': 'Lisa Rodriguez',
      'role': 'Financial Analyst',
      'avatar': 'LR',
      'email': 'lisa@company.com',
      'color': _accentPink,
      'isSelected': false,
    },
    {
      'id': '6',
      'name': 'David Kim',
      'role': 'Audit Specialist',
      'avatar': 'DK',
      'email': 'david@company.com',
      'color': _accentRed,
      'isSelected': false,
    },
  ];

  // Sample tasks data
  List<Map<String, dynamic>> _tasks = [
    {
      'id': '1',
      'title': 'Complete Q4 Financial Report',
      'description': 'Prepare and finalize Q4 financial statements',
      'dueDate': '2024-01-15',
      'priority': 'High',
      'status': 'In Progress',
      'assignees': ['Haritha Pawan', 'Michael Chen'],
      'createdBy': 'Haritha Pawan',
      'createdAt': '2024-01-02',
      'comments': 5,
      'attachments': 2,
      'color': _accentRed,
    },
    {
      'id': '2',
      'title': 'Annual Budget Planning',
      'description': 'Draft budget proposal for next fiscal year',
      'dueDate': '2024-01-31',
      'priority': 'Medium',
      'status': 'To Do',
      'assignees': ['Sarah Williams'],
      'createdBy': 'Haritha Pawan',
      'createdAt': '2024-01-01',
      'comments': 2,
      'attachments': 1,
      'color': _accentOrange,
    },
    {
      'id': '3',
      'title': 'Audit Preparation Meeting',
      'description': 'Prepare documents and schedule for audit',
      'dueDate': '2024-01-10',
      'priority': 'High',
      'status': 'Done',
      'assignees': ['David Kim', 'Alex Johnson'],
      'createdBy': 'Michael Chen',
      'createdAt': '2023-12-28',
      'comments': 8,
      'attachments': 3,
      'color': _accentGreen,
    },
    {
      'id': '4',
      'title': 'Expense Policy Update',
      'description': 'Review and update company expense policies',
      'dueDate': '2024-01-20',
      'priority': 'Medium',
      'status': 'In Progress',
      'assignees': ['Sarah Williams', 'Lisa Rodriguez'],
      'createdBy': 'Sarah Williams',
      'createdAt': '2023-12-30',
      'comments': 3,
      'attachments': 0,
      'color': _accentBlue,
    },
    {
      'id': '5',
      'title': 'Tax Filing Preparation',
      'description': 'Organize documents for annual tax filing',
      'dueDate': '2024-02-15',
      'priority': 'Low',
      'status': 'To Do',
      'assignees': ['Michael Chen'],
      'createdBy': 'David Kim',
      'createdAt': '2024-01-03',
      'comments': 1,
      'attachments': 0,
      'color': _accentPurple,
    },
  ];

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
      'coverImage': 'https://picsum.photos/600/300?random=1',
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
      'coverImage': 'https://picsum.photos/600/300?random=2',
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
      'coverImage': 'https://picsum.photos/600/300?random=3',
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
      'coverImage': 'https://picsum.photos/600/300?random=4',
      'recentActivity': 'System upgrade completed',
      'isFavorited': true,
      'joinStatus': 'pending',
    },
  ];

  // Organization-specific data
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
          'tasks': _tasks,
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
          'tasks': [],
        };
      default: // Default/General
        return {
          'feedPosts': [],
          'events': [],
          'files': [],
          'chatMessages': [],
          'tasks': [],
        };
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
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Header
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: _white,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  color: _white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 20, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Spaces',
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

            // Spaces Grid
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.78,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildSpaceCard(_spaces[index]),
                  childCount: _spaces.length,
                ),
              ),
            ),

            // Recommendations Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended for you',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: _textPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _unPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Additional Spaces
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  // For demo, reuse first 2 spaces as recommendations
                  final space = _spaces[index % 2];
                  return _buildRecommendedSpace(space);
                }, childCount: 4),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewSpace,
        backgroundColor: _unPrimary,
        foregroundColor: _white,
        shape: const CircleBorder(),
        elevation: 8,
        child: const Icon(LucideIcons.plus, size: 24),
      ),
    );
  }

  Widget _buildSpaceCard(Map<String, dynamic> space) {
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
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: _borderLight, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cover Image
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: space['color'].withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(space['coverImage']),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar and Name
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                            color: space['color'],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: space['color'].withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              space['avatar'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
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
                                space['name'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: _textPrimary,
                                  height: 1.3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                space['description'],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: _textTertiary,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSpaceStat(
                          icon: LucideIcons.users,
                          value: '${space['members']}',
                          label: 'Members',
                        ),
                        _buildSpaceStat(
                          icon: LucideIcons.folder,
                          value: '${space['activeProjects']}',
                          label: 'Projects',
                        ),
                        _buildSpaceStat(
                          icon: LucideIcons.activity,
                          value: space['joinStatus'] == 'joined'
                              ? 'Joined'
                              : 'Join',
                          label: 'Status',
                        ),
                      ],
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

  Widget _buildRecommendedSpace(Map<String, dynamic> space) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOrganization = space;
          _showOrganizationDetails = true;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: _white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _borderLight, width: 1),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: space['color'],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  space['avatar'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            // Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      space['name'],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      space['description'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: _textTertiary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(LucideIcons.users, size: 12, color: _textTertiary),
                        const SizedBox(width: 4),
                        Text(
                          '${space['members']} members',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: _textTertiary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _getJoinStatusColor(
                              space['joinStatus'],
                            ).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            space['joinStatus'] == 'joined' ? 'Joined' : 'Join',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: _getJoinStatusColor(space['joinStatus']),
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
      ),
    );
  }

  Widget _buildSpaceStat({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, size: 16, color: _textTertiary),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: _textTertiary,
          ),
        ),
      ],
    );
  }

  Color _getJoinStatusColor(String status) {
    switch (status) {
      case 'joined':
        return _accentGreen;
      case 'pending':
        return _accentOrange;
      case 'not_joined':
        return _accentBlue;
      default:
        return _textTertiary;
    }
  }

  Widget _buildOrganizationDetailsView(Map<String, dynamic> org) {
    final orgData = _getOrganizationData(org['id']);

    return DefaultTabController(
      length: 5,
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
              Tab(icon: Icon(LucideIcons.checkSquare), text: 'Tasks'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Feed Tab
            _buildFeedTab(orgData['feedPosts'], org),
            // Events Tab
            _buildEventsTab(orgData['events']),
            // Files Tab
            _buildFilesTab(orgData['files']),
            // Chat Tab
            _buildChatTab(orgData['chatMessages'], org),
            // Tasks Tab
            _buildTasksTab(orgData['tasks'], org),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedTab(List<dynamic> posts, Map<String, dynamic> org) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Create Post Card
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

          // Posts
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
        // Chat Header
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

        // Messages
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

        // Message Input
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

  Widget _buildTasksTab(List<dynamic> tasks, Map<String, dynamic> org) {
    if (_showCreateTask) {
      return _buildCreateTaskView(org);
    }

    return Scaffold(
      backgroundColor: _white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showCreateTask = true;
          });
        },
        backgroundColor: _unPrimary,
        foregroundColor: _white,
        shape: const CircleBorder(),
        elevation: 4,
        child: const Icon(LucideIcons.plus, size: 24),
      ),
      body: Column(
        children: [
          // Task Stats
          Container(
            padding: const EdgeInsets.all(16),
            color: _bgLight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTaskStat('To Do', '2', _accentBlue),
                _buildTaskStat('In Progress', '2', _accentOrange),
                _buildTaskStat('Done', '1', _accentGreen),
                _buildTaskStat('Total', '5', _accentPurple),
              ],
            ),
          ),

          // Task Filter
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: _borderLight, width: 1)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: _bgLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.search,
                          size: 18,
                          color: _textTertiary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search tasks...',
                              hintStyle: TextStyle(color: _textTertiary),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(LucideIcons.filter),
                  onPressed: () {
                    _showTaskFilterDialog();
                  },
                ),
              ],
            ),
          ),

          // Task List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return _buildTaskCard(task, org);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskStat(String label, String count, Color color) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              count,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: _textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task, Map<String, dynamic> org) {
    return GestureDetector(
      onTap: () {
        _showTaskDetails(task, org);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _borderLight, width: 1),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getPriorityColor(task['priority']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    task['priority'],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: _getPriorityColor(task['priority']),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(task['status']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    task['status'],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: _getStatusColor(task['status']),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              task['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              task['description'],
              style: TextStyle(
                fontSize: 13,
                color: _textSecondary,
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(LucideIcons.calendar, size: 14, color: _textTertiary),
                const SizedBox(width: 4),
                Text(
                  'Due ${task['dueDate']}',
                  style: TextStyle(fontSize: 12, color: _textTertiary),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      LucideIcons.messageSquare,
                      size: 14,
                      color: _textTertiary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${task['comments']}',
                      style: TextStyle(fontSize: 12, color: _textTertiary),
                    ),
                    const SizedBox(width: 12),
                    Icon(LucideIcons.paperclip, size: 14, color: _textTertiary),
                    const SizedBox(width: 4),
                    Text(
                      '${task['attachments']}',
                      style: TextStyle(fontSize: 12, color: _textTertiary),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Assignee Avatars - FIXED: No negative margins
                SizedBox(
                  height: 28,
                  child: Stack(
                    children: [
                      for (
                        int i = 0;
                        i < (task['assignees'] as List).length && i < 3;
                        i++
                      )
                        Positioned(
                          left: i * 20.0,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: _unPrimary,
                              shape: BoxShape.circle,
                              border: Border.all(color: _white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                (task['assignees'] as List)[i].substring(0, 1),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Menu button
                PopupMenuButton<String>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(LucideIcons.edit, size: 16, color: _textPrimary),
                          const SizedBox(width: 8),
                          Text('Edit Task'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(LucideIcons.trash2, size: 16, color: _accentRed),
                          const SizedBox(width: 8),
                          Text('Delete Task'),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 'edit') {
                      setState(() {
                        _showCreateTask = true;
                        _newTaskTitle = task['title'];
                        _newTaskDescription = task['description'];
                        _newTaskPriority = task['priority'];
                        _newTaskStatus = task['status'];
                        _selectedAssignees = List.from(task['assignees']);
                      });
                    } else if (value == 'delete') {
                      _deleteTask(task['id']);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: _bgLight,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LucideIcons.moreVertical,
                      size: 16,
                      color: _textTertiary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateTaskView(Map<String, dynamic> org) {
    return Scaffold(
      backgroundColor: _white,
      appBar: AppBar(
        backgroundColor: _white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.black),
          onPressed: () {
            setState(() {
              _showCreateTask = false;
              _resetTaskForm();
            });
          },
        ),
        title: const Text(
          'Create New Task',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _saveTask,
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _unPrimary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title
            Text(
              'Task Title',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter task title',
                hintStyle: TextStyle(color: _textTertiary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: _borderLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: _unPrimary),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              style: const TextStyle(fontSize: 16),
              maxLines: 1,
              onChanged: (value) {
                setState(() {
                  _newTaskTitle = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Task Description
            Text(
              'Description',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Describe the task details...',
                hintStyle: TextStyle(color: _textTertiary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: _borderLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: _unPrimary),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              style: const TextStyle(fontSize: 14),
              maxLines: 4,
              onChanged: (value) {
                setState(() {
                  _newTaskDescription = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Assignees
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Assign to',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: _showAssigneeSelection,
                  child: Text(
                    'Select Members',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: _unPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _selectedAssignees.isEmpty
                ? Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _bgLight,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: _borderLight),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.userPlus,
                          size: 20,
                          color: _textTertiary,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'No assignees selected',
                          style: TextStyle(color: _textTertiary),
                        ),
                      ],
                    ),
                  )
                : Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _selectedAssignees.map((assignee) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _unPrimary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _unPrimary.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: _unPrimary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  assignee.substring(0, 1),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              assignee,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: _unPrimary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedAssignees.remove(assignee);
                                });
                              },
                              child: Icon(
                                LucideIcons.x,
                                size: 14,
                                color: _unPrimary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
            const SizedBox(height: 20),

            // Priority & Status
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Priority',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _newTaskPriority,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: _borderLight),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: _unPrimary),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'Low',
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: _accentGreen,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text('Low'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Medium',
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: _accentOrange,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text('Medium'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'High',
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: _accentRed,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text('High'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Critical',
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text('Critical'),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _newTaskPriority = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _newTaskStatus,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: _borderLight),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: _unPrimary),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'To Do',
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: _accentBlue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text('To Do'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'In Progress',
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: _accentOrange,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text('In Progress'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Done',
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: _accentGreen,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text('Done'),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _newTaskStatus = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Due Date
            Text(
              'Due Date',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _selectDueDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: _borderLight),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(LucideIcons.calendar, size: 20, color: _textTertiary),
                    const SizedBox(width: 12),
                    Text(
                      _newTaskDueDate == null
                          ? 'Select due date'
                          : 'Due ${_newTaskDueDate!.toLocal().toString().split(' ')[0]}',
                      style: TextStyle(
                        fontSize: 15,
                        color: _newTaskDueDate == null
                            ? _textTertiary
                            : _textPrimary,
                      ),
                    ),
                    const Spacer(),
                    if (_newTaskDueDate != null)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _newTaskDueDate = null;
                          });
                        },
                        child: Icon(
                          LucideIcons.x,
                          size: 16,
                          color: _textTertiary,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Create Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveTask,
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
                  'Create Task',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDueDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _newTaskDueDate = picked;
      });
    }
  }

  void _showAssigneeSelection() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: _white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
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
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Members',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: _textPrimary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              for (var member in _teamMembers) {
                                member['isSelected'] = false;
                              }
                              _selectedAssignees.clear();
                            });
                          },
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _accentRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: _bgLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.search,
                            size: 18,
                            color: _textTertiary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search members...',
                                hintStyle: TextStyle(color: _textTertiary),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _teamMembers.length,
                      itemBuilder: (context, index) {
                        final member = _teamMembers[index];
                        return CheckboxListTile(
                          value: member['isSelected'],
                          onChanged: (value) {
                            setState(() {
                              member['isSelected'] = value!;
                              if (value) {
                                _selectedAssignees.add(member['name']);
                              } else {
                                _selectedAssignees.remove(member['name']);
                              }
                            });
                          },
                          title: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: member['color'],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    member['avatar'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
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
                                      member['name'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      member['role'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: _textTertiary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
                      child: Text(
                        'Select (${_selectedAssignees.length})',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _saveTask() {
    if (_newTaskTitle.isEmpty) {
      _showSnackBar('Please enter a task title');
      return;
    }

    if (_selectedAssignees.isEmpty) {
      _showSnackBar('Please select at least one assignee');
      return;
    }

    final newTask = {
      'id': '${_tasks.length + 1}',
      'title': _newTaskTitle,
      'description': _newTaskDescription,
      'dueDate': _newTaskDueDate == null
          ? 'No due date'
          : _newTaskDueDate!.toLocal().toString().split(' ')[0],
      'priority': _newTaskPriority,
      'status': _newTaskStatus,
      'assignees': List.from(_selectedAssignees),
      'createdBy': 'Haritha Pawan',
      'createdAt': DateTime.now().toLocal().toString().split(' ')[0],
      'comments': 0,
      'attachments': 0,
      'color': _getPriorityColor(_newTaskPriority),
    };

    setState(() {
      _tasks.insert(0, newTask);
      _showCreateTask = false;
      _resetTaskForm();
    });

    _showSnackBar('Task created successfully!');
  }

  void _showTaskDetails(Map<String, dynamic> task, Map<String, dynamic> org) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: _white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: _getPriorityColor(
                                    task['priority'],
                                  ).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  task['priority'],
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: _getPriorityColor(task['priority']),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(
                                    task['status'],
                                  ).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  task['status'],
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: _getStatusColor(task['status']),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            task['title'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuButton<String>(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(
                                LucideIcons.edit,
                                size: 16,
                                color: _textPrimary,
                              ),
                              const SizedBox(width: 8),
                              Text('Edit'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(
                                LucideIcons.trash2,
                                size: 16,
                                color: _accentRed,
                              ),
                              const SizedBox(width: 8),
                              Text('Delete'),
                            ],
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        Navigator.pop(context);
                        if (value == 'edit') {
                          setState(() {
                            _showCreateTask = true;
                            _newTaskTitle = task['title'];
                            _newTaskDescription = task['description'];
                            _newTaskPriority = task['priority'];
                            _newTaskStatus = task['status'];
                            _selectedAssignees = List.from(task['assignees']);
                          });
                        } else if (value == 'delete') {
                          _deleteTask(task['id']);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _bgLight,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          LucideIcons.moreVertical,
                          size: 20,
                          color: _textTertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        task['description'],
                        style: TextStyle(
                          fontSize: 14,
                          color: _textSecondary,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Due Date',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: _textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.calendar,
                                    size: 16,
                                    color: _textTertiary,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    task['dueDate'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: _textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Created By',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: _textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.user,
                                    size: 16,
                                    color: _textTertiary,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    task['createdBy'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: _textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Assignees',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: task['assignees'].map((assignee) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: _unPrimary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: _unPrimary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      assignee.substring(0, 1),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  assignee,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: _unPrimary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Activity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: _unPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                task['createdBy'].substring(0, 1),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Created by ${task['createdBy']} on ${task['createdAt']}',
                              style: TextStyle(
                                fontSize: 13,
                                color: _textTertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: _borderLight, width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            final index = _tasks.indexWhere(
                              (t) => t['id'] == task['id'],
                            );
                            if (index != -1) {
                              if (_tasks[index]['status'] == 'To Do') {
                                _tasks[index]['status'] = 'In Progress';
                              } else if (_tasks[index]['status'] ==
                                  'In Progress') {
                                _tasks[index]['status'] = 'Done';
                              }
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _unPrimary,
                          foregroundColor: _white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          task['status'] == 'Done'
                              ? 'Completed'
                              : 'Mark Complete',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
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
      },
    );
  }

  void _showTaskFilterDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: _white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filter Tasks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: _textPrimary,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Status',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: ['All', 'To Do', 'In Progress', 'Done'].map((status) {
                  return ChoiceChip(
                    label: Text(status),
                    selected: false,
                    onSelected: (selected) {},
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                'Priority',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: ['All', 'Low', 'Medium', 'High', 'Critical'].map((
                  priority,
                ) {
                  return ChoiceChip(
                    label: Text(priority),
                    selected: false,
                    onSelected: (selected) {},
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              SizedBox(
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
                  ),
                  child: const Text(
                    'Apply Filters',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteTask(String taskId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text(
          'Are you sure you want to delete this task? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _tasks.removeWhere((task) => task['id'] == taskId);
              });
              Navigator.pop(context);
              _showSnackBar('Task deleted successfully');
            },
            style: TextButton.styleFrom(foregroundColor: _accentRed),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  void _resetTaskForm() {
    _newTaskTitle = '';
    _newTaskDescription = '';
    _newTaskDueDate = null;
    _newTaskPriority = 'Medium';
    _newTaskStatus = 'To Do';
    _selectedAssignees.clear();

    // Reset team members selection
    for (var member in _teamMembers) {
      member['isSelected'] = false;
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
      case 'critical':
        return Colors.purple;
      default:
        return _accentBlue;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'done':
        return _accentGreen;
      case 'in progress':
        return _accentOrange;
      case 'to do':
        return _accentBlue;
      default:
        return _textTertiary;
    }
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
