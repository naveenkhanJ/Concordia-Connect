import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TaskManagementPage extends StatefulWidget {
  const TaskManagementPage({super.key});

  @override
  State<TaskManagementPage> createState() => _TaskManagementPageState();
}

class StatusColumn {
  final String status;
  final String title;
  final Color color;

  StatusColumn({
    required this.status,
    required this.title,
    required this.color,
  });
}

class _TaskManagementPageState extends State<TaskManagementPage> {
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

  // Task Status Colors
  static const Color _statusTodo = Color(0xFF667EEA);
  static const Color _statusInProgress = Color(0xFFED8936);
  static const Color _statusReview = Color(0xFF9F7AEA);
  static const Color _statusDone = Color(0xFF38B2AC);
  static const Color _statusBlocked = Color(0xFFF56565);

  // Priority Colors
  static const Color _priorityHigh = Color(0xFFF56565);
  static const Color _priorityMedium = Color(0xFFED8936);
  static const Color _priorityLow = Color(0xFF38B2AC);

  // Category Colors
  static const Color _categoryDesign = Color(0xFFED64A6);
  static const Color _categoryDev = Color(0xFF4299E1);
  static const Color _categoryMarketing = Color(0xFF9F7AEA);
  static const Color _categoryPlanning = Color(0xFF48BB78);
  static const Color _categoryMeeting = Color(0xFFED8936);
  static const Color _categoryResearch = Color(0xFF0BC5EA);

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

