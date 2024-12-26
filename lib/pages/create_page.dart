import 'package:aora_new/components/widgets/gradient_button.dart';
import 'package:aora_new/components/widgets/text_field.dart';
import 'package:aora_new/utils/theme.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController promptController = TextEditingController();
  CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 92.0, left: 24, right: 24),
      child: Column(
        children: [
          Text('Upload video',
              style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 32.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 22,
            children: [
              CustomTextField(
                label: 'Title',
                hint: 'Your video title',
                controller: titleController,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload video',
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 149,
                    decoration: BoxDecoration(
                      color: AppColors.field,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/upload.png',
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thumbnail Image',
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 58,
                    decoration: BoxDecoration(
                      color: AppColors.field,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/upload_no_border.png',
                            width: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Choose a file',
                            style: const TextStyle(
                              color: AppColors.accent,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                label: 'AI Prompt',
                hint: 'The AI prompt of your video....',
                controller: promptController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    text: 'Submit & Publish',
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
