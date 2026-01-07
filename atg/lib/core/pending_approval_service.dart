import 'package:flutter/foundation.dart';

/// Model for a pending approval request
class PendingApprovalRequest {
  final String id;
  final String username;
  final String unId;
  final String email;
  final String password;
  final String inviteLink;
  final DateTime requestedAt;
  final String userType; // 'un_staff' or 'external_user'
  final String? identityProofPath; // Path to identity proof image (for external users)
  String status; // 'pending', 'approved', 'rejected'

  PendingApprovalRequest({
    required this.id,
    required this.username,
    required this.unId,
    required this.email,
    required this.password,
    required this.inviteLink,
    required this.requestedAt,
    required this.userType,
    this.identityProofPath,
    this.status = 'pending',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'unId': unId,
      'email': email,
      'inviteLink': inviteLink,
      'requestedAt': requestedAt.toIso8601String(),
      'userType': userType,
      'identityProofPath': identityProofPath,
      'status': status,
    };
  }

  factory PendingApprovalRequest.fromJson(Map<String, dynamic> json) {
    return PendingApprovalRequest(
      id: json['id'],
      username: json['username'],
      unId: json['unId'],
      email: json['email'],
      password: '', // Password not stored in JSON for security
      inviteLink: json['inviteLink'],
      requestedAt: DateTime.parse(json['requestedAt']),
      userType: json['userType'],
      identityProofPath: json['identityProofPath'],
      status: json['status'] ?? 'pending',
    );
  }
}

/// Singleton service to manage pending approval requests
/// In a real app, this would be backed by a backend API
class PendingApprovalService extends ChangeNotifier {
  static final PendingApprovalService _instance = PendingApprovalService._internal();
  
  factory PendingApprovalService() => _instance;
  
  PendingApprovalService._internal();

  final List<PendingApprovalRequest> _pendingRequests = [];

  /// Get all pending requests
  List<PendingApprovalRequest> get pendingRequests => 
      _pendingRequests.where((r) => r.status == 'pending').toList();

  /// Get all requests (including approved/rejected)
  List<PendingApprovalRequest> get allRequests => List.unmodifiable(_pendingRequests);

  /// Get count of pending requests
  int get pendingCount => pendingRequests.length;

  /// Add a new pending request
  void addRequest(PendingApprovalRequest request) {
    _pendingRequests.add(request);
    notifyListeners();
  }

  /// Approve a request
  void approveRequest(String requestId) {
    final index = _pendingRequests.indexWhere((r) => r.id == requestId);
    if (index != -1) {
      _pendingRequests[index].status = 'approved';
      notifyListeners();
    }
  }

  /// Reject a request
  void rejectRequest(String requestId) {
    final index = _pendingRequests.indexWhere((r) => r.id == requestId);
    if (index != -1) {
      _pendingRequests[index].status = 'rejected';
      notifyListeners();
    }
  }

  /// Get request by ID
  PendingApprovalRequest? getRequestById(String requestId) {
    try {
      return _pendingRequests.firstWhere((r) => r.id == requestId);
    } catch (e) {
      return null;
    }
  }

  /// Check if a user is approved
  bool isUserApproved(String email) {
    return _pendingRequests.any(
      (r) => r.email == email && r.status == 'approved',
    );
  }

  /// Clear all requests (for testing purposes)
  void clearAllRequests() {
    _pendingRequests.clear();
    notifyListeners();
  }
}
