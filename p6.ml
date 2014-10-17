(*
 * The sum of the squares of the first ten natural numbers is,
 * 
 * 1^2 + 2^2 + ... + 10^2 = 385
 * The square of the sum of the first ten natural numbers is,
 * 
 * (1 + 2 + ... + 10)^2 = 55^2 = 3025
 * Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
 * 
 * Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 *)

let range n =
  let rec aux n acc =
    if n < 1 then acc 
    else aux (pred n) (n :: acc)
  in aux n []
;;

let sum_of_the_squares n = List.fold_left (fun acc x -> acc + (x*x)) 0 (range n)
;;

let square_of_the_sums n = 
  let sum = List.fold_left (+) 0 (range n) in sum * sum ;;

let _ = print_int ((square_of_the_sums 100) - (sum_of_the_squares 100))
