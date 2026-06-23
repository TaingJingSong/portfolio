import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:web/web.dart' as html;
import '../language/translation_extension.dart';

class ContactForm extends StatelessComponent {
  const ContactForm({super.key});

  void _handleSubmit(BuildContext context) {
    final nameInput = html.document.getElementById('form-name') as html.HTMLInputElement?;
    final emailInput = html.document.getElementById('form-email') as html.HTMLInputElement?;
    final titleInput = html.document.getElementById('form-title') as html.HTMLInputElement?;
    final messageInput = html.document.getElementById('form-message') as html.HTMLTextAreaElement?;

    if (nameInput == null || emailInput == null || titleInput == null || messageInput == null) return;

    final name = nameInput.value.trim();
    final email = emailInput.value.trim();
    final title = titleInput.value.trim();
    final message = messageInput.value.trim();

    if (name.isEmpty || email.isEmpty || title.isEmpty || message.isEmpty) {
      _showToast(context, 'Please fill in all fields!');
      return;
    }

    final mailtoLink = Uri(
      scheme: 'mailto',
      path: 'chingsong15@gmail.com',
      query: Uri.encodeFull(
        'subject=$title&body=From: $name <$email>\n\n$message',
      ),
    ).toString();

    html.window.open(mailtoLink, '_self');
  }

  void _showToast(BuildContext context, String message) {
    final toast = html.document.getElementById('toast') as html.HTMLElement?;
    if (toast != null) {
      toast.innerText = message;
      toast.style.display = 'block';
      Future.delayed(const Duration(seconds: 2), () {
        toast.style.display = 'none';
      });
    }
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'contact-form', [
      div(classes: 'form-row', [
        div(classes: 'form-group', [
          input(
            type: InputType.text,
            id: 'form-name',
            classes: 'form-input',
            attributes: {
              'placeholder': 'Name'.tr(context),
              'required': '',
            },
          ),
        ]),
        div(classes: 'form-group', [
          input(
            type: InputType.email,
            id: 'form-email',
            classes: 'form-input',
            attributes: {
              'placeholder': 'Email'.tr(context),
              'required': '',
            },
          ),
        ]),
      ]),
      input(
        type: InputType.text,
        id: 'form-title',
        classes: 'form-input',
        attributes: {
          'placeholder': 'Title'.tr(context),
          'required': '',
        },
      ),
      textarea(
        id: 'form-message',
        classes: 'form-input',
        placeholder: 'Message'.tr(context),
        required: true,
        [],
      ),
      button(
        classes: 'btn-primary',
        onClick: () => _handleSubmit(context),
        [Component.text('Send'.tr(context))],
      ),
      // Toast notification placeholder
      div(id: 'toast', []),
    ]);
  }
}
