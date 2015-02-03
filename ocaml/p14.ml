(*
 * The following iterative sequence is defined for the set of positive integers:
 * 
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 * 
 * Using the rule above and starting with 13, we generate the following sequence:
 * 
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
 * 
 * Which starting number, under one million, produces the longest chain?
 * 
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 *)

let even n = n mod 2 == 0;;

let collatzSteps n =
  let rec aux steps = function
    | n when n = 1 -> steps
    | n -> if even n then aux (succ steps) (n/2) else aux (succ steps) (3*n + 1)
  in aux 1 n
;;

let chain n =
  let rec aux init max = function
    | curr when curr = n -> init
    | curr -> let steps = collatzSteps curr in
    if steps > max then aux curr steps (succ curr) else aux init max (succ curr)
    in aux 0 1 1
;;


let _ = print_int (chain (pred 1_000_000));;