  // Sample Tasks Data
  final List<Map<String, dynamic>> _tasks = [
    {
      'id': '1',
      'title': 'Design dashboard layout',
      'description': 'Create wireframes and mockups for the new dashboard',
      'status': 'in_progress',
      'priority': 'high',
      'category': 'design',
      'dueDate': 'Today, 5:00 PM',
      'assignee': {
        'name': 'Alex Morgan',
        'avatar': 'AM',
        'color': _categoryDesign,
      },
      'project': 'Dashboard Redesign',
      'tags': ['UI/UX', 'Figma'],
      'subtasks': [
        {'title': 'Wireframe creation', 'completed': true},
        {'title': 'Mockup design', 'completed': true},
        {'title': 'User feedback', 'completed': false},
      ],
      'comments': 8,
      'attachments': 3,
      'timeEstimate': '4h',
      'created': '2 days ago',
      'isPinned': true,
    },
    {
      'id': '2',
      'title': 'Implement authentication API',
      'description': 'Create secure authentication endpoints with JWT',
      'status': 'todo',
      'priority': 'high',
      'category': 'development',
      'dueDate': 'Tomorrow, 10:00 AM',
      'assignee': {'name': 'Sam Chen', 'avatar': 'SC', 'color': _categoryDev},
      'project': 'Backend Services',
      'tags': ['API', 'Security', 'Node.js'],
      'subtasks': [
        {'title': 'Setup JWT middleware', 'completed': true},
        {'title': 'Create login endpoint', 'completed': false},
        {'title': 'Implement refresh token', 'completed': false},
      ],
      'comments': 5,
      'attachments': 2,
      'timeEstimate': '6h',
      'created': '1 day ago',
      'isPinned': false,
    },
    {
      'id': '3',
      'title': 'Q4 Marketing Campaign Review',
      'description': 'Analyze performance metrics and prepare report',
      'status': 'review',
      'priority': 'medium',
      'category': 'marketing',
      'dueDate': 'Dec 28',
      'assignee': {
        'name': 'Lisa Wang',
        'avatar': 'LW',
        'color': _categoryMarketing,
      },
      'project': 'Marketing Strategy',
      'tags': ['Analytics', 'Report'],
      'subtasks': [
        {'title': 'Gather metrics', 'completed': true},
        {'title': 'Create presentation', 'completed': true},
        {'title': 'Team review', 'completed': false},
      ],
      'comments': 12,
      'attachments': 5,
      'timeEstimate': '3h',
      'created': '3 days ago',
      'isPinned': true,
    },
    {
      'id': '4',
      'title': 'User Research Interviews',
      'description': 'Conduct interviews with 10 potential users',
      'status': 'todo',
      'priority': 'medium',
      'category': 'research',
      'dueDate': 'Jan 5',
      'assignee': {'name': 'You', 'avatar': 'ME', 'color': _categoryResearch},
      'project': 'User Experience',
      'tags': ['Research', 'User Testing'],
      'subtasks': [
        {'title': 'Prepare questions', 'completed': true},
        {'title': 'Schedule interviews', 'completed': false},
        {'title': 'Conduct interviews', 'completed': false},
      ],
      'comments': 3,
      'attachments': 0,
      'timeEstimate': '8h',
      'created': '4 days ago',
      'isPinned': false,
    },
    {
      'id': '5',
      'title': 'Team Planning Session',
      'description': 'Quarterly planning and goal setting meeting',
      'status': 'todo',
      'priority': 'low',
      'category': 'meeting',
      'dueDate': 'Jan 8, 2:00 PM',
      'assignee': {
        'name': 'Maria Silva',
        'avatar': 'MS',
        'color': _categoryMeeting,
      },
      'project': 'Team Operations',
      'tags': ['Planning', 'Meeting'],
      'subtasks': [
        {'title': 'Book conference room', 'completed': true},
        {'title': 'Prepare agenda', 'completed': false},
        {'title': 'Send invites', 'completed': false},
      ],
      'comments': 6,
      'attachments': 1,
      'timeEstimate': '2h',
      'created': '5 days ago',
      'isPinned': false,
    },
    {
      'id': '6',
      'title': 'Database Migration',
      'description': 'Migrate user data to new database schema',
      'status': 'blocked',
      'priority': 'high',
      'category': 'development',
      'dueDate': 'Dec 30',
      'assignee': {'name': 'Raj Patel', 'avatar': 'RP', 'color': _categoryDev},
      'project': 'Infrastructure',
      'tags': ['Database', 'Migration'],
      'subtasks': [
        {'title': 'Backup current data', 'completed': true},
        {'title': 'Test migration script', 'completed': false},
        {'title': 'Execute migration', 'completed': false},
      ],
      'comments': 15,
      'attachments': 4,
      'timeEstimate': '12h',
      'created': '1 week ago',
      'isPinned': false,
    },
    {
      'id': '7',
      'title': 'Design System Documentation',
      'description': 'Document all components in the design system',
      'status': 'done',
      'priority': 'medium',
      'category': 'design',
      'dueDate': 'Dec 22',
      'assignee': {
        'name': 'Alex Morgan',
        'avatar': 'AM',
        'color': _categoryDesign,
      },
      'project': 'Design System',
      'tags': ['Documentation', 'Design System'],
      'subtasks': [
        {'title': 'Component catalog', 'completed': true},
        {'title': 'Usage guidelines', 'completed': true},
        {'title': 'Examples gallery', 'completed': true},
      ],
      'comments': 4,
      'attachments': 7,
      'timeEstimate': '10h',
      'created': '2 weeks ago',
      'isPinned': false,
    },
    {
      'id': '8',
      'title': 'Budget Planning for Q1',
      'description': 'Prepare financial projections and budget allocation',
      'status': 'in_progress',
      'priority': 'high',
      'category': 'planning',
      'dueDate': 'Jan 10',
      'assignee': {
        'name': 'James Wilson',
        'avatar': 'JW',
        'color': _categoryPlanning,
      },
      'project': 'Finance',
      'tags': ['Budget', 'Planning'],
      'subtasks': [
        {'title': 'Gather expense data', 'completed': true},
        {'title': 'Create projections', 'completed': true},
        {'title': 'Review with finance team', 'completed': false},
      ],
      'comments': 9,
      'attachments': 3,
      'timeEstimate': '5h',
      'created': '3 days ago',
      'isPinned': true,
    },
  ];

  // Projects Data
  final List<Map<String, dynamic>> _projects = [
    {
      'id': '1',
      'name': 'Dashboard Redesign',
      'color': _categoryDesign,
      'progress': 65,
      'tasks': 12,
      'completed': 8,
    },
    {
      'id': '2',
      'name': 'Backend Services',
      'color': _categoryDev,
      'progress': 40,
      'tasks': 18,
      'completed': 7,
    },
    {
      'id': '3',
      'name': 'Marketing Strategy',
      'color': _categoryMarketing,
      'progress': 85,
      'tasks': 8,
      'completed': 7,
    },
    {
      'id': '4',
      'name': 'User Experience',
      'color': _categoryResearch,
      'progress': 30,
      'tasks': 6,
      'completed': 2,
    },
  ];

