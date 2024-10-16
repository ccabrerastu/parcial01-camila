import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UniversidadPage(),
    );
  }
}

class UniversidadPage extends StatefulWidget {
  const UniversidadPage({super.key});

  @override
  _UniversidadPageState createState() => _UniversidadPageState();
}

class _UniversidadPageState extends State<UniversidadPage> {
  bool isHovered = false;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> images = [
    'assets/images/fondoranking.jpeg',
    'assets/images/licencia.jpeg',
    'assets/images/movilidad.jpeg'
  ];
  void _nextPage() {
    setState(() {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _previousPage() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
      } else {
        _currentPage =
            images.length - 1; // Va al final cuando esté en el inicio
      }
    });
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: Column(
          children: [
            _buildHeader(context),
            _buildNavBar(context),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
                Positioned(
                  left: 10,
                  top: MediaQuery.of(context).size.height * 0.4,
                  child: GestureDetector(
                    onTap: _previousPage,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: MediaQuery.of(context).size.height * 0.4,
                  child: GestureDetector(
                    onTap: _nextPage,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 50,
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

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.indigo[900],
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/logoupt.jpg',
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 12),
              const Text(
                'UNIVERSIDAD PRIVADA DE TACNA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUniversidadNavItem(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: PopupMenuButton<String>(
        onSelected: (value) {},
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: 'ingenieria',
              child: Text('Reseña'),
            ),
            const PopupMenuItem(
              value: 'medicina',
              child: Text('Mision - Vision'),
            ),
            const PopupMenuItem(
              value: 'arquitectura',
              child: Text('Autoridades'),
            ),
            const PopupMenuItem(
              value: 'humanidades',
              child: Text('Calendario Academico'),
            ),
            const PopupMenuItem(
              value: 'humanidades',
              child: Text('Derechos Academicos'),
            ),
          ];
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color:
                isHovered ? Colors.white.withOpacity(0.2) : Colors.transparent,
          ),
          child: const Text(
            'UNIVERSIDAD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdmisionNavItem(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: PopupMenuButton<String>(
        onSelected: (value) {},
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: 'ingenieria',
              child: Text('Cronograma'),
            ),
            const PopupMenuItem(
              value: 'medicina',
              child: Text('Prospecto'),
            ),
            const PopupMenuItem(
              value: 'arquitectura',
              child: Text('Resultados'),
            ),
            const PopupMenuItem(
              value: 'humanidades',
              child: Text('Vacantes'),
            ),
            const PopupMenuItem(
              value: 'humanidades',
              child: Text('Aula Virtual'),
            ),
          ];
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color:
                isHovered ? Colors.white.withOpacity(0.2) : Colors.transparent,
          ),
          child: const Text(
            'ADMISION',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOficinasNavItem(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: PopupMenuButton<String>(
        onSelected: (value) {},
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: 'ingenieria',
              child: Text('Secretaria'),
            ),
            const PopupMenuItem(
              value: 'medicina',
              child: Text('Asesoria Juridica'),
            ),
            const PopupMenuItem(
              value: 'arquitectura',
              child: Text('Relaciones Internacionales'),
            ),
            const PopupMenuItem(
              value: 'humanidades',
              child: Text('Contabilidad'),
            ),
            const PopupMenuItem(
              value: 'humanidades',
              child: Text('Administración'),
            ),
          ];
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color:
                isHovered ? Colors.white.withOpacity(0.2) : Colors.transparent,
          ),
          child: const Text(
            'OFICINAS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      color: Colors.blue[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildUniversidadNavItem(context),
            _buildAdmisionNavItem(context),

            _buildPreGradoNavItem(
                context), // Opción "PRE-GRADO" con menú desplegable
            _buildServiciosNavItem(context),
            _buildOficinasNavItem(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  Widget _buildPreGradoNavItem(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: PopupMenuButton<String>(
        onSelected: (value) {},
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: 'ingenieria',
              child: Text('Facultad de Ingeniería'),
            ),
            const PopupMenuItem(
              value: 'medicina',
              child: Text('Facultad de Medicina'),
            ),
            const PopupMenuItem(
              value: 'arquitectura',
              child: Text('Facultad de Arquitectura'),
            ),
            const PopupMenuItem(
              value: 'humanidades',
              child: Text('Facultad de Humanidades'),
            ),
          ];
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color:
                isHovered ? Colors.white.withOpacity(0.2) : Colors.transparent,
          ),
          child: const Text(
            'PRE-GRADO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServiciosNavItem(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: PopupMenuButton<String>(
        onSelected: (value) {},
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: 'ingenieria',
              child: Text('Intranet'),
            ),
            const PopupMenuItem(
              value: 'medicina',
              child: Text('Idiomas'),
            ),
            const PopupMenuItem(
              value: 'arquitectura',
              child: Text('Policlinico'),
            ),
            const PopupMenuItem(
              value: 'humanidades',
              child: Text('Biblioteca'),
            ),
          ];
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color:
                isHovered ? Colors.white.withOpacity(0.2) : Colors.transparent,
          ),
          child: const Text(
            'SERVICIOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
