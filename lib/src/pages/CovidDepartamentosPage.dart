import 'package:emi_covid/src/models/respuesta.dart';
import 'package:emi_covid/src/providers/rest_provider.dart';
import 'package:emi_covid/src/widgets/covidDepartament-widgets/boton.dart';
import 'package:emi_covid/src/widgets/covidDepartament-widgets/headerDepartament.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
class ItemBoton {

  final String dep;
  final String conf;
  final String dece;
  final String sosp;
  final String recu;
  final Color color1;
  final Color color2;

  ItemBoton( 
    this.dep,
    this.conf,
    this.dece,
    this.sosp,
    this.recu,
    this.color1, 
    this.color2 );
}

class CovidDepartament extends StatelessWidget {
  final p = RestProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
          margin: EdgeInsets.only(top: 220.0),
          child: FutureBuilder(
            future: p.getData(),
            builder: (BuildContext context, AsyncSnapshot<Respuesta> snapshot){
                          if(snapshot.hasData){
                              Respuesta resp= snapshot.data;
                              return ListView(
                                physics: BouncingScrollPhysics(),
                                children: <Widget>[
                                  Boton(
                                    departamento: 'La Paz',
                                    confirmados: '${resp.departamentos.lp.contador.confirmados}', 
                                    decesos:     '${resp.departamentos.lp.contador.decesos}', 
                                    recuperados: '${resp.departamentos.lp.contador.recuperados}',
                                    sospechosos: '${resp.departamentos.lp.contador.sospechosos}', 
                                    c1: Color(0xff6989F5), 
                                    c2: Color(0xff906EF5)
                                  ),
                                  Boton(
                                    departamento: 'Cochabamba',
                                    confirmados: '${resp.departamentos.cb.contador.confirmados}', 
                                    decesos:     '${resp.departamentos.cb.contador.decesos}', 
                                    recuperados: '${resp.departamentos.cb.contador.recuperados}',
                                    sospechosos: '${resp.departamentos.cb.contador.sospechosos}',
                                    c1: Color(0xff66A9F2), 
                                    c2: Color(0xff536CF6)
                                  ),
                                  Boton(
                                    departamento: 'Santa Cruz',
                                    confirmados: '${resp.departamentos.sc.contador.confirmados}', 
                                    decesos:     '${resp.departamentos.sc.contador.decesos}', 
                                    recuperados: '${resp.departamentos.sc.contador.recuperados}',
                                    sospechosos: '${resp.departamentos.sc.contador.sospechosos}',
                                    c1:Color(0xffF2D572),
                                    c2:Color(0xffE06AA3)
                                    
                                    
                                  ),
                                  Boton(
                                    departamento: 'Oruro',
                                    confirmados: '${resp.departamentos.or.contador.confirmados}', 
                                    decesos:     '${resp.departamentos.or.contador.decesos}', 
                                    recuperados: '${resp.departamentos.or.contador.recuperados}',
                                    sospechosos: '${resp.departamentos.or.contador.sospechosos}', 
                                    c1: Color(0xff317183), 
                                    c2: Color(0xff46997D)
                                  ),
                                  Boton(
                                    departamento: 'Potosi',
                                    confirmados: '${resp.departamentos.pt.contador.confirmados}', 
                                    decesos:     '${resp.departamentos.pt.contador.decesos}', 
                                    recuperados: '${resp.departamentos.pt.contador.recuperados}',
                                    sospechosos: '${resp.departamentos.pt.contador.sospechosos}', 
                                    c1: Color(0xff6989F5),
                                    c2: Color(0xff906EF5)
                                  ),
                                  Boton(
                                    departamento: 'Tarija',
                                    confirmados: '${resp.departamentos.tj.contador.confirmados}', 
                                    decesos:     '${resp.departamentos.tj.contador.decesos}', 
                                    recuperados: '${resp.departamentos.tj.contador.recuperados}',
                                    sospechosos: '${resp.departamentos.tj.contador.sospechosos}', 
                                    c1: Color(0xffF2D572), 
                                    c2: Color(0xffE06AA3)
                                  ),
                                  Boton(
                                    departamento: 'Beni',
                                    confirmados: '${resp.departamentos.bn.contador.confirmados}', 
                                    decesos:     '${resp.departamentos.bn.contador.decesos}', 
                                    recuperados: '${resp.departamentos.bn.contador.recuperados}',
                                    sospechosos: '${resp.departamentos.bn.contador.sospechosos}', 
                                    c1: Color(0xff66A9F2), 
                                    c2:  Color(0xff536CF6)
                                  ),
                                  Boton(
                                    departamento: 'Pando',
                                    confirmados: '${resp.departamentos.pn.contador.confirmados}', 
                                    decesos:     '${resp.departamentos.pn.contador.decesos}', 
                                    recuperados: '${resp.departamentos.pn.contador.recuperados}',
                                    sospechosos: '${resp.departamentos.pn.contador.sospechosos}', 
                                    c1: Color(0xff317183), 
                                    c2: Color(0xff46997D)
                                  ),
                                  Boton(
                                    departamento: 'Chuquisaca',
                                    confirmados: '${resp.departamentos.ch.contador.confirmados}', 
                                    decesos:     '${resp.departamentos.ch.contador.decesos}', 
                                    recuperados: '${resp.departamentos.ch.contador.recuperados}',
                                    sospechosos: '${resp.departamentos.ch.contador.sospechosos}', 
                                    c1: Color(0xff6989F5), 
                                    c2: Color(0xff906EF5)
                                  )
                                ],
                              );
                          }else{
                              return CircularProgressIndicator();
                          }
                        }
              ),
            ),
        _Header(),
        ],
      )
    );
  }
}

class _Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        HeaderDepart(),
        Positioned(
          right: 0,
          top: 35,
          child: RawMaterialButton(
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}