  // Team Members
  final List<Map<String, dynamic>> _teamMembers = [
    {
      'name': 'You',
      'role': 'Product Manager',
      'avatar': 'ME',
      'status': 'online',
      'color': _primary,
      'tasks': 8,
    },
    {
      'name': 'Alex Morgan',
      'role': 'UI/UX Designer',
      'avatar': 'AM',
      'status': 'online',
      'color': _categoryDesign,
      'tasks': 12,
    },
    {
      'name': 'Sam Chen',
      'role': 'Backend Developer',
      'avatar': 'SC',
      'status': 'away',
      'color': _categoryDev,
      'tasks': 15,
    },
    {
      'name': 'Lisa Wang',
      'role': 'Marketing Lead',
      'avatar': 'LW',
      'status': 'offline',
      'color': _categoryMarketing,
      'tasks': 6,
    },
    {
      'name': 'Maria Silva',
      'role': 'Operations Manager',
      'avatar': 'MS',
      'status': 'online',
      'color': _categoryMeeting,
      'tasks': 4,
    },
  ];

  // State Variables
  String _selectedView = 'list'; // 'list' or 'board' or 'calendar'
  String _selectedFilter =
      'all'; // 'all', 'todo', 'in_progress', 'done', 'my_tasks'
  String _selectedProject = 'all';
  bool _showCompleted = true;
  List<String> _selectedTags = [];

  // Available Filters
  final List<String> _filters = [
    'All Tasks',
    'My Tasks',
    'To Do',
    'In Progress',
    'Review',
    'Done',
    'Blocked',
    'High Priority',
    'Today',
    'This Week',
  ];

