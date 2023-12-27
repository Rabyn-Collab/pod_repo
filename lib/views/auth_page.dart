import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:podsriver/constants/app_sizes.dart';
import 'package:podsriver/provider/auth_provider.dart';


class AuthPage extends ConsumerStatefulWidget {

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
 print(state);
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
                  AppSizes.gapH10,
                  FormBuilderTextField(
                    name: 'password',
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.maxLength(25),
                    ]),
                  ),
                  AppSizes.gapH20,
                  AppSizes.gapH20,
                  ElevatedButton(
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState?.saveAndValidate(focusOnInvalid: false) ?? false) {
                             final map = _formKey.currentState!.value;
                             ref.read(authProvider.notifier).userLogin(
                                 email: map['email'], password: map['password']
                             );
                        }
                      }, child: state.isLoading ? Center(child: CircularProgressIndicator()): Text('submit')
                  )
                ],
              )
          ),
        )
    );
  }
}
