fn main() {
    println!("{}", reverse_words("Professional".to_string()) == "lanoisseforP");
    println!("{}", reverse_words("Walk around the block".to_string()) == "Walk dnuora the kcolb");
    println!("{}", reverse_words("Launch School".to_string()) == "hcnuaL loohcS");
}

fn reverse_words(s: String) -> String {
    let words: Vec<String> = s.split_whitespace().map(|x| x.to_string()).collect::<Vec<_>>();
    let mut results: Vec<String> = [].to_vec();

    for word in words.iter() {
        if word.len() >= 5 {
            let drow = word.chars().rev().collect::<String>();
            results.push(drow);
        } else {
            results.push(word.to_string());
        }
    }

    results.join(" ")
}
