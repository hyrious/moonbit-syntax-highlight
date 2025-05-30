// Note: clone the core repository before run this file.

fn main {
  try { man!() }
  catch { e => println(e) }
}

fn man!() -> Unit {
  let content = @fs.read_file_to_string!("../core/builtin/builtin.mbti")
  let methods = Set::new()

  let mut skip_next_line = false
  for line in content.split("\n") {
    if (skip_next_line) {
      skip_next_line = false
      continue
    }
    if line.contains("#deprecated") {
      skip_next_line = true
      continue
    }
    if line.contains("::") { continue }

    let mut start_offset = 0

    if line.has_prefix("fn ") {
      start_offset = 3
    } else if line.has_prefix("fn[") {
      guard line.find_by(fn(c) { c == ']' }) is Some(i) else { continue }
      start_offset = i + 2
    }

    if start_offset > 0 {
      let end_offset = str_scan(line, is_ident, start_offset~)
      let mut name = line.view(start_offset~, end_offset~).to_string()
      if line.contains("!") { name += "!" }
      methods.add(name)
    }
  }

  for f in methods {
    if f == "not" || f.has_prefix("op_") { continue }
    println(
      $|{ "trigger": "\{f}", "contents": "\{f}($1)", "annotation": "built-in", "kind": "function" },
    )
  }
}

fn str_scan(s: @string.View, f: (Char) -> Bool, start_offset~: Int = 0) -> Int {
  guard s.view(start_offset~).find_by(fn(c) { not(f(c)) }) is Some(i) else { return -1 }
  return i + start_offset
}

fn is_ident(x: Char) -> Bool {
  return x is ('A'..='Z' | 'a'..='z' | '0'..='9' | '_')
}
