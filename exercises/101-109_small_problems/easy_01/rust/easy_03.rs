fn main() {
    println!("{}", digit_list(7) == [7]);
    println!("{}", digit_list(375290) == [3, 7, 5, 2, 9, 0]);
    println!("{}", digit_list(444) == [4, 4, 4]);
}

// easy_03
fn digit_list(num: i32) -> Vec<i32> {
    let mut n = num;
    let mut list = vec![];

    loop {
        list.push(n % 10);
        n /= 10;
        if n == 0 {
            break;
        }
    }
    list.reverse();
    list
}
