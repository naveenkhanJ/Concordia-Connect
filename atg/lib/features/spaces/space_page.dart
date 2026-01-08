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
      'joinStatus': 'pending',
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
      'name': 'Client Relations',
      'description': 'Client partnerships and collaborations',
      'members': 24,
      'activeProjects': 6,
      'category': 'Clients',
      'role': 'Member',
      'avatar': 'CR',
      'color': _accentIndigo,
      'recentActivity': 'New partnership signed',
      'isFavorited': false,
      'joinStatus': 'not_joined',
    },
    {
      'id': '5',
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
      'joinStatus': 'joined',
    },
    {
      'id': '6',
      'name': 'Human Resources',
      'description': 'Talent management and organizational development',
      'members': 18,
      'activeProjects': 5,
      'category': 'HR',
      'role': 'Lead',
      'avatar': 'HR',
      'color': _accentPink,
      'recentActivity': 'New hiring process',
      'isFavorited': false,
      'joinStatus': 'not_joined',
    },
    {
      'id': '7',
      'name': 'Marketing & Comms',
      'description': 'Brand strategy and communication channels',
      'members': 22,
      'activeProjects': 7,
      'category': 'Marketing',
      'role': 'Member',
      'avatar': 'MC',
      'color': _accentRed,
      'recentActivity': 'Campaign launched',
      'isFavorited': true,
      'joinStatus': 'pending',
    },
    {
      'id': '8',
      'name': 'Legal & Compliance',
      'description': 'Legal operations and regulatory compliance',
      'members': 14,
      'activeProjects': 4,
      'category': 'Legal',
      'role': 'Member',
      'avatar': 'LC',
      'color': _unPrimary,
      'recentActivity': 'Policy update reviewed',
      'isFavorited': false,
      'joinStatus': 'not_joined',
    },
  ];

  // Organization Details Data
  final List<Map<String, dynamic>> _organizationDetails = [
    {
      'id': '1',
      'name': 'Finance Department',
      'description': 'Financial operations, budgeting, and reporting',
      'members': [
        {
          'name': 'Haritha Pawan',
          'role': 'Director',
          'avatar': 'HP',
          'status': 'online',
        },
        {
          'name': 'Michael Chen',
          'role': 'Sr. Analyst',
          'avatar': 'MC',
          'status': 'online',
        },
        {
          'name': 'Sarah Williams',
          'role': 'Budget Manager',
          'avatar': 'SW',
          'status': 'away',
        },
        {
          'name': 'David Kim',
          'role': 'Financial Controller',
          'avatar': 'DK',
          'status': 'offline',
        },
        {
          'name': 'Emma Wilson',
          'role': 'Accountant',
          'avatar': 'EW',
          'status': 'online',
        },
      ],
      'activeProjects': [
        {
          'name': 'Q4 Budget Review',
          'progress': 85,
          'deadline': 'Dec 30',
          'tasks': 12,
        },
        {
          'name': 'Annual Audit',
          'progress': 45,
          'deadline': 'Jan 15',
          'tasks': 8,
        },
        {
          'name': 'Investment Analysis',
          'progress': 30,
          'deadline': 'Jan 10',
          'tasks': 5,
        },
        {
          'name': 'Financial Planning',
          'progress': 60,
          'deadline': 'Dec 28',
          'tasks': 10,
        },
      ],
      'recentDocs': [
        {
          'name': 'Financial Report.pdf',
          'size': '2.4 MB',
          'modified': '2 hours ago',
          'type': 'pdf',
        },
        {
          'name': 'Budget_2024.xlsx',
          'size': '1.8 MB',
          'modified': 'Yesterday',
          'type': 'excel',
        },
        {
          'name': 'Audit_Findings.docx',
          'size': '840 KB',
          'modified': '2 days ago',
          'type': 'doc',
        },
        {
          'name': 'Expense_Report.pdf',
          'size': '1.2 MB',
          'modified': '3 days ago',
          'type': 'pdf',
        },
      ],
      'upcomingEvents': [
        {
          'title': 'Budget Meeting',
          'time': 'Today, 3:00 PM',
          'participants': 8,
          'type': 'meeting',
        },
        {
          'title': 'Audit Review',
          'time': 'Tomorrow, 10:00 AM',
          'participants': 5,
          'type': 'review',
        },
        {
          'title': 'Finance Workshop',
          'time': 'Dec 28, 2:00 PM',
          'participants': 15,
          'type': 'workshop',
        },
        {
          'title': 'Quarterly Review',
          'time': 'Jan 5, 11:00 AM',
          'participants': 12,
          'type': 'review',
        },
      ],
      'stats': {
        'totalBudget': '2.4M',
        'avgCompletion': '78%',
        'activeTasks': 42,
        'meetings': 8,
        'documents': 156,
        'members': 42,
      },
      'announcements': [
        {
          'title': 'Quarterly Budget Freeze',
          'content':
              'All non-essential spending frozen until Q1 budget approval.',
          'author': 'Haritha Pawan',
          'time': '3 hours ago',
          'priority': 'high',
        },
        {
          'title': 'New Expense Policy',
          'content': 'Updated expense reimbursement policy effective Jan 1.',
          'author': 'Michael Chen',
          'time': '1 day ago',
          'priority': 'medium',
        },
        {
          'title': 'Year-End Deadlines',
          'content': 'All financial reports must be submitted by Dec 29.',
          'author': 'Sarah Williams',
          'time': '2 days ago',
          'priority': 'high',
        },
      ],
    },
  ];

  // State variables
  bool _showOrganizationDetails = false;
  Map<String, dynamic>? _selectedOrganization;
  String _selectedCategory = 'All';
  bool _gridView = true;
  List<String> _categories = [
    'All',
    'My Spaces',
    'Finance',
    'Operations',
    'Projects',
    'Technology',
    'HR',
    'Marketing',
    'Legal',
  ];

  // Task Management State
  bool _showTaskManagement = false;
  List<Map<String, dynamic>> _tasks = [];
  String _selectedTaskFilter = 'all';

  @override
  Widget build(BuildContext context) {
    if (_showTaskManagement) {
      return _buildTaskManagementView();
    }

    if (_showOrganizationDetails && _selectedOrganization != null) {
      return _buildOrganizationDetailsView(_selectedOrganization!);
    }

    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header with Task Button
            _buildPremiumHeaderWithTaskButton(),

            // Spaces Content
            Expanded(child: _buildSpacesContent()),
          ],
        ),
      ),

      // Floating Action Button for creating new space
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewSpace,
        backgroundColor: _unPrimary,
        foregroundColor: _white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: _white, width: 2),
        ),
        elevation: 8,
        child: const Icon(LucideIcons.plus, size: 24),
      ),
    );
  }

  // ==========================================
  // TASK MANAGEMENT VIEW
  // ==========================================

  Widget _buildTaskManagementView() {
    final filteredTasks = _getFilteredTasks();

    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Task Header
            Container(
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
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(LucideIcons.arrowLeft),
                    onPressed: () {
                      setState(() {
                        _showTaskManagement = false;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Task Management',
                        style: _titleMedium.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Create and manage team tasks',
                        style: _caption.copyWith(
                          color: _textTertiary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _bgCard,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: _borderLight, width: 1),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.filter,
                          size: 16,
                          color: _textTertiary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Filter',
                          style: _caption.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Task Stats
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(16),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTaskStat(
                      value: _tasks.length.toString(),
                      label: 'Total Tasks',
                      color: _unPrimary,
                      icon: LucideIcons.listTodo,
                    ),
                    _buildTaskStat(
                      value: _tasks
                          .where((t) => t['status'] == 'pending')
                          .length
                          .toString(),
                      label: 'Pending',
                      color: _accentOrange,
                      icon: LucideIcons.clock,
                    ),
                    _buildTaskStat(
                      value: _tasks
                          .where((t) => t['status'] == 'in_progress')
                          .length
                          .toString(),
                      label: 'In Progress',
                      color: _accentBlue,
                      icon: LucideIcons.playCircle,
                    ),
                    _buildTaskStat(
                      value: _tasks
                          .where((t) => t['status'] == 'completed')
                          .length
                          .toString(),
                      label: 'Completed',
                      color: _accentGreen,
                      icon: LucideIcons.checkCircle,
                    ),
                  ],
                ),
              ),
            ),

            // Task List Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Team Tasks',
                    style: _titleMedium.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  _buildTaskFilterChip('All', 'all'),
                  const SizedBox(width: 8),
                  _buildTaskFilterChip('Pending', 'pending'),
                  const SizedBox(width: 8),
                  _buildTaskFilterChip('In Progress', 'in_progress'),
                ],
              ),
            ),

            // Task List
            Expanded(
              child: filteredTasks.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            LucideIcons.listTodo,
                            size: 48,
                            color: _textTertiary,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No tasks yet',
                            style: _titleMedium.copyWith(color: _textSecondary),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Create your first task to get started',
                            style: _caption.copyWith(color: _textTertiary),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              _showCreateTaskDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _unPrimary,
                              foregroundColor: _white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(LucideIcons.plus, size: 16),
                                SizedBox(width: 8),
                                Text('Create Task'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) =>
                          _buildTaskItem(filteredTasks[index]),
                    ),
            ),
          ],
        ),
      ),

      // Create Task FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateTaskDialog(context);
        },
        backgroundColor: _unPrimary,
        foregroundColor: _white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: _white, width: 2),
        ),
        elevation: 8,
        child: const Icon(LucideIcons.plus, size: 24),
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredTasks() {
    if (_selectedTaskFilter == 'all') return _tasks;
    return _tasks
        .where((task) => task['status'] == _selectedTaskFilter)
        .toList();
  }

  Widget _buildTaskStat({
    required String value,
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withOpacity(0.2), width: 1.5),
          ),
          child: Center(child: Icon(icon, size: 20, color: color)),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: _titleMedium.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: _caption.copyWith(color: _textTertiary, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildTaskFilterChip(String label, String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTaskFilter = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _selectedTaskFilter == value ? _unPrimary : _bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _selectedTaskFilter == value ? _unPrimary : _borderLight,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: _caption.copyWith(
            fontWeight: FontWeight.w600,
            color: _selectedTaskFilter == value ? _white : _textTertiary,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem(Map<String, dynamic> task) {
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
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _getTaskPriorityColor(task['priority']).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _getTaskPriorityColor(task['priority']).withOpacity(0.2),
            ),
          ),
          child: Center(
            child: Icon(
              _getTaskPriorityIcon(task['priority']),
              size: 20,
              color: _getTaskPriorityColor(task['priority']),
            ),
          ),
        ),
        title: Text(
          task['title'],
          style: _titleMedium.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              task['description'] ?? '',
              style: _caption.copyWith(color: _textTertiary, fontSize: 11),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getTaskStatusColor(task['status']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: _getTaskStatusColor(
                        task['status'],
                      ).withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    task['status']
                        .toString()
                        .replaceAll('_', ' ')
                        .toUpperCase(),
                    style: _label.copyWith(
                      color: _getTaskStatusColor(task['status']),
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (task['dueDate'] != null)
                  Row(
                    children: [
                      Icon(
                        LucideIcons.calendar,
                        size: 12,
                        color: _textTertiary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        task['dueDate'],
                        style: _caption.copyWith(
                          color: _textTertiary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 8),
            // Assigned Members
            if (task['assignedMembers'] != null &&
                task['assignedMembers'].isNotEmpty)
              Row(
                children: [
                  ...task['assignedMembers'].take(3).map<Widget>((member) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [_unPrimary, _unSecondary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            member['avatar'] ?? '?',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  if (task['assignedMembers'].length > 3)
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: _textQuaternary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: _textQuaternary.withOpacity(0.2),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '+${task['assignedMembers'].length - 3}',
                          style: _label.copyWith(
                            color: _textTertiary,
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                task['isFavorited'] ?? false
                    ? LucideIcons.star
                    : LucideIcons.star,
                size: 20,
                color: task['isFavorited'] ?? false
                    ? _accentOrange
                    : _textQuaternary,
              ),
              onPressed: () {
                setState(() {
                  task['isFavorited'] = !(task['isFavorited'] ?? false);
                });
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        onTap: () {
          _showTaskDetailsDialog(task);
        },
      ),
    );
  }

  Color _getTaskPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return _accentRed;
      case 'medium':
        return _accentOrange;
      case 'low':
        return _accentGreen;
      default:
        return _textTertiary;
    }
  }

  IconData _getTaskPriorityIcon(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return LucideIcons.alertTriangle;
      case 'medium':
        return LucideIcons.alertCircle;
      case 'low':
        return LucideIcons.checkCircle;
      default:
        return LucideIcons.circle;
    }
  }

  Color _getTaskStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return _accentOrange;
      case 'in_progress':
        return _accentBlue;
      case 'completed':
        return _accentGreen;
      case 'blocked':
        return _accentRed;
      default:
        return _textTertiary;
    }
  }

  // ==========================================
  // MAIN SPACES VIEW
  // ==========================================

  Widget _buildPremiumHeaderWithTaskButton() {
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
              // UN Logo/Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: _label.copyWith(
                      color: _unPrimary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Organizations',
                    style: _titleMedium.copyWith(
                      color: _textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              // Task Button + User Profile
              Row(
                children: [
                  // Task Button
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: _buildQuickAction(
                      icon: LucideIcons.listTodo,
                      label: 'Tasks',
                      color: _unPrimary,
                      onTap: () {
                        setState(() {
                          _showTaskManagement = true;
                        });
                      },
                      isSmall: true,
                    ),
                  ),

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
                                  'Director',
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
                              '2',
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

          // Search Bar
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
                      hintText: 'Search organizations, teams...',
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
                    onPressed: _showFilterOptions,
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

  Widget _buildSpacesContent() {
    final favoriteSpaces = _spaces
        .where((s) => s['isFavorited'] == true)
        .toList();
    final filteredSpaces = _selectedCategory == 'All'
        ? _spaces
        : _spaces.where((s) => s['category'] == _selectedCategory).toList();
    final otherSpaces = filteredSpaces
        .where((s) => s['isFavorited'] == false)
        .toList();

    return Column(
      children: [
        // Action Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Row(
            children: [
              // Create Space Button
              _buildQuickAction(
                icon: LucideIcons.plus,
                label: 'Create Space',
                color: _unPrimary,
                onTap: _createNewSpace,
                isSmall: true,
              ),
              const Spacer(),
              // View Options
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
                      isActive: _gridView,
                      onTap: () => setState(() => _gridView = true),
                      isSmall: true,
                    ),
                    _buildViewToggle(
                      icon: LucideIcons.list,
                      isActive: !_gridView,
                      onTap: () => setState(() => _gridView = false),
                      isSmall: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Categories Filter
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: _categories.map((category) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _buildSpaceCategory(
                  category,
                  isActive: _selectedCategory == category,
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 16),

        // Favorites Section
        if (favoriteSpaces.isNotEmpty &&
            (_selectedCategory == 'All' || _selectedCategory == 'My Spaces'))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(LucideIcons.star, size: 16, color: _accentOrange),
                    const SizedBox(width: 8),
                    Text(
                      'Favorites',
                      style: _titleMedium.copyWith(
                        color: _textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${favoriteSpaces.length}',
                      style: _caption.copyWith(
                        color: _textTertiary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),

        // Favorites Grid/List
        if (favoriteSpaces.isNotEmpty &&
            (_selectedCategory == 'All' || _selectedCategory == 'My Spaces'))
          _gridView
              ? Expanded(
                  flex: 1,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                    itemCount: favoriteSpaces.length,
                    itemBuilder: (context, index) =>
                        _buildSpaceCard(favoriteSpaces[index]),
                  ),
                )
              : Expanded(
                  flex: 1,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: favoriteSpaces.length,
                    itemBuilder: (context, index) =>
                        _buildSpaceListItem(favoriteSpaces[index]),
                  ),
                ),

        // All Spaces Section
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Row(
            children: [
              Icon(LucideIcons.users, size: 16, color: _accentGreen),
              const SizedBox(width: 8),
              Text(
                _selectedCategory == 'All'
                    ? 'All Organizations'
                    : '$_selectedCategory Spaces',
                style: _titleMedium.copyWith(
                  color: _textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                '${otherSpaces.length}',
                style: _caption.copyWith(
                  color: _textTertiary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // All Spaces Grid/List
        Expanded(
          flex: 2,
          child: _gridView
              ? GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: otherSpaces.length,
                  itemBuilder: (context, index) =>
                      _buildSpaceCard(otherSpaces[index]),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: otherSpaces.length,
                  itemBuilder: (context, index) =>
                      _buildSpaceListItem(otherSpaces[index]),
                ),
        ),
      ],
    );
  }

  Widget _buildSpaceCategory(String title, {bool isActive = false}) {
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? _unPrimary : _bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? _unPrimary : _borderLight,
            width: 1.5,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: _unPrimary.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          style: _caption.copyWith(
            fontWeight: FontWeight.w600,
            color: isActive ? _white : _textTertiary,
            fontSize: 11,
          ),
        ),
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
                  // Header with Role and Favorite
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getRoleColor(space['role']).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: _getRoleColor(
                              space['role'],
                            ).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          space['role'],
                          style: _label.copyWith(
                            color: _getRoleColor(space['role']),
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          space['isFavorited']
                              ? LucideIcons.star
                              : LucideIcons.star,
                          size: 16,
                          color: space['isFavorited']
                              ? _accentOrange
                              : _textQuaternary,
                        ),
                        onPressed: () {
                          setState(() {
                            space['isFavorited'] = !space['isFavorited'];
                          });
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Space Avatar and Name
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: space['color'],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: space['color'].withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            space['avatar'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
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
                              style: _titleMedium.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                            Text(
                              space['description'],
                              style: _caption.copyWith(
                                color: _textTertiary,
                                fontSize: 11,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

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
                            : space['joinStatus'] == 'pending'
                            ? 'Pending'
                            : 'Join',
                        label: 'Status',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpaceListItem(Map<String, dynamic> space) {
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
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: space['color'],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: space['color'].withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                space['avatar'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          title: Text(
            space['name'],
            style: _titleMedium.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                space['description'],
                style: _caption.copyWith(color: _textTertiary, fontSize: 11),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getRoleColor(space['role']).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: _getRoleColor(space['role']).withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      space['role'],
                      style: _label.copyWith(
                        color: _getRoleColor(space['role']),
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(LucideIcons.users, size: 12, color: _textTertiary),
                      const SizedBox(width: 4),
                      Text(
                        '${space['members']}',
                        style: _caption.copyWith(
                          color: _textTertiary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Row(
                    children: [
                      Icon(LucideIcons.folder, size: 12, color: _textTertiary),
                      const SizedBox(width: 4),
                      Text(
                        '${space['activeProjects']}',
                        style: _caption.copyWith(
                          color: _textTertiary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  space['isFavorited'] ? LucideIcons.star : LucideIcons.star,
                  size: 20,
                  color: space['isFavorited'] ? _accentOrange : _textQuaternary,
                ),
                onPressed: () {
                  setState(() {
                    space['isFavorited'] = !space['isFavorited'];
                  });
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getJoinStatusColor(
                    space['joinStatus'],
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: _getJoinStatusColor(
                      space['joinStatus'],
                    ).withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  space['joinStatus'] == 'joined'
                      ? 'Joined'
                      : space['joinStatus'] == 'pending'
                      ? 'Pending'
                      : 'Join',
                  style: _label.copyWith(
                    color: _getJoinStatusColor(space['joinStatus']),
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
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
        Row(
          children: [
            Icon(icon, size: 14, color: _textTertiary),
            const SizedBox(width: 4),
            Text(
              value,
              style: _caption.copyWith(
                fontWeight: FontWeight.w700,
                color: _textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: _label.copyWith(color: _textQuaternary, fontSize: 9),
        ),
      ],
    );
  }

  Color _getRoleColor(String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        return _accentRed;
      case 'lead':
        return _accentOrange;
      case 'member':
        return _accentGreen;
      default:
        return _unPrimary;
    }
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

  void _createNewSpace() {
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
          'Create New Space',
          style: _titleMedium.copyWith(
            color: _textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Space Name',
                labelStyle: _caption.copyWith(color: _textTertiary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: _borderLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: _unPrimary),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: _caption.copyWith(color: _textTertiary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: _borderLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: _unPrimary),
                ),
              ),
              maxLines: 3,
            ),
          ],
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Space created successfully!'),
                  backgroundColor: _accentGreen,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _unPrimary,
              foregroundColor: _white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showFilterOptions() {
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
              'Filter Options',
              style: _titleMedium.copyWith(
                color: _textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            _buildFilterOption(
              'Joined Spaces',
              LucideIcons.users,
              _accentGreen,
            ),
            _buildFilterOption(
              'Pending Invites',
              LucideIcons.clock,
              _accentOrange,
            ),
            _buildFilterOption('Public Spaces', LucideIcons.globe, _accentBlue),
            _buildFilterOption(
              'Private Spaces',
              LucideIcons.lock,
              _accentPurple,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: _unPrimary,
                foregroundColor: _white,
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, size: 20, color: color),
      title: Text(title, style: _bodyMedium),
      trailing: Switch(
        value: false,
        onChanged: (value) {},
        activeColor: _unPrimary,
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  // ==========================================
  // ORGANIZATION DETAILS VIEW
  // ==========================================

  Widget _buildOrganizationDetailsView(Map<String, dynamic> org) {
    final details = _organizationDetails.firstWhere(
      (element) => element['id'] == org['id'],
      orElse: () => _organizationDetails[0],
    );

    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Organization Header
            SliverAppBar(
              expandedHeight: 180,
              floating: false,
              pinned: true,
              backgroundColor: _white,
              leading: IconButton(
                icon: const Icon(LucideIcons.arrowLeft),
                onPressed: () {
                  setState(() {
                    _showOrganizationDetails = false;
                    _selectedOrganization = null;
                  });
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [_unPrimary.withOpacity(0.1), _unLight],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: org['color'],
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: org['color'].withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  org['avatar'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    org['name'],
                                    style: _display.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    org['description'],
                                    style: _bodyLarge.copyWith(
                                      color: _textSecondary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: _getRoleColor(
                                  org['role'],
                                ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: _getRoleColor(
                                    org['role'],
                                  ).withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                '${org['role']} • ${org['members']} members',
                                style: _caption.copyWith(
                                  color: _getRoleColor(org['role']),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const Spacer(),
                            _buildQuickAction(
                              icon: LucideIcons.share2,
                              label: 'Invite',
                              color: _unPrimary,
                              onTap: () {},
                              isSmall: true,
                            ),
                            const SizedBox(width: 8),
                            _buildQuickAction(
                              icon: org['isFavorited']
                                  ? LucideIcons.star
                                  : LucideIcons.star,
                              label: 'Favorite',
                              color: org['isFavorited']
                                  ? _accentOrange
                                  : _textTertiary,
                              onTap: () {
                                setState(() {
                                  org['isFavorited'] = !org['isFavorited'];
                                });
                              },
                              isSmall: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Key Stats
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(16),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
              ),
            ),

            // Quick Actions Row
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildDetailAction(
                        icon: LucideIcons.messageSquare,
                        label: 'Chat',
                        color: _accentBlue,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDetailAction(
                        icon: LucideIcons.calendar,
                        label: 'Events',
                        color: _accentPurple,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDetailAction(
                        icon: LucideIcons.folder,
                        label: 'Files',
                        color: _accentGreen,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDetailAction(
                        icon: LucideIcons.listTodo,
                        label: 'Tasks',
                        color: _accentIndigo,
                        onTap: () {
                          setState(() {
                            _showTaskManagement = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Announcements Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  children: [
                    Icon(LucideIcons.megaphone, size: 18, color: _unPrimary),
                    const SizedBox(width: 8),
                    Text(
                      'Announcements',
                      style: _titleMedium.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: _caption.copyWith(color: _unPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final announcement = details['announcements'][index];
                return _buildAnnouncementCard(announcement);
              }, childCount: details['announcements'].length),
            ),

            // Active Projects Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  children: [
                    Icon(LucideIcons.folder, size: 18, color: _accentGreen),
                    const SizedBox(width: 8),
                    Text(
                      'Active Projects',
                      style: _titleMedium.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: _caption.copyWith(color: _unPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final project = details['activeProjects'][index];
                return _buildProjectCard(project);
              }, childCount: details['activeProjects'].length),
            ),

            // Tasks Section in Organization
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  children: [
                    Icon(LucideIcons.listTodo, size: 18, color: _accentIndigo),
                    const SizedBox(width: 8),
                    Text(
                      'Recent Tasks',
                      style: _titleMedium.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    _buildQuickAction(
                      icon: LucideIcons.plus,
                      label: 'Add Task',
                      color: _unPrimary,
                      onTap: () {
                        _showCreateTaskDialog(context);
                      },
                      isSmall: true,
                    ),
                  ],
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final sampleTasks = [
                  {
                    'title': 'Review Q4 Financial Report',
                    'priority': 'high',
                    'status': 'in_progress',
                    'assignee': 'Haritha Pawan',
                    'dueDate': '2024-12-30',
                  },
                  {
                    'title': 'Prepare Budget Presentation',
                    'priority': 'medium',
                    'status': 'pending',
                    'assignee': 'Michael Chen',
                    'dueDate': '2024-12-28',
                  },
                  {
                    'title': 'Audit Documentation',
                    'priority': 'low',
                    'status': 'completed',
                    'assignee': 'Sarah Williams',
                    'dueDate': '2024-12-25',
                  },
                ];

                if (index < sampleTasks.length) {
                  return _buildOrgTaskCard(sampleTasks[index]);
                }
                return const SizedBox.shrink();
              }, childCount: 3),
            ),

            // Team Members Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  children: [
                    Icon(LucideIcons.users, size: 18, color: _accentPurple),
                    const SizedBox(width: 8),
                    Text(
                      'Team Members',
                      style: _titleMedium.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '${details['members'].length} members',
                        style: _caption.copyWith(color: _unPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final member = details['members'][index];
                  return _buildTeamMemberCard(member);
                }, childCount: details['members'].length),
              ),
            ),

            // Recent Documents Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  children: [
                    Icon(LucideIcons.fileText, size: 18, color: _accentOrange),
                    const SizedBox(width: 8),
                    Text(
                      'Recent Documents',
                      style: _titleMedium.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: _caption.copyWith(color: _unPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final doc = details['recentDocs'][index];
                return _buildDocumentCard(doc);
              }, childCount: details['recentDocs'].length),
            ),

            // Upcoming Events Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  children: [
                    Icon(LucideIcons.calendar, size: 18, color: _accentRed),
                    const SizedBox(width: 8),
                    Text(
                      'Upcoming Events',
                      style: _titleMedium.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Calendar',
                        style: _caption.copyWith(color: _unPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final event = details['upcomingEvents'][index];
                return _buildEventCard(event);
              }, childCount: details['upcomingEvents'].length),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrgTaskCard(Map<String, dynamic> task) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderLight, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _getTaskPriorityColor(task['priority']).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _getTaskPriorityColor(task['priority']).withOpacity(0.2),
              ),
            ),
            child: Center(
              child: Icon(
                _getTaskPriorityIcon(task['priority']),
                size: 18,
                color: _getTaskPriorityColor(task['priority']),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task['title'],
                  style: _bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _getTaskStatusColor(
                          task['status'],
                        ).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: _getTaskStatusColor(
                            task['status'],
                          ).withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        task['status'].replaceAll('_', ' ').toUpperCase(),
                        style: _label.copyWith(
                          color: _getTaskStatusColor(task['status']),
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(LucideIcons.calendar, size: 12, color: _textTertiary),
                    const SizedBox(width: 4),
                    Text(
                      task['dueDate'],
                      style: _caption.copyWith(
                        color: _textTertiary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                task['assignee'],
                style: _caption.copyWith(
                  color: _textTertiary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [_unPrimary, _unSecondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    task['assignee'].substring(0, 2),
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
        ],
      ),
    );
  }

  Widget _buildDetailStat({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withOpacity(0.2), width: 1.5),
          ),
          child: Center(child: Icon(icon, size: 20, color: color)),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: _titleMedium.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: _caption.copyWith(color: _textTertiary, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildDetailAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: _bgCard,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _borderLight, width: 1.5),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: 6),
            Text(
              label,
              style: _caption.copyWith(
                fontWeight: FontWeight.w600,
                color: _textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementCard(Map<String, dynamic> announcement) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _borderLight, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getPriorityColor(
                    announcement['priority'],
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: _getPriorityColor(
                      announcement['priority'],
                    ).withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  announcement['priority'].toUpperCase(),
                  style: _label.copyWith(
                    color: _getPriorityColor(announcement['priority']),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                announcement['time'],
                style: _label.copyWith(color: _textQuaternary, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            announcement['title'],
            style: _titleMedium.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            announcement['content'],
            style: _bodyMedium.copyWith(color: _textSecondary, fontSize: 13),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [_unPrimary, _unSecondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    announcement['author'].substring(0, 2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                announcement['author'],
                style: _caption.copyWith(
                  fontWeight: FontWeight.w600,
                  color: _textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _borderLight, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _accentGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _accentGreen.withOpacity(0.2)),
                ),
                child: Center(
                  child: Icon(
                    LucideIcons.folder,
                    size: 18,
                    color: _accentGreen,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project['name'],
                      style: _titleMedium.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          LucideIcons.calendar,
                          size: 12,
                          color: _textTertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Due: ${project['deadline']}',
                          style: _caption.copyWith(color: _textTertiary),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          LucideIcons.checkSquare,
                          size: 12,
                          color: _textTertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${project['tasks']} tasks',
                          style: _caption.copyWith(color: _textTertiary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                '${project['progress']}%',
                style: _titleMedium.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: _accentGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: project['progress'] / 100,
            backgroundColor: _borderLight,
            color: _accentGreen,
            borderRadius: BorderRadius.circular(4),
            minHeight: 6,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress', style: _caption.copyWith(color: _textTertiary)),
              Text(
                '${project['progress']}% complete',
                style: _caption.copyWith(
                  color: _textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard(Map<String, dynamic> member) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderLight, width: 1.5),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [_unPrimary, _unSecondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    member['avatar'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _getStatusColor(member['status']),
                    shape: BoxShape.circle,
                    border: Border.all(color: _bgCard, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member['name'],
                  style: _bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  member['role'],
                  style: _caption.copyWith(color: _textTertiary, fontSize: 11),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(LucideIcons.messageSquare, size: 16),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
              const SizedBox(width: 4),
              IconButton(
                icon: const Icon(LucideIcons.phone, size: 16),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'online':
        return _accentGreen;
      case 'away':
        return _accentOrange;
      default:
        return _textQuaternary;
    }
  }

  Widget _buildDocumentCard(Map<String, dynamic> doc) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderLight, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _getDocTypeColor(doc['type']).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _getDocTypeColor(doc['type']).withOpacity(0.2),
              ),
            ),
            child: Center(
              child: Icon(
                _getDocTypeIcon(doc['type']),
                size: 18,
                color: _getDocTypeColor(doc['type']),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doc['name'],
                  style: _bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${doc['size']} • ${doc['modified']}',
                  style: _caption.copyWith(color: _textTertiary, fontSize: 11),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(LucideIcons.moreVertical, size: 16),
            onPressed: () {},
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  IconData _getDocTypeIcon(String type) {
    switch (type) {
      case 'pdf':
        return LucideIcons.fileText;
      case 'excel':
        return LucideIcons.fileSpreadsheet;
      case 'doc':
        return LucideIcons.fileEdit;
      default:
        return LucideIcons.file;
    }
  }

  Color _getDocTypeColor(String type) {
    switch (type) {
      case 'pdf':
        return _accentRed;
      case 'excel':
        return _accentGreen;
      case 'doc':
        return _accentBlue;
      default:
        return _unPrimary;
    }
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderLight, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _getEventTypeColor(event['type']).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _getEventTypeColor(event['type']).withOpacity(0.2),
              ),
            ),
            child: Center(
              child: Icon(
                _getEventTypeIcon(event['type']),
                size: 18,
                color: _getEventTypeColor(event['type']),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['title'],
                  style: _bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  event['time'],
                  style: _caption.copyWith(color: _textTertiary, fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _unLight,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(LucideIcons.users, size: 12, color: _textTertiary),
                const SizedBox(width: 4),
                Text(
                  '${event['participants']}',
                  style: _caption.copyWith(color: _textTertiary, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getEventTypeIcon(String type) {
    switch (type) {
      case 'meeting':
        return LucideIcons.users;
      case 'review':
        return LucideIcons.clipboardCheck;
      case 'workshop':
        return LucideIcons.presentation;
      default:
        return LucideIcons.calendar;
    }
  }

  Color _getEventTypeColor(String type) {
    switch (type) {
      case 'meeting':
        return _accentBlue;
      case 'review':
        return _accentGreen;
      case 'workshop':
        return _accentPurple;
      default:
        return _accentOrange;
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'high':
        return _accentRed;
      case 'medium':
        return _accentOrange;
      default:
        return _accentGreen;
    }
  }

  // ==========================================
  // CREATE TASK DIALOG
  // ==========================================

  void _showCreateTaskDialog(BuildContext context) {
    // Sample members from current organization
    List<Map<String, dynamic>> availableMembers = [
      {'id': '1', 'name': 'Haritha Pawan', 'avatar': 'HP', 'role': 'Director'},
      {
        'id': '2',
        'name': 'Michael Chen',
        'avatar': 'MC',
        'role': 'Sr. Analyst',
      },
      {
        'id': '3',
        'name': 'Sarah Williams',
        'avatar': 'SW',
        'role': 'Budget Manager',
      },
      {
        'id': '4',
        'name': 'David Kim',
        'avatar': 'DK',
        'role': 'Financial Controller',
      },
      {'id': '5', 'name': 'Emma Wilson', 'avatar': 'EW', 'role': 'Accountant'},
    ];

    List<Map<String, dynamic>> selectedMembers = [];
    String taskTitle = '';
    String taskDescription = '';
    String selectedPriority = 'medium';
    String selectedStatus = 'pending';
    DateTime? selectedDueDate;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: _bgCard,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: _borderLight, width: 1.5),
              ),
              title: Text(
                'Create New Task',
                style: _titleMedium.copyWith(
                  color: _textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Task Title
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Task Title *',
                          labelStyle: _caption.copyWith(color: _textTertiary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: _borderLight),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: _unPrimary),
                          ),
                        ),
                        onChanged: (value) => taskTitle = value,
                      ),
                      const SizedBox(height: 16),

                      // Task Description
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: _caption.copyWith(color: _textTertiary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: _borderLight),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: _unPrimary),
                          ),
                        ),
                        maxLines: 3,
                        onChanged: (value) => taskDescription = value,
                      ),
                      const SizedBox(height: 16),

                      // Priority Selection
                      Row(
                        children: [
                          Text(
                            'Priority:',
                            style: _bodyMedium.copyWith(
                              color: _textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          ...['high', 'medium', 'low'].map((priority) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ChoiceChip(
                                label: Text(
                                  priority.toUpperCase(),
                                  style: _caption.copyWith(
                                    color: selectedPriority == priority
                                        ? _white
                                        : _getTaskPriorityColor(priority),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                selected: selectedPriority == priority,
                                selectedColor: _getTaskPriorityColor(priority),
                                backgroundColor: _getTaskPriorityColor(
                                  priority,
                                ).withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: _getTaskPriorityColor(
                                      priority,
                                    ).withOpacity(0.2),
                                  ),
                                ),
                                onSelected: (selected) {
                                  setState(() {
                                    selectedPriority = priority;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Status Selection
                      Row(
                        children: [
                          Text(
                            'Status:',
                            style: _bodyMedium.copyWith(
                              color: _textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          DropdownButton<String>(
                            value: selectedStatus,
                            onChanged: (value) {
                              setState(() {
                                selectedStatus = value!;
                              });
                            },
                            items:
                                [
                                  'pending',
                                  'in_progress',
                                  'completed',
                                  'blocked',
                                ].map((status) {
                                  return DropdownMenuItem(
                                    value: status,
                                    child: Text(
                                      status.replaceAll('_', ' ').toUpperCase(),
                                      style: _caption.copyWith(
                                        color: _getTaskStatusColor(status),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                }).toList(),
                            underline: Container(
                              height: 1,
                              color: _borderLight,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Due Date
                      GestureDetector(
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                          );
                          if (date != null) {
                            setState(() {
                              selectedDueDate = date;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _bgCard,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: _borderLight, width: 1),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                LucideIcons.calendar,
                                size: 18,
                                color: _textTertiary,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                selectedDueDate != null
                                    ? 'Due: ${selectedDueDate!.toLocal().toString().split(' ')[0]}'
                                    : 'Set Due Date (Optional)',
                                style: _bodyMedium.copyWith(
                                  color: selectedDueDate != null
                                      ? _textPrimary
                                      : _textTertiary,
                                ),
                              ),
                              const Spacer(),
                              if (selectedDueDate != null)
                                IconButton(
                                  icon: const Icon(LucideIcons.x, size: 16),
                                  onPressed: () {
                                    setState(() {
                                      selectedDueDate = null;
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Members Assignment Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Assign Members',
                                style: _bodyMedium.copyWith(
                                  color: _textSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: _unPrimary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: _unPrimary.withOpacity(0.2),
                                  ),
                                ),
                                child: Text(
                                  '${selectedMembers.length} selected',
                                  style: _label.copyWith(
                                    color: _unPrimary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Member Selection Grid
                          Container(
                            decoration: BoxDecoration(
                              color: _bgCard,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: _borderLight, width: 1),
                            ),
                            child: Column(
                              children: [
                                // Search for Members
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: _bgLight,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: _borderLight,
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 12),
                                        Icon(
                                          LucideIcons.search,
                                          size: 16,
                                          color: _textTertiary,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Search members...',
                                              hintStyle: _caption.copyWith(
                                                color: _textQuaternary,
                                              ),
                                              border: InputBorder.none,
                                              isDense: true,
                                            ),
                                            style: _bodyMedium.copyWith(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Member List
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    itemCount: availableMembers.length,
                                    itemBuilder: (context, index) {
                                      final member = availableMembers[index];
                                      final isSelected = selectedMembers.any(
                                        (m) => m['id'] == member['id'],
                                      );

                                      return ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                _unPrimary,
                                                _unSecondary,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              member['avatar'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          member['name'],
                                          style: _bodyMedium.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        subtitle: Text(
                                          member['role'],
                                          style: _caption.copyWith(
                                            color: _textTertiary,
                                            fontSize: 11,
                                          ),
                                        ),
                                        trailing: Checkbox(
                                          value: isSelected,
                                          onChanged: (value) {
                                            setState(() {
                                              if (value == true) {
                                                selectedMembers.add(member);
                                              } else {
                                                selectedMembers.removeWhere(
                                                  (m) =>
                                                      m['id'] == member['id'],
                                                );
                                              }
                                            });
                                          },
                                          activeColor: _unPrimary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                // Selected Members Preview
                                if (selectedMembers.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Selected Members:',
                                          style: _caption.copyWith(
                                            color: _textTertiary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: selectedMembers.map((
                                            member,
                                          ) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 6,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: _unPrimary.withOpacity(
                                                  0.1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: _unPrimary.withOpacity(
                                                    0.2,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      gradient:
                                                          const LinearGradient(
                                                            colors: [
                                                              _unPrimary,
                                                              _unSecondary,
                                                            ],
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6,
                                                          ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        member['avatar'],
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    member['name'],
                                                    style: _caption.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedMembers.remove(
                                                          member,
                                                        );
                                                      });
                                                    },
                                                    child: Icon(
                                                      LucideIcons.x,
                                                      size: 12,
                                                      color: _textTertiary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
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
                  onPressed: taskTitle.isEmpty
                      ? null
                      : () {
                          final newTask = {
                            'id': '${_tasks.length + 1}',
                            'title': taskTitle,
                            'description': taskDescription,
                            'priority': selectedPriority,
                            'status': selectedStatus,
                            'dueDate': selectedDueDate != null
                                ? selectedDueDate!.toLocal().toString().split(
                                    ' ',
                                  )[0]
                                : null,
                            'assignedMembers': selectedMembers,
                            'createdAt': DateTime.now().toLocal().toString(),
                            'isFavorited': false,
                          };

                          setState(() {
                            _tasks.add(newTask);
                          });

                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Task created successfully!'),
                              backgroundColor: _accentGreen,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _unPrimary,
                    foregroundColor: _white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Create Task'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showTaskDetailsDialog(Map<String, dynamic> task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: _bgCard,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: _borderLight, width: 1.5),
          ),
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _getTaskPriorityColor(
                    task['priority'],
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _getTaskPriorityColor(
                      task['priority'],
                    ).withOpacity(0.2),
                  ),
                ),
                child: Center(
                  child: Icon(
                    _getTaskPriorityIcon(task['priority']),
                    size: 20,
                    color: _getTaskPriorityColor(task['priority']),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  task['title'],
                  style: _titleMedium.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status and Due Date
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getTaskStatusColor(
                            task['status'],
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: _getTaskStatusColor(
                              task['status'],
                            ).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          task['status']
                              .toString()
                              .replaceAll('_', ' ')
                              .toUpperCase(),
                          style: _label.copyWith(
                            color: _getTaskStatusColor(task['status']),
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (task['dueDate'] != null)
                        Row(
                          children: [
                            Icon(
                              LucideIcons.calendar,
                              size: 14,
                              color: _textTertiary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Due: ${task['dueDate']}',
                              style: _caption.copyWith(color: _textSecondary),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Description
                  if (task['description'] != null &&
                      task['description'].isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description:',
                          style: _bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                            color: _textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          task['description'],
                          style: _bodyMedium.copyWith(color: _textSecondary),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),

                  // Assigned Members
                  if (task['assignedMembers'] != null &&
                      task['assignedMembers'].isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Assigned to:',
                          style: _bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                            color: _textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: task['assignedMembers'].map<Widget>((
                            member,
                          ) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: _unPrimary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: _unPrimary.withOpacity(0.2),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [_unPrimary, _unSecondary],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        member['avatar'] ?? '?',
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
                                    member['name'],
                                    style: _caption.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Close',
                style: _bodyMedium.copyWith(color: _textTertiary),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Implement edit functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _unPrimary,
                foregroundColor: _white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Edit Task'),
            ),
          ],
        );
      },
    );
  }
}
