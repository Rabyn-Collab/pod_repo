import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shopy/providers/auth/auth_provider.dart';


class ShippingPage extends ConsumerStatefulWidget {
  const ShippingPage({super.key});

  @override
  ConsumerState createState() => _ShippingPageState();
}

class _ShippingPageState extends ConsumerState<ShippingPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(loginAuthProvider, (previous, next) {

      next.whenOrNull(
        data: (d){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('successfully updated')
              )
          );
          Navigator.of(context).pop();
        },
        error: (err, st) =>  ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 1),
                content: Text(err.toString())
            )
        )
      );

    });
    final state = ref.watch(loginAuthProvider);


    return Scaffold(
        appBar: AppBar(
          title: Text('Address Form'),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FormBuilder(
              key: _formKey,
              child: ListView(
                children: [


                  FormBuilderTextField(
                    name: 'address',
                    decoration: const InputDecoration(labelText: 'Address'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),

                    ]),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderTextField(
                    name: 'city',
                    decoration:  InputDecoration(
                        labelText: 'City'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(height: 20,),


                  ElevatedButton(
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState?.saveAndValidate(focusOnInvalid: false) ?? false) {
                          Map map = Map.of(_formKey.currentState!.value);
                          map['isEmpty'] = false;
                          ref.read(loginAuthProvider.notifier).userUpdate(data: map, token: state.value!.token,);
                        }
                      }, child: state.isLoading ? Center(child: CircularProgressIndicator()): Text('submit')
                  ),
                  SizedBox(height: 10,),

                ],
              )
          ),
        )
    );
  }
}