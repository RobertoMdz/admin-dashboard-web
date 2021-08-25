import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/usuario.dart';
import '../../providers/customers_provider.dart';
import '../../providers/user_form_provider.dart';
import '../../services/notifications_service.dart';
import '../cards/white_card.dart';
import '../inputs/custom_inputs.dart';
import '../labels/custom_labels.dart';

class CustomerView extends StatefulWidget {
  final String uid;
  const CustomerView({Key? key, required this.uid}) : super(key: key);

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider =
        Provider.of<CustomersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getCustomerById(widget.uid).then((userFound) {
      if (userFound != null) {
        userFormProvider.formKey = new GlobalKey<FormState>();
        userFormProvider.user = userFound;
        setState(() {
          user = userFound;
        });
      } else {
        NavigationService.replaceTo('/dashboard/customers');
      }
    });
  }

  @override
  void dispose() {
    Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'User view',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        if (user == null)
          WhiteCard(
            child: Container(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        if (user != null) _UserViewBody()
      ],
    ));
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {0: FixedColumnWidth(250)},
        children: [
          TableRow(children: [
            _AvatarContainer(),
            _UserViewForm(),
          ])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
        title: 'Información general',
        child: Form(
          key: userFormProvider.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                initialValue: user.nombre,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre del usuario',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_outlined),
                onChanged: (value) =>
                    userFormProvider.copyUserWith(nombre: value),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese un nombre.';
                  if (value.length < 2)
                    return 'El nombre debe de ser de dos letras como mínimo.';
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: user.correo,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Correo del usuario',
                    label: 'Correo',
                    icon: Icons.mark_email_read_outlined),
                onChanged: (value) =>
                    userFormProvider.copyUserWith(correo: value),
                validator: (value) {
                  if (!EmailValidator.validate(value ?? ''))
                    return 'Email no válido';

                  return null;
                },
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 100),
                child: ElevatedButton(
                    onPressed: () async {
                      final saved = await userFormProvider.updateUser();
                      if (saved) {
                        NotificationService.showSnackbar('Usuario actualizado');
                        Provider.of<CustomersProvider>(context, listen: false)
                            .refreshUser(user);
                      } else {
                        NotificationService.showSnackbarError(
                            'No se pudo guardar');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.save_outlined, size: 20),
                        Text('  Guardar')
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    final image = (user.img == null)
        ? Image(image: AssetImage('no-image.jpg'))
        : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);

    return WhiteCard(
        width: 250,
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Profile', style: CustomLabels.h2),
              SizedBox(height: 20),
              Container(
                  width: 150,
                  height: 160,
                  child: Stack(
                    children: [
                      ClipOval(child: image),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(color: Colors.white, width: 5)),
                          child: FloatingActionButton(
                            backgroundColor: Colors.indigo,
                            elevation: 0,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                            ),
                            onPressed: () async {
                              /*FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                      allowedExtensions: ['jpg', 'jpeg', 'png'],
                                      allowMultiple: false);

                              if (result != null) {
                                // PlatformFile file = result.files.first;
                                NotificationsService.showBusyIndicator(context);

                                final newUser =
                                    await userFormProvider.uploadImage(
                                        '/uploads/usuarios/${user.uid}',
                                        result.files.first.bytes!);

                                Provider.of<CustomersProvider>(context,
                                        listen: false)
                                    .refreshUser(newUser);

                                Navigator.of(context).pop();
                              } else {
                                // User canceled the picker
                                print('no hay imagen');
                              }*/
                            },
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 20),
              Text(
                user.nombre,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
