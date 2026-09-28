import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _ink = Color(0xFF0F172A);
const _muted = Color(0xFF64748B);
const _line = Color(0xFFE2E8F0);
const _surface = Color(0xFFF8FAFC);

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Alex Rivers | Profile',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0284C7)),
    ),
    home: const ProfilePage(),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 390),
        child: Container(
          key: const Key('profile-frame'),
          decoration: BoxDecoration(
            color: _surface,
            border: Border.all(color: const Color(0xFFCBD5E1), width: 3),
            borderRadius: BorderRadius.circular(44),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(41),
            child: SafeArea(
              minimum: const EdgeInsets.fromLTRB(24, 44, 24, 36),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _topBar(context),
                    const SizedBox(height: 24),
                    _profileHeader(),
                    const SizedBox(height: 24),
                    _statsCard(),
                    const SizedBox(height: 24),
                    _aboutSection(),
                    const SizedBox(height: 24),
                    _skillsSection(),
                    const SizedBox(height: 24),
                    _projectsSection(),
                    const SizedBox(height: 32),
                    _contactCard(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Widget _topBar(BuildContext context) => SizedBox(
    height: 42,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ToolbarButton(
          icon: Icons.chevron_left,
          label: 'Back',
          onPressed: () => Navigator.maybePop(context),
        ),
        const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: _ink,
          ),
        ),
        _ToolbarButton(
          icon: Icons.share_outlined,
          label: 'Share profile',
          onPressed: () => _copy(context, 'Alex Rivers | Lead Mobile Engineer'),
        ),
      ],
    ),
  );

  Widget _profileHeader() => Column(
    children: [
      SizedBox(
        width: 140,
        height: 140,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF8080),
                    Color(0xFFFFB088),
                    Color(0xFFFFD166),
                  ],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile_avatar.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const ColoredBox(
                          color: Color(0xFFE2E8F0),
                          child: Icon(Icons.person, size: 72, color: _muted),
                        ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 6,
              bottom: 7,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFF0284C7),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.check, size: 17, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        'Alex Rivers',
        style: TextStyle(
          fontSize: 24,
          height: 1.2,
          fontWeight: FontWeight.w800,
          color: _ink,
        ),
      ),
      const SizedBox(height: 5),
      const Text(
        'Lead Mobile Engineer',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: _muted,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          border: Border.all(color: _line),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on_outlined, size: 15, color: _muted),
            SizedBox(width: 5),
            Text(
              'Tokyo, Japan',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF475569),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _statsCard() => Container(
    height: 78,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Color(0x0A0F172A),
          blurRadius: 18,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: const Row(
      children: [
        Expanded(
          child: _Stat(value: '148', label: 'Projects'),
        ),
        _VerticalDivider(),
        Expanded(
          child: _Stat(value: '9 Yrs', label: 'Experience'),
        ),
        _VerticalDivider(),
        Expanded(
          child: _Stat(
            value: '4.9 ★',
            label: 'Rating',
            color: Color(0xFFE6A700),
          ),
        ),
      ],
    ),
  );

  Widget _aboutSection() => _section(
    'About Me',
    const Text(
      'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant',
      style: TextStyle(fontSize: 14, height: 1.5, color: _muted),
    ),
  );

  Widget _skillsSection() => _section(
    'Skills & Expertise',
    const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _SkillChip(
          'Flutter',
          Icons.design_services_outlined,
          Color(0xFFE0F2FE),
          Color(0xFF0284C7),
        ),
        _SkillChip('Dart', Icons.code, Color(0xFFDCFCE7), Color(0xFF15803D)),
        _SkillChip(
          'Clean Arch',
          Icons.layers_outlined,
          Color(0xFFFFE4E6),
          Color(0xFFE11D48),
        ),
        _SkillChip(
          'UI/UX',
          Icons.ads_click,
          Color(0xFFF3E8FF),
          Color(0xFF9333EA),
        ),
        _SkillChip(
          'Firebase',
          Icons.local_fire_department_outlined,
          Color(0xFFFEF3C7),
          Color(0xFFB45309),
        ),
      ],
    ),
  );

  Widget _projectsSection() => _section(
    'Featured Projects',
    const Row(
      children: [
        Expanded(
          child: _ProjectCard(
            title: 'E-Shop Flutter',
            subtitle: 'Mobile App • 2026',
            cover: _ShopCover(),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _ProjectCard(
            title: 'Crypto Vault',
            subtitle: 'Finance • Clean Arch',
            cover: _CryptoCover(),
          ),
        ),
      ],
    ),
  );

  Widget _contactCard(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: _line),
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Color(0x080F172A),
          blurRadius: 12,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        const _ContactRow(
          'Contact Information',
          Icons.alternate_email,
          heading: true,
        ),
        const Divider(height: 1, color: Color(0xFFF1F5F9)),
        _ContactRow(
          'alex.rivers@email.com',
          Icons.mail_outline,
          onTap: () => _copy(context, 'alex.rivers@email.com'),
        ),
        const Divider(height: 1, color: Color(0xFFF1F5F9)),
        _ContactRow(
          '+81 (90) 1234-5678',
          Icons.call_outlined,
          onTap: () => _copy(context, '+81 (90) 1234-5678'),
        ),
      ],
    ),
  );

  Widget _section(String title, Widget child) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: _ink,
        ),
      ),
      const SizedBox(height: 8),
      child,
    ],
  );
}

