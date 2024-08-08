import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  // Конструктор виджета с параметрами и значениями по умолчанию
  const CustomErrorWidget({
    super.key,
    required this.onUpdate,
    this.errorTitle = 'Что-то пошло не так',
    this.errorMessage = 'Попробуйте еще раз',
  });

  final VoidCallback onUpdate; // Функция для обновления
  final String errorTitle; // Заголовок ошибки
  final String errorMessage; // Сообщение об ошибке

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          errorTitle,
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          errorMessage,
          style: theme.textTheme.labelSmall,
        ),
        const SizedBox(height: 30),
        TextButton(
            onPressed: onUpdate, child: const Text('Попробовать еще раз'))
      ],
    ));
  }
}
