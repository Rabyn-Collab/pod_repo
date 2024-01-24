import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:podsriver/providers/auth_provider.dart';



class LoginPage extends ConsumerStatefulWidget {

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      if(next.hasError && !next.isLoading){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 5),
                content: Text(next.error.toString())
            )
        );
      }
    });
    final state = ref.watch(authProvider);


    return Scaffold(
        appBar: AppBar(
          title: Text('Login Form'),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FormBuilder(
              key: _formKey,
              child: ListView(
                children: [


                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderTextField(
                    name: 'password',
                    // obscureText: isShow ? false: true,
                    decoration:  InputDecoration(
                        // suffixIcon: IconButton(
                        //     onPressed: (){
                        //       ref.read(toggleProvider.notifier).change();
                        //     }, icon: Icon(isShow ?Icons.remove_red_eye: Icons.lock_open_sharp)),
                        labelText: 'Password'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.maxLength(25),
                    ]),
                  ),
                  SizedBox(height: 10,),

                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState?.saveAndValidate(focusOnInvalid: false) ?? false) {
                          final map = _formKey.currentState!.value;



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