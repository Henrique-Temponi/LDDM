import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.ac_unit_sharp,
                  size: 100.0,
                ),
              ),
              Expanded(
                  child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus aliquet magna nec ultrices. Suspendisse sed magna at sapien pretium egestas. Aenean vel bibendum nunc, ut maximus purus. Suspendisse ligula massa, lobortis in orci ac, pulvinar suscipit enim. Nullam non lectus quis mi suscipit semper. Aenean hendrerit massa et diam tristique, non volutpat nisi malesuada. Sed efficitur faucibus auctor. Nulla et nulla eu sapien tempus lobortis vitae eu turpis. Nulla at elit eu magna interdum mattis ac et purus. Vestibulum consectetur ultrices justo, sed accumsan nunc posuere varius. Etiam congue, odio ut consectetur eleifend, purus orci gravida lectus, quis scelerisque risus felis a massa. Fusce dui urna, tincidunt eget ex sit amet, blandit auctor enim. Proin porta, neque eu gravida ultricies, tortor lectus porta leo, in laoreet mi nulla a augue. Nunc posuere sapien urna, et volutpat nibh rutrum bibendum. Suspendisse placerat, diam a condimentum pulvinar, erat ligula scelerisque quam, at ullamcorper nisi mi id eros. Nulla tristique nulla vitae ligula efficitur posuere. ",
                overflow: TextOverflow.clip,
              ))
            ],
          ),
        ),
        const Row(children: [
          Expanded(
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus aliquet magna nec ultrices. Suspendisse sed magna at sapien pretium egestas. Aenean vel bibendum nunc, ut maximus purus. Suspendisse ligula massa, lobortis in orci ac, pulvinar suscipit enim. Nullam non lectus quis mi suscipit semper. Aenean hendrerit massa et diam tristique, non volutpat nisi malesuada. Sed efficitur faucibus auctor.")),
          Icon(
            Icons.abc,
            size: 100.0,
          )
        ])
      ],
    );
  }
}
