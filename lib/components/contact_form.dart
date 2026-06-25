import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../language/translation_extension.dart';

class ContactForm extends StatefulComponent {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String name = '';
  String email = '';
  String title = '';
  String message = '';

  bool showToast = false;
  String toastMessage = '';

  // 1. Dynamically compute the mailto link based on current input state
  String get computedMailto {
    return Uri(
      scheme: 'mailto',
      path: 'chingsong15@gmail.com',
      query: Uri.encodeFull(
        'subject=${title.trim()}&body=From: ${name.trim()} <${email.trim()}>\n\n${message.trim()}',
      ),
    ).toString();
  }

  // 2. Check if all required fields are filled
  bool get isFormValid {
    return name.trim().isNotEmpty && 
           email.trim().isNotEmpty && 
           title.trim().isNotEmpty && 
           message.trim().isNotEmpty;
  }

  void _showToast(String msg) {
    setState(() {
      toastMessage = msg;
      showToast = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          showToast = false;
        });
      }
    });
  }

  @override
  Component build(BuildContext context) {
    return form(
      classes: 'contact-form',
      events: {
        // Prevent the form from trying to refresh the page if the user presses "Enter"
        'submit': (e) => e.preventDefault(),
      },
      [
        div(classes: 'form-row', [
          div(classes: 'form-group', [
            input(
              type: InputType.text,
              classes: 'form-input',
              attributes: {
                'placeholder': 'Name'.tr(context),
                'required': '',
              },
              events: {
                // Use setState so the component rebuilds and updates the link
                'input': (e) => setState(() => name = (e.target as dynamic).value),
              },
            ),
          ]),
          div(classes: 'form-group', [
            input(
              type: InputType.email,
              classes: 'form-input',
              attributes: {
                'placeholder': 'Email'.tr(context),
                'required': '',
              },
              events: {
                'input': (e) => setState(() => email = (e.target as dynamic).value),
              },
            ),
          ]),
        ]),
        input(
          type: InputType.text,
          classes: 'form-input',
          attributes: {
            'placeholder': 'Title'.tr(context),
            'required': '',
          },
          events: {
            'input': (e) => setState(() => title = (e.target as dynamic).value),
          },
        ),
        textarea(
          classes: 'form-input',
          placeholder: 'Message'.tr(context),
          required: true,
          events: {
            'input': (e) => setState(() => message = (e.target as dynamic).value),
          },
          [],
        ),
        
        // 3. The SSR-Safe Magic: Use an anchor tag disguised as a button
        a(
          // If valid, use the mailto link. If invalid, point to nowhere (#).
          href: isFormValid ? computedMailto : '#',
          classes: 'btn-primary',
          styles: Styles(
            display: Display.inlineBlock,
            textDecoration: TextDecoration.none, // Ensures the link doesn't have an underline
          ),
          events: {
            'click': (e) {
              if (!isFormValid) {
                // Block the link from navigating if the form isn't fully filled out
                e.preventDefault(); 
                _showToast('Please fill in all fields!');
              }
              // If it IS valid, we do nothing and let the browser naturally open the user's email client!
            }
          },
          [Component.text('Send'.tr(context))],
        ),
        
        if (showToast) 
          div(classes: 'toast', [Component.text(toastMessage)]),
      ],
    );
  }
}