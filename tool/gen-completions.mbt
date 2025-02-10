// Note: clone the core repository before run this file.

fn main {
  try { man!() }
  catch { e => println(e) }
}

fn man!() -> Unit {
  let content = @fs.read_file_to_string!(path="../core/builtin/builtin.mbti")
  let methods = Set::new()
  for line in content.split("\n") {
    if line.starts_with("fn ") && not(line.contains("deprecated")) {
      let end = str_scan(line, is_ident, start=3)
      let mut name = line.substring(start=3, end~)
      if line.contains("!") { name += "!" }
      methods.add(name)
    }
  }
  for f in methods {
    if f == "not" || f.starts_with("op_") { continue }
    println(
      $|{ "trigger": "\{f}", "contents": "\{f}($1)", "annotation": "f", "kind": "function" },
    )
  }
}

fn str_scan(s: String, f: (Char) -> Bool, start~: Int = 0) -> Int {
  for i = start; i < s.length(); i = i + 1 {
    if f(s[i]) { continue }
    return i
  }
  return -1
}

fn is_ident(x: Char) -> Bool {
  match x {
    'A'..='Z' | 'a'..='z' | '0'..='9' | '_' => true
    _ => false
  }
}
