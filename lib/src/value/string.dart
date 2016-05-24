// Copyright 2016 Google Inc. Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../value.dart';

class SassString extends Value {
  final String text;

  SassString(this.text);

  String toString() => '"$text"';
}