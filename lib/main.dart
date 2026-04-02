import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const NetflixCcApp());
}

class NetflixCcApp extends StatelessWidget {
  const NetflixCcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetFlixCC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: const Color(0xFF070B1C),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF060A18),
              Color(0xFF0A1030),
              Color(0xFF050714),
            ],
          ),
        ),
        child: Stack(
          children: [
            const _AuroraBackground(),
            const _PosterDecorations(),
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(18, 14, 18, 20),
                    child: Column(
                      children: [
                        const _WelcomeCard(),
                        const SizedBox(height: 20),
                        _GlassCard(
                          padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              const SizedBox(height: 18),
                              const _InputField(
                                hintText: 'Email',
                                icon: Icons.mail_outline_rounded,
                              ),
                              const SizedBox(height: 14),
                              _InputField(
                                hintText: 'Password',
                                icon: Icons.lock_outline_rounded,
                                obscureText: obscurePassword,
                                suffix: IconButton(
                                  splashRadius: 22,
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                  icon: Icon(
                                    obscurePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white70,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                      vertical: 4,
                                    ),
                                  ),
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const _PrimaryButton(label: 'Login'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        const _OrContinueSection(),
                        const SizedBox(height: 18),
                        const _SocialRow(),
                        const SizedBox(height: 22),
                        _GlassCard(
                          padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Row(
                                children: [
                                  _MiniCircleIcon(
                                    icon: Icons.person_add_alt_1_rounded,
                                  ),
                                  SizedBox(width: 14),
                                  Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 14),
                              Text(
                                'New here? Create an account to start watching.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  height: 1.45,
                                ),
                              ),
                              SizedBox(height: 20),
                              _PrimaryButton(label: 'Sign Up'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.white54,
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                'Your watchlist. Your stories. All in one place.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                  height: 1.3,
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
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
      child: Column(
        children: [
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFA86BFF),
                  Color(0xFF6F62FF),
                  Color(0xFF43D2FF),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x5548D7FF),
                  blurRadius: 24,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 42,
            ),
          ),
          const SizedBox(height: 18),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.25,
              ),
              children: [
                TextSpan(text: 'Welcome To '),
                TextSpan(
                  text: 'NetFlixCC',
                  style: TextStyle(
                    color: Color(0xFF6DE4FF),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Watch the best movies & shows',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrContinueSection extends StatelessWidget {
  const _OrContinueSection();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white24,
            thickness: 1,
            endIndent: 12,
          ),
        ),
        Text(
          'Or continue with',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white24,
            thickness: 1,
            indent: 12,
          ),
        ),
      ],
    );
  }
}

class _SocialRow extends StatelessWidget {
  const _SocialRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _SocialCircle(
          label: '',
          fontSize: 34,
        ),
        _SocialCircle(
          label: 'G',
          fontSize: 31,
        ),
        _SocialCircle(
          label: 'f',
          fontSize: 38,
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;

  const _PrimaryButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF38C6FF),
            Color(0xFF6D5EFF),
            Color(0xFF9B4DFF),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x553FA9F5),
            blurRadius: 26,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(29),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 24,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white70,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Widget? suffix;

  const _InputField({
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.06),
        border: Border.all(
          color: Colors.white.withOpacity(0.14),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.03),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          prefixIcon: Icon(
            icon,
            color: Colors.white70,
            size: 25,
          ),
          suffixIcon: suffix,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white60,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const _GlassCard({
    required this.child,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.white.withOpacity(0.18),
              width: 1.2,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.16),
                Colors.white.withOpacity(0.08),
                Colors.white.withOpacity(0.04),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x332D7BFF),
                blurRadius: 28,
                spreadRadius: 2,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _SocialCircle extends StatelessWidget {
  final String label;
  final double fontSize;

  const _SocialCircle({
    required this.label,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.07),
        border: Border.all(
          color: Colors.white.withOpacity(0.14),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2235AFFF),
            blurRadius: 20,
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _MiniCircleIcon extends StatelessWidget {
  final IconData icon;

  const _MiniCircleIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.08),
        border: Border.all(
          color: Colors.white.withOpacity(0.16),
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white70,
        size: 24,
      ),
    );
  }
}

class _AuroraBackground extends StatelessWidget {
  const _AuroraBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          _glow(
            top: 40,
            left: -70,
            width: 260,
            height: 260,
            color: const Color(0xAA7E49FF),
          ),
          _glow(
            top: 120,
            right: -80,
            width: 290,
            height: 290,
            color: const Color(0xAA17D8FF),
          ),
          _glow(
            bottom: 150,
            left: -80,
            width: 270,
            height: 270,
            color: const Color(0xAA0E9BFF),
          ),
          _glow(
            bottom: 10,
            right: -70,
            width: 280,
            height: 280,
            color: const Color(0xAAE14BFF),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: _StarsPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glow({
    double? top,
    double? left,
    double? right,
    double? bottom,
    required double width,
    required double height,
    required Color color,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: IgnorePointer(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            gradient: RadialGradient(
              colors: [
                color,
                color.withOpacity(0.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PosterDecorations extends StatelessWidget {
  const _PosterDecorations();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: const [
          _PosterCard(
            top: 48,
            left: -18,
            angle: -0.12,
            title: 'DUNE',
            subtitle: 'PART TWO',
          ),
          _PosterCard(
            top: 174,
            left: -24,
            angle: -0.18,
            title: 'THE BATMAN',
          ),
          _PosterCard(
            top: 385,
            left: -26,
            angle: -0.14,
            title: 'STRANGER\nTHINGS',
          ),
          _PosterCard(
            bottom: 190,
            left: -20,
            angle: -0.10,
            title: 'WEDNESDAY',
          ),
          _PosterCard(
            top: 280,
            right: -18,
            angle: 0.16,
            title: 'EMINEM',
          ),
          _PosterCard(
            top: 414,
            right: -24,
            angle: 0.14,
            title: 'THE\nLAST\nOF US',
          ),
          _PosterCard(
            bottom: 102,
            right: -18,
            angle: 0.18,
            title: 'OPPENHEIMER',
          ),
          _CornerBubble(
            left: 26,
            bottom: 34,
            icon: Icons.fastfood_outlined,
          ),
          _CornerBubble(
            right: 26,
            bottom: 38,
            icon: Icons.ondemand_video_outlined,
          ),
        ],
      ),
    );
  }
}

class _PosterCard extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double angle;
  final String title;
  final String? subtitle;

  const _PosterCard({
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.angle,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Transform.rotate(
        angle: angle,
        child: Opacity(
          opacity: 0.36,
          child: Container(
            width: 105,
            height: 165,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1B234A),
                  Color(0xFF090C18),
                ],
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.08),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                        letterSpacing: 2,
                        height: 1.2,
                      ),
                    ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      height: 1.05,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CornerBubble extends StatelessWidget {
  final double? left;
  final double? right;
  final double bottom;
  final IconData icon;

  const _CornerBubble({
    this.left,
    this.right,
    required this.bottom,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      bottom: bottom,
      child: Opacity(
        opacity: 0.85,
        child: Container(
          width: 62,
          height: 62,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.06),
            border: Border.all(
              color: Colors.white.withOpacity(0.15),
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x221C9BFF),
                blurRadius: 18,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white70,
            size: 28,
          ),
        ),
      ),
    );
  }
}

class _StarsPainter extends CustomPainter {
  const _StarsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.38);

    final points = <Offset>[
      Offset(size.width * 0.18, size.height * 0.20),
      Offset(size.width * 0.28, size.height * 0.24),
      Offset(size.width * 0.63, size.height * 0.14),
      Offset(size.width * 0.78, size.height * 0.22),
      Offset(size.width * 0.16, size.height * 0.66),
      Offset(size.width * 0.34, size.height * 0.70),
      Offset(size.width * 0.80, size.height * 0.76),
      Offset(size.width * 0.70, size.height * 0.58),
      Offset(size.width * 0.53, size.height * 0.30),
      Offset(size.width * 0.48, size.height * 0.52),
    ];

    for (final point in points) {
      canvas.drawCircle(point, 1.4, paint);
      canvas.drawCircle(
        point,
        4,
        Paint()..color = Colors.white.withOpacity(0.05),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