class _ToolbarButton extends StatelessWidget {
  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: label,
    child: SizedBox.square(
      dimension: 42,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: _line),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(12),
            child: Icon(icon, size: 20, color: _ink),
          ),
        ),
      ),
    ),
  );
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label, this.color = _ink});
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: 18,
          height: 1.15,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
      const SizedBox(height: 3),
      Text(
        label,
        style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
      ),
    ],
  );
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) =>
      Container(width: 1, height: 28, color: _line);
}

class _SkillChip extends StatelessWidget {
  const _SkillChip(this.label, this.icon, this.background, this.foreground);
  final String label;
  final IconData icon;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: foreground),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: foreground,
          ),
        ),
      ],
    ),
  );
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.cover,
  });
  final String title;
  final String subtitle;
  final Widget cover;

  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: _line),
      borderRadius: BorderRadius.circular(14),
      boxShadow: const [
        BoxShadow(
          color: Color(0x080F172A),
          blurRadius: 8,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 78, width: double.infinity, child: cover),
        Padding(
          padding: const EdgeInsets.fromLTRB(9, 8, 6, 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: _ink,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10, color: _muted),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _ShopCover extends StatelessWidget {
  const _ShopCover();

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: const [
      CustomPaint(painter: _ShopBackdropPainter()),
      Center(
        child: Icon(
          Icons.shopping_cart_outlined,
          size: 64,
          color: Color(0xFF475569),
        ),
      ),
    ],
  );
}

class _ShopBackdropPainter extends CustomPainter {
  const _ShopBackdropPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = const Color(0xFFE5E7EB),
    );
    final paint = Paint()
      ..color = const Color(0xFFCBD5E1)
      ..strokeWidth = 1;
    for (var index = 1; index <= 4; index++) {
      final y = size.height * (0.55 + index * 0.1);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width * 0.22, size.height),
      Paint()..color = const Color(0x11747569),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CryptoCover extends StatelessWidget {
  const _CryptoCover();

  @override
  Widget build(BuildContext context) =>
      const CustomPaint(painter: _CryptoCoverPainter());
}

class _CryptoCoverPainter extends CustomPainter {
  const _CryptoCoverPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final bounds = Offset.zero & size;
    canvas.drawRect(
      bounds,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFC66E), Color(0xFFD946EF), Color(0xFF7018D4)],
        ).createShader(bounds),
    );
    _drawWave(canvas, size, 0.58, const [Color(0xFF22D3EE), Color(0xFF0891B2)]);
    _drawWave(canvas, size, 0.74, const [Color(0xFF8B5CF6), Color(0xFF6D28D9)]);
  }

  void _drawWave(Canvas canvas, Size size, double start, List<Color> colors) {
    final path = Path()
      ..moveTo(0, size.height * start)
      ..cubicTo(
        size.width * 0.28,
        size.height * (start - 0.28),
        size.width * 0.55,
        size.height * (start + 0.38),
        size.width,
        size.height * (start - 0.04),
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      path,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ).createShader(Offset.zero & size),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ContactRow extends StatelessWidget {
  const _ContactRow(this.label, this.icon, {this.heading = false, this.onTap});
  final String label;
  final IconData icon;
  final bool heading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 18, color: heading ? _ink : _muted),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: heading ? FontWeight.w700 : FontWeight.w500,
                  color: heading ? _ink : const Color(0xFF334155),
                ),
              ),
            ),
            const Icon(Icons.chevron_right, size: 20, color: Color(0xFFCBD5E1)),
          ],
        ),
      ),
    ),
  );
}

void _copy(BuildContext context, String value) {
  Clipboard.setData(ClipboardData(text: value));
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text('Copied: $value'),
        duration: const Duration(seconds: 2),
      ),
    );
}
