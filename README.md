# Flutter Math Fork

[![Pub Version](https://img.shields.io/pub/v/flutter_math_fork)](https://pub.dev/packages/flutter_math_fork)

Math equation rendering in pure Dart and Flutter, with a parser derived from
[KaTeX](https://github.com/KaTeX/KaTeX).

## Fork status

`flutter_math_fork` is a maintained fork of
[flutter_math](https://github.com/znjameswu/flutter_math), with active updates
in [simpleclub/flutter_math](https://github.com/simpleclub/flutter_math) to keep
the package working on current Flutter stable releases.

This release is tested with Flutter `3.38.9` on the stable channel.

## Features

* TeX math parsing and rendering in pure Flutter.
* Selectable math with copy and select-all support.
* Manual parser and AST APIs for advanced integrations.
* TeX-style line breaking support.

Unsupported or partially supported KaTeX features are documented in
[doc/unsupported.md](doc/unsupported.md).

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_math_fork: ^0.8.0
```

The current release targets Flutter `3.38.0` or newer.

## Quick start

Render a display equation:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

Math.tex(
  r'x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}',
  mathStyle: MathStyle.display,
  textStyle: const TextStyle(fontSize: 24),
)
```

Render inline math:

```dart
Math.tex(
  r'\frac a b',
  mathStyle: MathStyle.text,
)
```

Control sizing explicitly with `MathOptions`:

```dart
Math.tex(
  r'\int_0^\infty e^{-x^2}\,\mathrm{d}x',
  options: MathOptions(
    style: MathStyle.display,
    fontSize: 22,
  ),
)
```

## Selectable math

Use `SelectableMath` when the user should be able to select or copy the TeX:

```dart
SelectableMath.tex(
  r'\frac a b',
  textStyle: const TextStyle(fontSize: 24),
  toolbarOptions: const SelectableMathToolbarOptions(
    copy: true,
    selectAll: true,
  ),
)
```

Starting with `0.8.0`, `SelectableMath.toolbarOptions` uses the package-owned
`SelectableMathToolbarOptions` type instead of Flutter's deprecated
`ToolbarOptions`.

## Error handling

Provide `onErrorFallback` to render your own widget when parsing or building
fails:

```dart
Math.tex(
  r'\garbled $tring',
  onErrorFallback: (err) => Container(
    color: Colors.red,
    padding: const EdgeInsets.all(8),
    child: Text(
      err.messageWithType,
      style: const TextStyle(color: Colors.white),
    ),
  ),
)
```

## Advanced usage

For manual parsing and AST handling:

```dart
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';

final ast = SyntaxTree(
  greenRoot: TexParser(
    r'\frac a b',
    const TexParserSettings(),
  ).parse(),
);

final widget = SelectableMath(
  ast: ast,
  mathStyle: MathStyle.text,
  textStyle: const TextStyle(fontSize: 24),
);
```

See also:

* [doc/line_breaking.md](doc/line_breaking.md)
* [doc/design.md](doc/design.md)

## Rendering samples

`x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}`

![Quadratic equation](doc/img/delta.png)

`i\hbar\frac{\partial}{\partial t}\Psi(\vec x,t) = -\frac{\hbar}{2m}\nabla^2\Psi(\vec x,t)+ V(\vec x)\Psi(\vec x,t)`

![Schrodinger equation](doc/img/schrodinger.png)

`\hat f(\xi) = \int_{-\infty}^\infty f(x)e^{- 2\pi i \xi x}\mathrm{d}x`

![Fourier transform](doc/img/fourier.png)

## Credits

This project draws heavily from the work of
[KaTeX](https://katex.org/), [MathJax](https://www.mathjax.org/),
[Zefyr](https://github.com/memspace/zefyr), and
[CaTeX](https://github.com/simpleclub/CaTeX).
