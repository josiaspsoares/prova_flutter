import 'package:flutter/material.dart';
import 'package:prova_flutter/app/controllers/information/information_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/pages/components/privacy_policy_button.dart';
import '../core/theme/custom_gradient.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final InformationController controller = InformationController();
  final TextEditingController informationController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.getList();
    super.initState();
  }

  Future<void> validate(String value) async {
    if (formKey.currentState!.validate()) {
      if (controller.isUpdating) {
        await controller.updateItem(
          index: controller.currentIndex,
          value: value,
        );

        controller.isUpdating = false;
        formKey.currentState!.reset();
      } else {
        await controller.addItem(
          value: value,
        );

        formKey.currentState!.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: customGradient,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 20, left: 10, right: 10),
                      child: Observer(
                        builder: (_) {
                          return controller.informationList.isNotEmpty
                              ? buildInformationList()
                              : const SizedBox(
                                  width: double.infinity,
                                  height: 300,
                                );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: informationController,
                      decoration: const InputDecoration(
                        hintText: 'Digite seu texto',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }

                        return null;
                      },
                      onFieldSubmitted: (value) async {
                        await validate(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 80),
                  const PrivacyPolicyButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView buildInformationList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.informationList.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            ListTile(
              title: Text(
                controller.informationList[index],
                textAlign: TextAlign.center,
              ),
              titleAlignment: ListTileTitleAlignment.center,
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      controller.isUpdating = true;
                      controller.currentIndex = index;
                      informationController.text = controller.informationList[index];
                    },
                    icon: const Icon(
                      Icons.border_color,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () async => await showConfirmationDialog(context, index),
                    icon: const Icon(Icons.cancel, size: 40, color: Color(0xFFC93735)),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }

  Future<dynamic> showConfirmationDialog(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Atenção',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Deseja realmente excluir o item "${controller.informationList[index]}"?',
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () async {
                if (controller.isUpdating) {
                  controller.isUpdating = false;
                  formKey.currentState!.reset();
                }

                await controller.removeItem(index: index);

                if (!context.mounted) return;
                Navigator.pop(context);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
