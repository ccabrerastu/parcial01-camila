import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String _displayText = '';
  String _imagePath = '';
  String _imageLocation = '';
  void _nextPage() {
    setState(() {
      if (_currentPage < 2) {
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
        _currentPage = 2;
      }
    });
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _showAbout() {
    setState(() {
      _imagePath = '';
      _displayText =
          'Somos una institución de derecho privado, con personería jurídica inscrita en Registros Públicos de Tacna con la Ficha N°1217 (Partida Electrónica N° 11005803) sin fines de lucro, con autonomía académica, económica, normativa, administrativa y de gobierno, que se rige por la Constitución Política del Perú, la Ley Universitaria N° 30220, su Ley de Creación N°24060, por su Estatuto y Reglamentos y NO DEPENDE DE NINGUNA OTRA PERSONA JURÍDICA O ENTE PROMOTOR.';
      _imageLocation = '';
    });
  }

  void _showLocation() {
    setState(() {
      _imagePath = '';
      _displayText =
          'La Universidad Privada de Tacna está ubicada en la ciudad de Tacna y no cuenta con ninguna sede, filial, coordinadora u oficina descentralizada en ningún otro lugar del país.';
      _imageLocation = 'assets/images/mapa.JPG';
    });
  }

  void _showSchedule() {
    setState(() {
      _displayText = '';
      _imagePath = 'assets/images/calendario.jpg';
      _imageLocation = '';
    });
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
          SizedBox(
            height: 110,
            width: MediaQuery.of(context).size.width * 1,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Image.asset(
                        index == 0
                            ? 'assets/images/fondoranking.jpg'
                            : index == 1
                                ? 'assets/images/licencia.jpg'
                                : 'assets/images/movilidad.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 10,
                  top: 70,
                  child: GestureDetector(
                    onTap: _previousPage,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 70,
                  child: GestureDetector(
                    onTap: _nextPage,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSquareButton('Nosotros', _showAbout),
              _buildSquareButton('Ubicación', _showLocation),
              _buildSquareButton('Cronograma', _showSchedule),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  _displayText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
                if (_imagePath.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/calendario.JPG',
                        fit: BoxFit.cover,
                        width: 400,
                      ),
                    ),
                  ),
                if (_imageLocation.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(
                            'https://maps.app.goo.gl/qtTEBHQULcwcogPj7'));
                      },
                      child: Center(
                        child: Image.asset(
                          'assets/images/download.png', 
                          fit: BoxFit.cover,
                          width: 400,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 120,
      height: 35,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: Text(text),
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
            _buildPreGradoNavItem(context),
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
