import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:podsriver/providers/auth/auth_provider.dart';
import 'package:podsriver/providers/product/product_provider.dart';



class AddForm extends ConsumerStatefulWidget {

  @override
  ConsumerState<AddForm> createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<AddForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(productApiProvider, (previous, next) {

      if(next.hasError && !next.isLoading){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 1),
                content: Text(next.error.toString())
            )
        );
      }else if(!next.isLoading && !next.hasError){

      }
    });
    final state = ref.watch(productApiProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text('Add Form'),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FormBuilder(
              key: _formKey,
              child: ListView(
                children: [

                  FormBuilderTextField(
                    name: 'fullname',
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(height: 10,),
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
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      Text('Already have an Account'),
                      TextButton(onPressed: (){
                        Get.back();
                      }, child: Text('Login'))
                    ],
                  ),
                  SizedBox(height: 20,),

                  ElevatedButton(
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState?.saveAndValidate(focusOnInvalid: false) ?? false) {
                          ref.read(signUpAuthProvider.notifier).userSignUp(data:_formKey.currentState!.value);
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