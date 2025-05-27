# flutter_snackbar_plus

![Pub Version](https://img.shields.io/pub/v/flutter_snackbar_plus) ![License](https://img.shields.io/github/license/micazi/flutter_snackbar_plus) ![Pub Points](https://img.shields.io/pub/points/flutter_snackbar_plus)

**`flutter_snackbar_plus`** is a minimal library to handle SnackBars with elaborate list of configuration & style options..

---

## Table of Contents

1. [Demo](#demo)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)

---
## Demo

<img src="https://raw.githubusercontent.com/micazi/flutter_snackbar_plus/master/demo/1.gif" alt="Demo GIF" width="300" />
<img src="https://raw.githubusercontent.com/micazi/flutter_snackbar_plus/master/demo/2.gif" alt="Demo GIF" width="300" />

---

## Features

- **Custom Regex Styling**: Apply styles dynamically to text patterns.
- **Interactive Callbacks**: Define actions for user interactions with matched text.
- **Dynamic Updates**: Modify regex patterns on the fly without recreating the controller.
- **IME Composition Support**: Smooth handling for languages like Japanese and Chinese.
- **Performance Optimizations**: Cached regex for better performance.
- **RichWrapper Widget**: A widget for seamless integration with the controller.
- **Fine-grained Configuration**: Control deletion behavior, styles, and tap actions for specific matches.

---

## Installation

1. Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_snackbar_plus: ^[latest_version]
```

2. Run the following command to install the package:

```bash
flutter pub get
```

3. Import the package into your Dart file:

```dart
import 'package:flutter_snackbar_plus/flutter_snackbar_plus.dart';
```

---

## Usage

Here's a quick example of how to use `RichTextController` to style specific patterns in a `TextField`:

### Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_snackbar_plus/flutter_snackbar_plus.dart';

defaultTextStyle(BuildContext context) => TextStyle(color: Colors.black);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('RichTextController Example')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: RichTextController(
                text: '',
                onMatch: (match, target) {
                  print('Match found: \$match');
                },
                targetMatches: [
                  MatchTargetItem(
                    textStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    regex: RegExp(r'#[a-zA-Z0-9_]+'),
                  ),
                  MatchTargetItem(
                    textStyle: TextStyle(color: Colors.green),
                    regex: RegExp(r'@[a-zA-Z0-9_]+'),
                  ),
                ],
              ),
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ),
      ),
    );
  }
}
```

---


## Contributing

Contributions are always welcome! Here’s how you can help:

1. Report bugs or request features via GitHub Issues.
2. Submit pull requests with well-documented code and examples.
3. Share your thoughts and ideas to improve the package.

---

## License

Licensed under the MIT License. You are free to use, modify, and distribute this package. See the [LICENSE.md](LICENSE.md) file for details.

