import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shopy/providers/auth/auth_provider.dart';
import 'package:shopy/providers/other_provider.dart';
import 'package:shopy/providers/product/product_provider.dart';



class AddForm extends ConsumerStatefulWidget {

  @override
  ConsumerState<AddForm> createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<AddForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  List<String> brands = ['Sunsilk', 'Nike', 'Levis', 'Huawei', 'Diamond'];
  List<String> categories = ['Clothing', 'Foods', 'Electronics'];

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
        ref.invalidate(getProductProvider);
        Navigator.of(context).pop();
      }
    });
    final state = ref.watch(productApiProvider);
    final image = ref.watch(pickImageProvider);
    final auth = ref.watch(loginAuthProvider);


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
                    name: 'product_name',
                    decoration: const InputDecoration(labelText: 'Product Name'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderTextField(
                    name: 'product_detail',
                    decoration: const InputDecoration(labelText: 'Product Detail'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderTextField(
                    name: 'product_price',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Product Price'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderDropdown<String>(
                    name: 'brand',
                    decoration: InputDecoration(
                      labelText: 'Brand',
                      suffix: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _formKey.currentState!.fields['brand']
                              ?.reset();
                        },
                      ),
                      hintText: 'Select Brand',
                    ),
                    items: brands
                        .map((brand) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: brand,
                      child: Text(brand),
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderDropdown<String>(
                    name: 'category',
                    decoration: InputDecoration(
                      labelText: 'Category',
                      suffix: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _formKey.currentState!.fields['category']
                              ?.reset();
                        },
                      ),
                      hintText: 'Select Category',
                    ),
                    items: categories
                        .map((category) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: category,
                      child: Text(category),
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 10,),

                  FormBuilderTextField(
                    name: 'countInStock',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'countInStock'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      ref.read(pickImageProvider.notifier).pickImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      height: 140,
                      width: double.infinity,
                      child: image == null ? Center(child: Text('please select an image'))
                          : Image.file(File(image.path))
                      ,
                    ),
                  ),

                  SizedBox(height: 20,),


                  ElevatedButton(
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState?.saveAndValidate(focusOnInvalid: false) ?? false) {

                         if(image !=null){
                           Map map = Map.of(_formKey.currentState!.value);

                           ref.read(productApiProvider.notifier).addProduct(
                               product_name: map['product_name'],
                               product_detail: map['product_detail'],
                               product_price: int.parse(map['product_price']),
                               brand: map['brand'],
                               category: map['category'],
                               token: auth.value!.token,
                               countInStock: int.parse(map['countInStock']),
                               product_image: image
                           );
                         }

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