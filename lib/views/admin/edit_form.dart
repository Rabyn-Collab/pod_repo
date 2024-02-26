import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shopy/api.dart';
import 'package:shopy/models/product.dart';
import 'package:shopy/providers/auth/auth_provider.dart';
import 'package:shopy/providers/other_provider.dart';
import 'package:shopy/providers/product/product_provider.dart';



class EditForm extends ConsumerStatefulWidget {
  final Product product;
  EditForm(this.product);

  @override
  ConsumerState<EditForm> createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<EditForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  List<String> brands = ['Sunsilk', 'Nike', 'Levis', 'Huawei', 'Diamond'];
  List<String> categories = ['Clothing', 'Foods', 'Electronics', 'Beauty'];

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
          title: Text('Edit Form'),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FormBuilder(
              key: _formKey,
              child: ListView(
                children: [

                  FormBuilderTextField(
                    name: 'product_name',
                    initialValue: widget.product.product_name,
                    decoration: const InputDecoration(labelText: 'Product Name'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderTextField(
                    initialValue: widget.product.product_detail,
                    name: 'product_detail',
                    decoration: const InputDecoration(labelText: 'Product Detail'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderTextField(
                    name: 'product_price',
                    initialValue: widget.product.product_price.toString(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Product Price'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderDropdown<String>(
                    name: 'brand',
                    initialValue: widget.product.brand,
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
                    initialValue: widget.product.category,
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
                    initialValue: widget.product.countInStock.toString(),
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
                      child: image == null ? Image.network('${Api.baseUrl}${widget.product.product_image}', fit: BoxFit.cover)
                          : Image.file(File(image.path))
                      ,
                    ),
                  ),

                  SizedBox(height: 20,),


                  ElevatedButton(
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState?.saveAndValidate(focusOnInvalid: false) ?? false) {

                          Map map = Map.of(_formKey.currentState!.value);
                          if(image == null){
                            ref.read(productApiProvider.notifier).updateProduct(
                                product_name: map['product_name'],
                                product_detail: map['product_detail'],
                                product_price: int.parse(map['product_price']),
                                brand: map['brand'],
                                category: map['category'],
                                token: auth.value!.token,
                                product_id: widget.product.id,
                                countInStock: int.parse(map['countInStock']),
                            );
                          }else{
                            ref.read(productApiProvider.notifier).updateProduct(
                              product_name: map['product_name'],
                              product_detail: map['product_detail'],
                              product_price: int.parse(map['product_price']),
                              brand: map['brand'],
                              category: map['category'],
                              token: auth.value!.token,
                              product_id: widget.product.id,
                              countInStock: int.parse(map['countInStock']),
                              prevImage: widget.product.product_image,
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