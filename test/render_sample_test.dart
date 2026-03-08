import 'package:flutter/widgets.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helper.dart';
import 'load_fonts.dart';

void main() {
  setUpAll(loadKaTeXFonts);

  testTexToMatchGoldenFile(
    'Solution of quadratic equation',
    r'x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}',
    location: '../doc/img/delta.png',
    scale: 5,
  );
  testTexToMatchGoldenFile(
    'Schrodinger equation',
    r'i\hbar\frac{\partial}{\partial t}\Psi(\vec x,t) = -\frac{\hbar}{2m}\nabla^2\Psi(\vec x,t)+V(\vec x)\Psi(\vec x,t)',
    location: '../doc/img/schrodinger.png',
    scale: 5,
  );
  testTexToMatchGoldenFile(
    'Fourier transform',
    r'\hat f(\xi) = \int_{-\infty}^{+\infty}{f(x)e^{-2\pi i \xi x}\mathrm{d}x}',
    location: '../doc/img/fourier.png',
    scale: 5,
  );
  testTexToMatchGoldenFile(
    'Multilingual inline text',
    r'x = \frac{-b+\sqrt{b^2-4ac}}{2a}\quad \text{বাংলা}, \text{العربية}, \text{हिन्दी}, \text{日本語}, \text{中国人} + x^2 = 25',
    location: '../doc/img/unicode-inline.png',
    scale: 3,
    style: MathStyle.text,
    logicalSize: const Size(1000, 140),
  );
}
