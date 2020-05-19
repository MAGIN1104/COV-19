import 'package:emi_covid/src/models/result_test.dart';
import 'package:flutter/material.dart';

class QuestionsPageCat3 extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPageCat3> {
  TextEditingController _controller = TextEditingController();
  ResultTest _resultTest = ResultTest();

  String title = "TEST DE COVID-19 EMI";
  String _titulo1 =
      '¿Estuviste en contacto con alguien que haya sido diagnosticado con COVID-19 en las últimas 2 semanas?';
  String _titulo2 = '¿Tienes algún otro síntoma?';
  String _opDropDown = 'No';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Covid-19 Test'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2), () => 1),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return _body();
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        },
      ),
    );
  }

  Widget _body() {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: ListView(
        children: <Widget>[
          _image(),
          _titleQuestion(_titulo1),
          _picker(),
          _titleQuestion(_titulo2),
          _tfSintomas(),
          _nextButton(),
        ],
      ),
    );
  }

  Widget _tfSintomas() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        controller: _controller,
        maxLines: 3,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText:
              'Si no presentas otro síntoma por favor sáltate esta pregunta.',
        ),
      ),
    );
  }

  Widget _picker() {
    return Center(
      child: DropdownButton<String>(
        icon: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Icon(Icons.keyboard_arrow_down),
        ),
        value: _opDropDown,
        items: <DropdownMenuItem<String>>[
          DropdownMenuItem(value: 'Si', child: Text('Si')),
          DropdownMenuItem(value: 'No', child: Text('No')),
          DropdownMenuItem(value: 'No lo se', child: Text('No lo se')),
        ],
        onChanged: (value) {
          setState(() {
            _opDropDown = value;
          });
        },
      ),
    );
  }

  Widget _image() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
      child: Image.asset(
        'img/people.png',
        fit: BoxFit.contain,
        height: 150,
      ),
    );
  }

  Widget _titleQuestion(String title) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _nextButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: RaisedButton(
        color: Color(0xff0095c2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textColor: Colors.white,
        child: Text('Calcular resultados'),
        onPressed: () {
          _resultTest.sintomas = _controller.text.trim();
          _showDialogResult();
        },
      ),
    );
  }

  Widget _cardResult() {
    String res;
    String msgAlerta = 'POSIBLE CASO SOSPECHOSO CON SÍNTOMAS DE GRAVEDAD',
        msgPrevencion = 'HAY POSIBILIDAD DE QUE SEAS CASO SOSPECHOSO',
        msgDefault = 'NO ERES CASO SOSPECHOSO';

    if (_resultTest.valor > 30) {
      res = msgAlerta;
    } else if (_resultTest.valor == 30) {
      switch (_opDropDown) {
        case 'Si':
          res = msgAlerta;
          break;
        case 'No lo se':
          res = msgPrevencion;
          break;
        default:
          res = msgDefault;
          break;
      }
    } else {
      if (_opDropDown == 'Si')
        res = msgPrevencion;
      else
        res = msgDefault;
    }

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 16),
            child: Image.asset('img/doctor.png'),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              res,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _showDialogResult() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: _cardResult(),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
