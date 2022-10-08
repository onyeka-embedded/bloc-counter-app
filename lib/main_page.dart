import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        SizedBox(
          height: h / 15,
        ),
        const Center(
          child: Text('Bloc Counter Application',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: h / 20,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          height: h / 6,
          width: w * 0.8,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent, width: 2),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: w * 0.32,
                width: w * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/ball.jpeg"),
                        fit: BoxFit.cover)),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SizedBox(height: 35),
                  Text(
                    "Cartoon Ball",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "\$86.0",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Container(
                width: w * 0.15,
                height: h / 4.5,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.add,
                              color: Colors.redAccent,
                            )),
                      ),
                      BlocConsumer<CounterCubit, CounterState>(
                        listener: (context, state) {
                          if (state.incremented == true) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              content: Container(
                                  margin:
                                      EdgeInsets.fromLTRB(w * 0.28, 0, 0, 0),
                                  child: const Text("Incremented!",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              duration: const Duration(milliseconds: 300),
                              backgroundColor: Colors.redAccent,
                            ));
                          } else if (state.incremented == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Container(
                                margin: EdgeInsets.fromLTRB(w * 0.28, 0, 0, 0),
                                child: const Text("Decremented!",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                              duration: const Duration(milliseconds: 300),
                              backgroundColor: Colors.redAccent,
                            ));
                          } else {}
                        },
                        builder: (context, state) {
                          return Text(state.initialVal.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold));
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<CounterCubit>(context).decrement();
                        },
                        child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.remove,
                              color: Colors.redAccent,
                            )),
                      )
                    ]),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: w * 0.5,
          height: 50,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              "Add to cart",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ])),
    );
  }
}
