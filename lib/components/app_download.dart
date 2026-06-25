import 'package:portfolio/register.dart';

@Import.onWeb('package:portfolio/utils/browser_utils.dart', show: [
  #downloadFile,
  #copyToClipboard
])
import 'app_download.imports.dart';

class AppDownload extends StatelessComponent {
  final String value;
  final String? text;
  final String filename;
  
  const AppDownload({
    super.key, 
    required this.value, 
    this.text,
    this.filename = 'download.json',
  });

  @override
  Component build(BuildContext context) {
    // Retaining 'copy' class to inherit your existing animation styles
    return button(classes: 'copy', [
      span(
        classes: 'tooltip', 
        attributes: {
          'data-text-end': 'Downloaded!', 
          'data-text-initial': text ?? 'Download file'
        }, 
        []
      ),
      span([
        // Download Icon SVG
        svg(
          classes: 'clipboard', // Retaining class for your CSS sizing/animations
          viewBox: '0 0 24 24', 
          attributes: {
            'height': '20', 
            'width': '20', 
            'fill': 'none',
            'stroke': 'currentColor',
            'stroke-width': '2',
            'stroke-linecap': 'round',
            'stroke-linejoin': 'round'
          }, 
          [
            Component.element(tag: 'path', attributes: {'d': 'M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4'}, children: []),
            Component.element(tag: 'polyline', attributes: {'points': '7 10 12 15 17 10'}, children: []),
            Component.element(tag: 'line', attributes: {'x1': '12', 'y1': '15', 'x2': '12', 'y2': '3'}, children: []),
          ]
        ),
        // Success Checkmark SVG
        svg(
          classes: 'checkmark', 
          viewBox: '0 0 24 24', 
          attributes: {
            'style': 'enable-background:new 0 0 512 512', 
            'y': '0', 
            'x': '0', 
            'height': '18', 
            'width': '18', 
            'version': '1.1', 
            'xml:space': 'preserve'
          }, 
          [
            Component.element(tag: 'g', children: [
              path(
                d: 'M9.707 19.121a.997.997 0 0 1-1.414 0l-5.646-5.647a1.5 1.5 0 0 1 0-2.121l.707-.707a1.5 1.5 0 0 1 2.121 0L9 14.171l9.525-9.525a1.5 1.5 0 0 1 2.121 0l.707.707a1.5 1.5 0 0 1 0 2.121z', 
                attributes: {'fill': 'currentColor'}, 
                []
              )
            ]),
          ]
        ),
      ]),
    ], onClick: () => downloadFile(content: value, filename: filename));
  }
}