fn main () {
    repeat("Hello", 3);
}

fn repeat(string: &str, times: i32) {
    for _n in 0..times {
        println!("{}", string)
    }
}
