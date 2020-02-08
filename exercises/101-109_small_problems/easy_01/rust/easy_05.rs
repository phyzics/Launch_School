fn main() {
    println!("{}", reverse_sentence(""));
    println!("{}", reverse_sentence("Hello World"));
    println!("{}", reverse_sentence("Reverse these words"));
}

fn reverse_sentence(s: &str) -> String {
    let mut sen: Vec<&str> = s.split_whitespace().collect::<Vec<_>>();
    sen.reverse();
    sen.join(" ")
}
