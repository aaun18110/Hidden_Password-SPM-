// ignore_for_file: avoid_print, must_be_immutable, unused_field, prefer_final_fields

import 'package:flutter/material.dart';

class MyHiddenPassword extends StatelessWidget {
  MyHiddenPassword({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("value Listenable Builder"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _toggle,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: _toggle.value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outlined),
                        suffixIcon: InkWell(
                          onTap: () {
                            _toggle.value = !_toggle.value;
                          },
                          child: Icon(_toggle.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 194, 189, 189),
                                width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 194, 189, 189),
                                width: 1),
                            borderRadius: BorderRadius.circular(8))),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: ValueListenableBuilder(
                    valueListenable: _counter,
                    builder: (context, value, child) {
                      return Text(
                        _counter.value.toString(),
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.normal),
                      );
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print("tap");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
