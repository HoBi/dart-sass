// Copyright 2016 Google Inc. Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:source_span/source_span.dart';

import '../../visitor/interface/css.dart';
import '../selector.dart';
import 'node.dart';
import 'value.dart';

/// A plain CSS style rule.
///
/// This applies style declarations to elements that match a given selector.
/// Note that this isn't *strictly* plain CSS, since [selector] may still
/// contain placeholder selectors.
class CssStyleRule extends CssParentNode {
  /// The selector for this rule.
  final CssValue<SelectorList> selector;

  final FileSpan span;

  /// A style rule is invisible if it's empty, if all its children are
  /// invisible, or if every complex selector in [selector] contains a
  /// placeholder.
  bool get isInvisible {
    if (super.isInvisible) return true;
    return selector.value.isInvisible;
  }

  CssStyleRule(this.selector, this.span);

  /*=T*/ accept/*<T>*/(CssVisitor/*<T>*/ visitor) =>
      visitor.visitStyleRule(this);

  CssStyleRule copyWithoutChildren() => new CssStyleRule(selector, span);
}
