import 'package:atg/features/home/pages/home_page.dart';
import 'package:atg/core/user_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Premium Color System
  static const Color _primary = Color(0xFF0065B3);
  static const Color _primaryDark = Color(0xFF005596);
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
  static const Color _success = Color(0xFF38B2AC);
  static const Color _error = Color(0xFFF56565);
  static const Color _warning = Color(0xFFED8936);
  static const Color _info = Color(0xFF4299E1);

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

  // Form State
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  // UI State
  bool _isLogin = true;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _rememberMe = false;
  bool _isLoading = false;
  bool _showValidation = false;

  // Social Login Options
  final List<Map<String, dynamic>> _socialOptions = [
    {
      'name': 'Google',
      'icon': LucideIcons.activity,
      'color': Color(0xFFDB4437),
    },
    {
      'name': 'Microsoft',
      'icon': LucideIcons.microwave,
      'color': Color(0xFF00A4EF),
    },
    {'name': 'Apple', 'icon': LucideIcons.apple, 'color': _textPrimary},
    {'name': 'GitHub', 'icon': LucideIcons.github, 'color': _textPrimary},
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button (Optional - for embedded login)
                if (Navigator.canPop(context))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _bgCard,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: _borderLight, width: 1.5),
                        ),
                        child: const Center(
                          child: Icon(LucideIcons.arrowLeft, size: 20),
                        ),
                      ),
                    ),
                  ),

                // Header
                _buildHeader(),
                const SizedBox(height: 32),

                // Login/Register Card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: _bgCard,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _borderLight, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Toggle between Login and Register
                        _buildAuthToggle(),
                        const SizedBox(height: 24),

                        // Name Field (only for register)
                        if (!_isLogin) ...[
                          _buildTextField(
                            controller: _nameController,
                            label: 'Full Name',
                            hintText: 'Enter your full name',
                            prefixIcon: LucideIcons.user,
                            validator: (value) {
                              if (!_isLogin &&
                                  (value == null || value.isEmpty)) {
                                return 'Please enter your name';
                              }
                              if (!_isLogin &&
                                  value != null &&
                                  value.length < 2) {
                                return 'Name must be at least 2 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                        ],

                        // Email Field
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email Address',
                          hintText: 'Enter your email address',
                          prefixIcon: LucideIcons.mail,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!_isValidEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Password Field
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: LucideIcons.lock,
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? LucideIcons.eye
                                  : LucideIcons.eyeOff,
                              size: 20,
                              color: _textTertiary,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (!_isLogin && value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            if (!_isLogin && !_hasUpperCase(value)) {
                              return 'Password must contain an uppercase letter';
                            }
                            if (!_isLogin && !_hasNumber(value)) {
                              return 'Password must contain a number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Confirm Password Field (only for register)
                        if (!_isLogin) ...[
                          _buildTextField(
                            controller: _confirmPasswordController,
                            label: 'Confirm Password',
                            hintText: 'Confirm your password',
                            prefixIcon: LucideIcons.lock,
                            obscureText: _obscureConfirmPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? LucideIcons.eye
                                    : LucideIcons.eyeOff,
                                size: 20,
                                color: _textTertiary,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                            ),
                            validator: (value) {
                              if (!_isLogin &&
                                  (value == null || value.isEmpty)) {
                                return 'Please confirm your password';
                              }
                              if (!_isLogin &&
                                  value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                        ],

                        // Remember Me & Forgot Password
                        if (_isLogin) ...[
                          Row(
                            children: [
                              // Remember Me Checkbox
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _rememberMe = !_rememberMe;
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: _rememberMe
                                        ? _primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: _rememberMe
                                          ? _primary
                                          : _borderLight,
                                      width: 2,
                                    ),
                                  ),
                                  child: _rememberMe
                                      ? const Icon(
                                          LucideIcons.check,
                                          size: 14,
                                          color: _white,
                                        )
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Remember me',
                                style: _bodySmall.copyWith(
                                  color: _textSecondary,
                                ),
                              ),
                              const Spacer(),
                              // Forgot Password
                              GestureDetector(
                                onTap: _showForgotPasswordDialog,
                                child: Text(
                                  'Forgot Password?',
                                  style: _bodySmall.copyWith(
                                    color: _primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ],

                        // Password Strength Indicator (for register)
                        if (!_isLogin && _showValidation) ...[
                          _buildPasswordStrength(),
                          const SizedBox(height: 24),
                        ],

                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _primary,
                              foregroundColor: _white,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 24,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                              shadowColor: Colors.transparent,
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: _white,
                                    ),
                                  )
                                : Text(
                                    _isLogin ? 'Sign In' : 'Create Account',
                                    style: _bodyMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Or continue with
                        Row(
                          children: [
                            Expanded(
                              child: Container(height: 1, color: _borderLight),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                'Or continue with',
                                style: _caption.copyWith(color: _textTertiary),
                              ),
                            ),
                            Expanded(
                              child: Container(height: 1, color: _borderLight),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Social Login Buttons
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          alignment: WrapAlignment.center,
                          children: _socialOptions
                              .map(
                                (option) => _buildSocialButton(
                                  icon: option['icon'] as IconData,
                                  color: option['color'] as Color,
                                  name: option['name'] as String,
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 24),

                        // Terms and Conditions (for register)
                        if (!_isLogin)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text.rich(
                              TextSpan(
                                text:
                                    'By creating an account, you agree to our ',
                                style: _bodySmall.copyWith(
                                  color: _textTertiary,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: _bodySmall.copyWith(
                                      color: _primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: _bodySmall.copyWith(
                                      color: _primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Switch between Login and Register
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: _isLogin
                          ? 'Don\'t have an account? '
                          : 'Already have an account? ',
                      style: _bodyMedium.copyWith(color: _textSecondary),
                      children: [
                        TextSpan(
                          text: _isLogin ? 'Sign Up' : 'Sign In',
                          style: _bodyMedium.copyWith(
                            color: _primary,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                _isLogin = !_isLogin;
                                _showValidation = false;
                              });
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Additional Info
                if (_isLogin)
                  Column(
                    children: [
                      Text(
                        'Need help?',
                        style: _bodyMedium.copyWith(color: _textTertiary),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: _showHelpDialog,
                        child: Text(
                          'Contact Support',
                          style: _bodyMedium.copyWith(
                            color: _primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo/App Name
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [_primary, _primaryLight],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: _primary.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(LucideIcons.briefcase, size: 20, color: _white),
              ),
            ),
            const SizedBox(width: 12),
            Text('WorkSpace', style: _display.copyWith(fontSize: 24)),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          _isLogin
              ? 'Welcome back! Please sign in to continue.'
              : 'Create your account to get started.',
          style: _bodyLarge.copyWith(color: _textTertiary),
        ),
      ],
    );
  }

  Widget _buildAuthToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: _borderLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!_isLogin) {
                  setState(() {
                    _isLogin = true;
                    _showValidation = false;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _isLogin ? _white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: _isLogin
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: _bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: _isLogin ? _textPrimary : _textTertiary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_isLogin) {
                  setState(() {
                    _isLogin = false;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !_isLogin ? _white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: !_isLogin
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: _bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: !_isLogin ? _textPrimary : _textTertiary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: _caption.copyWith(
            color: _textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: _bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: _bodySmall.copyWith(color: _textQuaternary),
            prefixIcon: Icon(prefixIcon, size: 20, color: _textTertiary),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: _borderLight, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: _borderLight, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: _primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: _error, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: _error, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            filled: true,
            fillColor: _bgLight,
          ),
          onChanged: (value) {
            if (!_isLogin && controller == _passwordController) {
              setState(() {
                _showValidation = value.isNotEmpty;
              });
            }
          },
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPasswordStrength() {
    final password = _passwordController.text;
    int strength = 0;
    String message = '';
    Color color = _textQuaternary;

    if (password.length >= 8) strength++;
    if (_hasUpperCase(password)) strength++;
    if (_hasLowerCase(password)) strength++;
    if (_hasNumber(password)) strength++;
    if (_hasSpecialChar(password)) strength++;

    switch (strength) {
      case 0:
      case 1:
        message = 'Very Weak';
        color = _error;
        break;
      case 2:
        message = 'Weak';
        color = _warning;
        break;
      case 3:
        message = 'Good';
        color = _info;
        break;
      case 4:
        message = 'Strong';
        color = _success;
        break;
      case 5:
        message = 'Very Strong';
        color = _success;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Password Strength: ',
              style: _caption.copyWith(color: _textTertiary),
            ),
            Text(
              message,
              style: _caption.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 4,
          decoration: BoxDecoration(
            color: _borderLight,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            children: List.generate(5, (index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: index < strength ? color : _borderLight,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 4,
          children: [
            _buildPasswordRequirement('8+ characters', password.length >= 8),
            _buildPasswordRequirement('Uppercase', _hasUpperCase(password)),
            _buildPasswordRequirement('Lowercase', _hasLowerCase(password)),
            _buildPasswordRequirement('Number', _hasNumber(password)),
            _buildPasswordRequirement(
              'Special character',
              _hasSpecialChar(password),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordRequirement(String text, bool met) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          met ? LucideIcons.check : LucideIcons.x,
          size: 12,
          color: met ? _success : _textQuaternary,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: _caption.copyWith(
            color: met ? _textTertiary : _textQuaternary,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required String name,
  }) {
    return GestureDetector(
      onTap: () => _handleSocialLogin(name),
      child: Container(
        width: 56,
        height: 56,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 2),
            Text(
              name,
              style: _label.copyWith(color: _textTertiary, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Check for admin credentials
    final email = _emailController.text.trim().toLowerCase();
    final password = _passwordController.text;
    
    if (email == 'admin@concordia.com' && password == 'Admin@123') {
      await UserService().setIsAdmin(true);
    } else {
      await UserService().setIsAdmin(false);
    }

    setState(() => _isLoading = false);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const EliteDashboardView()),
      (route) => false,
    ); // This removes all previous routes
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: _bgCard,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: _borderLight, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: _success.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    LucideIcons.checkCircle,
                    size: 40,
                    color: _success,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _isLogin ? 'Welcome Back!' : 'Account Created!',
                style: _titleLarge.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                _isLogin
                    ? 'You have successfully signed in to your account.'
                    : 'Your account has been created successfully.',
                textAlign: TextAlign.center,
                style: _bodyMedium.copyWith(color: _textSecondary),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // In real app, navigate to home page
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: _white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Continue to Dashboard',
                    style: _bodyMedium.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: _bgCard,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: _borderLight, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(LucideIcons.key, size: 28, color: _primary),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Reset Password',
                style: _titleLarge.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your email address and we\'ll send you a link to reset your password.',
                textAlign: TextAlign.center,
                style: _bodyMedium.copyWith(color: _textSecondary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: _caption.copyWith(color: _textSecondary),
                  hintText: 'Enter your email',
                  hintStyle: _bodySmall.copyWith(color: _textQuaternary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: _borderLight, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: _borderLight, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: _primary, width: 1.5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _textSecondary,
                        side: BorderSide(color: _borderLight),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showResetEmailSentDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primary,
                        foregroundColor: _white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Send Link'),
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

  void _showResetEmailSentDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: _bgCard,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: _borderLight, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _success.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(LucideIcons.mail, size: 28, color: _success),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Email Sent',
                style: _titleLarge.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                'We\'ve sent a password reset link to your email address. Please check your inbox.',
                textAlign: TextAlign.center,
                style: _bodyMedium.copyWith(color: _textSecondary),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: _white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Got it'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: _bgCard,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: _borderLight, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _info.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(LucideIcons.helpCircle, size: 28, color: _info),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Need Help?',
                style: _titleLarge.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                'Our support team is here to help you with any issues you may have.',
                textAlign: TextAlign.center,
                style: _bodyMedium.copyWith(color: _textSecondary),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  _buildHelpOption(
                    icon: LucideIcons.mail,
                    title: 'Email Support',
                    subtitle: 'support@workspace.com',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildHelpOption(
                    icon: LucideIcons.messageCircle,
                    title: 'Live Chat',
                    subtitle: 'Available 24/7',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildHelpOption(
                    icon: LucideIcons.phone,
                    title: 'Phone Support',
                    subtitle: '+1 (555) 123-4567',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _textSecondary,
                    side: BorderSide(color: _borderLight),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _bgLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _borderLight, width: 1),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: _primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: _bodyMedium.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    subtitle,
                    style: _bodySmall.copyWith(color: _textTertiary),
                  ),
                ],
              ),
            ),
            Icon(LucideIcons.arrowRight, size: 16, color: _textQuaternary),
          ],
        ),
      ),
    );
  }

  void _handleSocialLogin(String platform) {
    // In real app, implement social login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Signing in with $platform...'),
        backgroundColor: _info,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // Validation helpers
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  bool _hasUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool _hasLowerCase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  bool _hasNumber(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  bool _hasSpecialChar(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}