  // Available Tags
  final List<String> _availableTags = [
    'UI/UX',
    'API',
    'Security',
    'Node.js',
    'Analytics',
    'Report',
    'Research',
    'Planning',
    'Database',
    'Meeting',
    'Design System',
    'Budget',
    'Figma',
    'User Testing',
    'Migration',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredTasks = _filterTasks();

    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            // Filters Bar
            _buildFiltersBar(),
            // Stats Cards
            _buildStatsCards(),
            // Main Content
            Expanded(
              child: _selectedView == 'board'
                  ? _buildBoardView(filteredTasks)
                  : _selectedView == 'calendar'
                  ? _buildCalendarView()
                  : _buildListView(filteredTasks),
            ),
          ],
        ),
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewTask,
        backgroundColor: _primary,
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
                  Text(
                    'Task Management',
                    style: _display.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_tasks.where((t) => t['status'] != 'done').length} active tasks',
                    style: _bodySmall.copyWith(color: _textTertiary),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 16),
          // View Toggles
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: _borderLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildViewToggle(
                  icon: LucideIcons.list,
                  label: 'List',
                  isActive: _selectedView == 'list',
                  onTap: () => setState(() => _selectedView = 'list'),
                ),
                _buildViewToggle(
                  icon: LucideIcons.layoutGrid,
                  label: 'Board',
                  isActive: _selectedView == 'board',
                  onTap: () => setState(() => _selectedView = 'board'),
                ),
                _buildViewToggle(
                  icon: LucideIcons.calendar,
                  label: 'Calendar',
                  isActive: _selectedView == 'calendar',
                  onTap: () => setState(() => _selectedView = 'calendar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFiltersBar() {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: _filters.map((filter) {
          final isActive = _getFilterKey(filter) == _selectedFilter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _buildFilterChip(filter, isActive),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isActive) {
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = _getFilterKey(label)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? _primary : _bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? _primary : _borderLight,
            width: 1.5,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: _primary.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Text(
              label,
              style: _caption.copyWith(
                fontWeight: FontWeight.w600,
                color: isActive ? _white : _textTertiary,
              ),
            ),
            if (label == 'My Tasks')
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
                  '${_tasks.where((t) => t['assignee']['name'] == 'You').length}',
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

  Widget _buildStatsCards() {
    final totalTasks = _tasks.length;
    final completedTasks = _tasks.where((t) => t['status'] == 'done').length;
    final inProgressTasks = _tasks
        .where((t) => t['status'] == 'in_progress')
        .length;
    final overdueTasks = _tasks.where((t) => t['dueDate'] == 'Overdue').length;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              value: '$totalTasks',
              label: 'Total Tasks',
              icon: LucideIcons.checkSquare,
              color: _primary,
              progress: totalTasks > 0 ? completedTasks / totalTasks : 0,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              value: '$completedTasks',
              label: 'Completed',
              icon: LucideIcons.checkCircle,
              color: _statusDone,
              progress: totalTasks > 0 ? completedTasks / totalTasks : 0,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              value: '$inProgressTasks',
              label: 'In Progress',
              icon: LucideIcons.clock,
              color: _statusInProgress,
              progress: totalTasks > 0 ? inProgressTasks / totalTasks : 0,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              value: '$overdueTasks',
              label: 'Overdue',
              icon: LucideIcons.alertCircle,
              color: _statusBlocked,
              progress: totalTasks > 0 ? overdueTasks / totalTasks : 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String value,
    required String label,
    required IconData icon,
    required Color color,
    required double progress,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Icon(icon, size: 16, color: color)),
              ),
              const Spacer(),
              Text(
                value,
                style: _titleLarge.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(label, style: _caption.copyWith(color: _textTertiary)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: _borderLight,
              color: color,
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<Map<String, dynamic>> tasks) {
    final pinnedTasks = tasks.where((t) => t['isPinned'] == true).toList();
    final otherTasks = tasks.where((t) => t['isPinned'] != true).toList();

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Pinned Tasks Section
        if (pinnedTasks.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Row(
                children: [
                  Icon(LucideIcons.pin, size: 14, color: _textTertiary),
                  const SizedBox(width: 6),
                  Text(
                    'Pinned Tasks',
                    style: _caption.copyWith(
                      color: _textTertiary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: _textTertiary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${pinnedTasks.length}',
                      style: _label.copyWith(color: _textTertiary, fontSize: 9),
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Pinned Tasks
        if (pinnedTasks.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  index == 0 ? 0 : 8,
                  20,
                  index == pinnedTasks.length - 1 ? 12 : 0,
                ),
                child: _buildTaskCard(pinnedTasks[index]),
              ),
              childCount: pinnedTasks.length,
            ),
          ),

        // All Tasks Section
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Row(
              children: [
                Icon(LucideIcons.checkSquare, size: 14, color: _textTertiary),
                const SizedBox(width: 6),
                Text(
                  'All Tasks',
                  style: _titleSmall.copyWith(color: _textPrimary),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: _textTertiary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${otherTasks.length}',
                    style: _label.copyWith(color: _textTertiary, fontSize: 9),
                  ),
                ),
              ],
            ),
          ),
        ),

        // All Tasks
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                0,
                20,
                index == otherTasks.length - 1 ? 20 : 8,
              ),
              child: _buildTaskCard(otherTasks[index]),
            ),
            childCount: otherTasks.length,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task) {
    final statusColor = _getStatusColor(task['status']);
    final priorityColor = _getPriorityColor(task['priority']);
    final categoryColor = _getCategoryColor(task['category']);

    return GestureDetector(
      onTap: () => _showTaskDetails(task),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status and Actions
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: statusColor.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          _getStatusText(task['status']),
                          style: _label.copyWith(
                            color: statusColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (task['isPinned'])
                        Icon(LucideIcons.pin, size: 14, color: _textTertiary),
                      if (task['isPinned']) const SizedBox(width: 12),
                      _buildPriorityBadge(task['priority']),
                      const SizedBox(width: 12),
                      IconButton(
                        icon: Icon(
                          task['isPinned']
                              ? LucideIcons.star
                              : LucideIcons.star,
                          size: 16,
                          color: task['isPinned'] ? _primary : _textQuaternary,
                        ),
                        onPressed: () {
                          setState(() {
                            task['isPinned'] = !task['isPinned'];
                          });
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Task Title and Description
                  Text(
                    task['title'],
                    style: _titleMedium.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task['description'],
                    style: _bodySmall.copyWith(color: _textTertiary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 16),

                  // Tags
                  if (task['tags'] != null && (task['tags'] as List).isNotEmpty)
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: (task['tags'] as List).map<Widget>((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _borderLight,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tag,
                            style: _label.copyWith(
                              color: _textTertiary,
                              fontSize: 9,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                  const SizedBox(height: 16),

                  // Footer
                  Row(
                    children: [
                      // Assignee
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: task['assignee']['color'] as Color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            task['assignee']['avatar'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task['assignee']['name'] as String,
                            style: _caption.copyWith(
                              color: _textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            task['project'] as String,
                            style: _label.copyWith(
                              color: _textTertiary,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Stats
                      Row(
                        children: [
                          if ((task['comments'] as int) > 0)
                            Row(
                              children: [
                                Icon(
                                  LucideIcons.messageCircle,
                                  size: 12,
                                  color: _textTertiary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${task['comments']}',
                                  style: _label.copyWith(color: _textTertiary),
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                          if ((task['attachments'] as int) > 0)
                            Row(
                              children: [
                                Icon(
                                  LucideIcons.paperclip,
                                  size: 12,
                                  color: _textTertiary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${task['attachments']}',
                                  style: _label.copyWith(color: _textTertiary),
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                          Icon(
                            LucideIcons.clock,
                            size: 12,
                            color: _textTertiary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            task['timeEstimate'] as String,
                            style: _label.copyWith(color: _textTertiary),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Subtasks Progress
                  if (task['subtasks'] != null &&
                      (task['subtasks'] as List).isNotEmpty)
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: LinearProgressIndicator(
                                  value: _getSubtaskProgress(
                                    task['subtasks'] as List,
                                  ),
                                  backgroundColor: _borderLight,
                                  color: categoryColor,
                                  minHeight: 4,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${_getCompletedSubtasks(task['subtasks'] as List)}/${(task['subtasks'] as List).length}',
                              style: _label.copyWith(color: _textTertiary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),

                  // Due Date
                  Row(
                    children: [
                      Icon(
                        LucideIcons.calendar,
                        size: 12,
                        color: _textTertiary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        task['dueDate'] as String,
                        style: _caption.copyWith(color: _textSecondary),
                      ),
                      const Spacer(),
                      Text(
                        task['created'] as String,
                        style: _label.copyWith(color: _textQuaternary),
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

  Widget _buildBoardView(List<Map<String, dynamic>> tasks) {
    final List<StatusColumn> statusColumns = [
      StatusColumn(status: 'todo', title: 'To Do', color: _statusTodo),
      StatusColumn(
        status: 'in_progress',
        title: 'In Progress',
        color: _statusInProgress,
      ),
      StatusColumn(status: 'review', title: 'Review', color: _statusReview),
      StatusColumn(status: 'done', title: 'Done', color: _statusDone),
      StatusColumn(status: 'blocked', title: 'Blocked', color: _statusBlocked),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: statusColumns.map((column) {
          final columnTasks = tasks
              .where((t) => t['status'] == column.status)
              .toList();
          return _buildBoardColumn(
            title: column.title,
            color: column.color,
            tasks: columnTasks,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBoardColumn({
    required String title,
    required Color color,
    required List<Map<String, dynamic>> tasks,
  }) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: _titleSmall.copyWith(
                    color: _textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${tasks.length}',
                    style: _label.copyWith(
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(LucideIcons.plus, size: 16, color: _textTertiary),
                  onPressed: () => _createNewTask(status: title.toLowerCase()),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          Column(
            children: tasks.map((task) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildBoardCard(task),
              );
            }).toList(),
          ),
          if (tasks.isEmpty)
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: _bgCard,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _borderLight,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LucideIcons.plus, size: 24, color: _textQuaternary),
                    const SizedBox(height: 8),
                    Text(
                      'Add task',
                      style: _bodySmall.copyWith(color: _textTertiary),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildBoardCard(Map<String, dynamic> task) {
    final priorityColor = _getPriorityColor(task['priority']);

    return GestureDetector(
      onTap: () => _showTaskDetails(task),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _bgCard,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _borderLight, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    task['title'] as String,
                    style: _bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (task['isPinned'] as bool)
                  Icon(LucideIcons.pin, size: 12, color: _textTertiary),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: task['assignee']['color'] as Color,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      task['assignee']['avatar'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                if (task['priority'] == 'high')
                  Icon(
                    LucideIcons.alertTriangle,
                    size: 12,
                    color: priorityColor,
                  ),
                const SizedBox(width: 4),
                Text(
                  task['dueDate'] as String,
                  style: _label.copyWith(color: _textTertiary, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarView() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calendar View',
            style: _titleMedium.copyWith(
              color: _textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: _bgCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _borderLight, width: 1.5),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.calendar, size: 48, color: _textQuaternary),
                  const SizedBox(height: 16),
                  Text(
                    'Calendar View Coming Soon',
                    style: _bodyLarge.copyWith(color: _textTertiary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Interactive calendar with drag & drop',
                    style: _bodySmall.copyWith(color: _textQuaternary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityBadge(String priority) {
    final color = _getPriorityColor(priority);
    final icon = priority == 'high'
        ? LucideIcons.alertTriangle
        : priority == 'medium'
        ? LucideIcons.alertCircle
        : LucideIcons.info;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, size: 14, color: color),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    bool showBadge = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _bgCard,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _borderLight, width: 1.5),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: color),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: _caption.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (showBadge)
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _priorityHigh,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: _white, width: 1),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewToggle({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? _white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: isActive ? _primary : _textTertiary),
            const SizedBox(width: 6),
            Text(
              label,
              style: _caption.copyWith(
                color: isActive ? _primary : _textTertiary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'todo':
        return _statusTodo;
      case 'in_progress':
        return _statusInProgress;
      case 'review':
        return _statusReview;
      case 'done':
        return _statusDone;
      case 'blocked':
        return _statusBlocked;
      default:
        return _textTertiary;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'todo':
        return 'To Do';
      case 'in_progress':
        return 'In Progress';
      case 'review':
        return 'In Review';
      case 'done':
        return 'Completed';
      case 'blocked':
        return 'Blocked';
      default:
        return status;
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'high':
        return _priorityHigh;
      case 'medium':
        return _priorityMedium;
      case 'low':
        return _priorityLow;
      default:
        return _textTertiary;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'design':
        return _categoryDesign;
      case 'development':
        return _categoryDev;
      case 'marketing':
        return _categoryMarketing;
      case 'planning':
        return _categoryPlanning;
      case 'meeting':
        return _categoryMeeting;
      case 'research':
        return _categoryResearch;
      default:
        return _textTertiary;
    }
  }

  double _getSubtaskProgress(List<dynamic> subtasks) {
    if (subtasks.isEmpty) return 0;
    final completed = subtasks.where((s) => s['completed'] == true).length;
    return completed / subtasks.length;
  }

  int _getCompletedSubtasks(List<dynamic> subtasks) {
    return subtasks.where((s) => s['completed'] == true).length;
  }

  String _getFilterKey(String filter) {
    switch (filter) {
      case 'All Tasks':
        return 'all';
      case 'My Tasks':
        return 'my_tasks';
      case 'To Do':
        return 'todo';
      case 'In Progress':
        return 'in_progress';
      case 'Review':
        return 'review';
      case 'Done':
        return 'done';
      case 'Blocked':
        return 'blocked';
      case 'High Priority':
        return 'high_priority';
      case 'Today':
        return 'today';
      case 'This Week':
        return 'this_week';
      default:
        return 'all';
    }
  }

  List<Map<String, dynamic>> _filterTasks() {
    List<Map<String, dynamic>> filtered = List.from(_tasks);

    // Apply status filter
    if (_selectedFilter != 'all') {
      if (_selectedFilter == 'my_tasks') {
        filtered = filtered
            .where((t) => t['assignee']['name'] == 'You')
            .toList();
      } else if (_selectedFilter == 'high_priority') {
        filtered = filtered.where((t) => t['priority'] == 'high').toList();
      } else if (_selectedFilter == 'today') {
        filtered = filtered
            .where((t) => (t['dueDate'] as String).contains('Today'))
            .toList();
      } else {
        filtered = filtered
            .where((t) => t['status'] == _selectedFilter)
            .toList();
      }
    }

    // Hide completed tasks if needed
    if (!_showCompleted) {
      filtered = filtered.where((t) => t['status'] != 'done').toList();
    }

    // Apply tag filters
    if (_selectedTags.isNotEmpty) {
      filtered = filtered.where((t) {
        final tags = List<String>.from(t['tags'] ?? []);
        return tags.any((tag) => _selectedTags.contains(tag));
      }).toList();
    }

    return filtered;
  }

  void _createNewTask({String? status}) {
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
          'Create New Task',
          style: _titleMedium.copyWith(
            color: _textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  labelStyle: _caption.copyWith(color: _textTertiary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: _borderLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: _primary),
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
                    borderSide: BorderSide(color: _primary),
                  ),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Priority',
                        labelStyle: _caption.copyWith(color: _textTertiary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: _borderLight),
                        ),
                      ),
                      items: ['High', 'Medium', 'Low'].map((priority) {
                        return DropdownMenuItem<String>(
                          value: priority.toLowerCase(),
                          child: Text(priority),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Status',
                        labelStyle: _caption.copyWith(color: _textTertiary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: _borderLight),
                        ),
                      ),
                      value: status ?? 'todo',
                      items:
                          [
                            'To Do',
                            'In Progress',
                            'Review',
                            'Done',
                            'Blocked',
                          ].map((status) {
                            return DropdownMenuItem<String>(
                              value: status.toLowerCase().replaceAll(' ', '_'),
                              child: Text(status),
                            );
                          }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ],
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
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Task created successfully!'),
                  backgroundColor: _statusDone,
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Create Task'),
          ),
        ],
      ),
    );
  }

  void _showTaskDetails(Map<String, dynamic> task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: _bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            controller: scrollController,
            children: [
              // Task Header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      task['title'] as String,
                      style: _titleLarge.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(LucideIcons.x),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                task['description'] as String,
                style: _bodyLarge.copyWith(color: _textSecondary),
              ),
              const SizedBox(height: 20),

              // Task Details
              _buildTaskDetailItem(
                icon: LucideIcons.user,
                label: 'Assignee',
                value: task['assignee']['name'] as String,
              ),
              _buildTaskDetailItem(
                icon: LucideIcons.folder,
                label: 'Project',
                value: task['project'] as String,
              ),
              _buildTaskDetailItem(
                icon: LucideIcons.calendar,
                label: 'Due Date',
                value: task['dueDate'] as String,
              ),
              _buildTaskDetailItem(
                icon: LucideIcons.clock,
                label: 'Time Estimate',
                value: task['timeEstimate'] as String,
              ),
              _buildTaskDetailItem(
                icon: LucideIcons.activity,
                label: 'Status',
                value: _getStatusText(task['status']),
                valueColor: _getStatusColor(task['status']),
              ),
              _buildTaskDetailItem(
                icon: LucideIcons.alertTriangle,
                label: 'Priority',
                value:
                    '${(task['priority'] as String)[0].toUpperCase()}${(task['priority'] as String).substring(1)}',
                valueColor: _getPriorityColor(task['priority']),
              ),

              const SizedBox(height: 20),

              // Subtasks
              Text(
                'Subtasks',
                style: _titleSmall.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              ...(task['subtasks'] as List<dynamic>).map<Widget>((subtask) {
                return CheckboxListTile(
                  title: Text(subtask['title'] as String, style: _bodyMedium),
                  value: subtask['completed'] as bool,
                  onChanged: (value) {
                    setState(() {
                      subtask['completed'] = value;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                );
              }).toList(),

              const SizedBox(height: 20),

              // Tags
              Text(
                'Tags',
                style: _titleSmall.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: (task['tags'] as List<dynamic>).map<Widget>((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _borderLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag as String,
                      style: _caption.copyWith(color: _textSecondary),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: _borderLight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Close',
                        style: _bodyMedium.copyWith(color: _textSecondary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Mark as done
                        setState(() {
                          task['status'] = 'done';
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _statusDone,
                        foregroundColor: _white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Mark as Done'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskDetailItem({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 16, color: _textTertiary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: _caption.copyWith(color: _textTertiary)),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: _bodyMedium.copyWith(
                    color: valueColor ?? _textPrimary,
                    fontWeight: valueColor != null
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
