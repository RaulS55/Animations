import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NotificationModel(),
      // builder: (_, child) {
      //  return child!;
      //},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: const Text("Notificaciones"),
        ),
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: const BotonNavegacion(),
      ),
    );
  }
}

class BotonNavegacion extends StatelessWidget {
  const BotonNavegacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numNotificaciones =
        Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.fishFins), label: "Fish"),
        BottomNavigationBarItem(
            icon: Stack(
              children: [
                const FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  right: 0,
                  child: BounceInDown(
                    from: 10,
                    animate: (numNotificaciones > 0) ? true : false,
                    child: Bounce(
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              .animationController = controller,
                      from: 10,
                      child: Container(
                        alignment: Alignment.center,
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                        child: Text(
                          numNotificaciones.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            label: "Notifications"),
        const BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.cat), label: "My cat"),
      ],
      selectedItemColor: Colors.pinkAccent,
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pinkAccent,
      onPressed: () {
        final controller =
            Provider.of<_NotificationModel>(context, listen: false);
        int num = controller.numero;
        num++;
        controller.numero = num;
        controller.animationController!.forward(from: 0.0);
      },
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  AnimationController? _animationController;

  int get numero => _numero;
  AnimationController? get animationController => _animationController;
  set numero(int numero) {
    _numero = numero;
    notifyListeners();
  }

  set animationController(AnimationController? controller) {
    _animationController = controller;
    //notifyListeners();
  }
}
