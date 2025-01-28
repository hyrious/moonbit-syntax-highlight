// SYNTAX TEST "Packages/MoonBit/MoonBit.sublime-syntax"

// foo
// ^^^ comment.line.double-slash

/// @alert deprecated "Use foo2 instead"
/// ^^^^^^ comment.block.documentation entity.other.attribute-name.documentation

   123; -0; 1777_000_000
// ^^^ constant.numeric.integer.decimal
//          ^^^^^^^^^^^^ constant.numeric.integer.decimal

   0o755
// ^^^^^ constant.numeric.integer.octal

   0x0_123.e4P-5
// ^^^^^^^^^^^^^ constant.numeric.float

  "Hello, \x00\" world"
//^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
//^ punctuation.definition.string.begin
//        ^^^^^^ constant.character.escape
//                    ^ punctuation.definition.string.end

  "3 + 5 = \{3 + 5}"
//         ^^ punctuation.section.interpolation.begin
//             ^ keyword.operator
//                ^ punctuation.section.interpolation.end

let str =
  #| Hello
//^^ punctuation.definition.string.begin
  #| ---
  $| \{lang}\n
//          ^^ constant.character.escape
  #| ---

    let a = true
//  ^^^ keyword.declaration.variable
//        ^ keyword.operator.assignment
//          ^^^^ constant.language.boolean.true

    let c = a && b, d = a || b, e = not(a)
//            ^^ keyword.operator
//                        ^^ keyword.operator
//                                  ^^^ keyword.operator

    let initial = if size < 1 { 1 } else { size }
//  ^^^ keyword.declaration.variable
//                ^^ keyword.control
//                        ^ keyword.operator
//                                  ^^^^ keyword.control

    guard index >= 0 && index < array.length() else { None }
//  ^^^^^ keyword.control
//              ^^ keyword.operator
//                 ^ constant.numeric.integer.decimal
//                                   ^ punctuation.accessor.dot
//                                    ^^^^^^ variable.function
//                                                    ^^^^ support.type.builtin

    let mut i = 5
//      ^^^ storage.modifier
    while i > 0 {
//  ^^^^^ keyword.control
        i = i - 1
        println(i)
    }

  let sum = for i = 1, acc = 0; i <= 6; i = i + 1 {
//          ^^^ keyword.control
//                   ^ punctuation.separator
//                                    ^ punctuation.terminator
    if i % 2 == 0 {
//       ^ keyword.operator
      println("even: \{i}")
      continue i + 1, acc + i
//    ^^^^^^^^ keyword.control
    }
  } else {
    acc
  }

    pub fn hello() -> String {
//  ^^^ storage.modifier
//      ^^ keyword.declaration.function
//                 ^^ storage.type.function.arrow
//                    ^^^^^^ support.type.builtin
      "Hello, world!"
//    ^ string.quoted.double punctuation.definition.string.begin
//    ^^^^^^^^^^^^^^^ string.quoted.double
//                  ^ punctuation.definition.string.end
    }

    pub fn ArrayView::contains[T : Eq](self : ArrayView[T], value : T) -> Bool
//         ^^^^^^^^^ support.type
//                  ^^ punctuation.accessor.double-colon
//                             ^ variable.parameter.generic
//                                     ^^^^ keyword.other
//                                          ^ punctuation.separator
//                                            ^^^^^^^^^ support.class
//                                                                     ^^ storage.type.function.arrow
//                                                                        ^^^^ support.type.builtin

    fn fact(n : Int) -> Int {
      let start = 1
      let range : Iter[Int] = start.until(n)
      range.fold(Int::op_mul, init=start)
//               ^^^ support.type
//                  ^^ punctuation.accessor.double-colon
//                    ^^^^^^ keyword.operator.word
//                          ^ punctuation.separator
    }

    enum Object {
//  ^^^^ keyword.declaration.enum
//       ^^^^^^ entity.name.enum
      Point(x~ : Double, y~ : Double)
//          ^ entity.name.label
//           ^ punctuation.definition.label
      Circle(x~ : Double, y~ : Double, radius~ : Double)
    }

    type! NotImplementedError  derive(Show, Default)
//  ^^^^^ keyword.declaration.type
//        ^^^^^^^^^^^^^^^^^^^ entity.name.type
//                             ^^^^^^ keyword.declaration.impl
//                                    ^^^^ support.type.builtin

test {
  // Warning (Alert deprecated): Use foo2 instead
  foo()
  // Warning (Alert unsafe): Div will cause an error when y is zero
  div(1, 2) |> ignore
//          ^^ keyword.operator
}
