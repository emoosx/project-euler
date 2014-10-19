(*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * 
 * What is the largest prime factor of the number 600851475143 ?
 *)

let range n =
  let rec aux n acc =
    if n < 2 then acc
    else aux (pred n) (n :: acc)
  in aux n []
;;

let remove l n =
  let rec aux l = match l with
  | [] -> []
  | hd::tl -> if hd <> n then hd::(aux tl) else aux tl
  in aux l ;;

let fold_iter f a b init step =
  let rec aux acc i =
    if i > b then acc else aux (f acc i) (i + step)
  in aux init a ;;

let primes n =
  let numbers = (range n) in
  let limit = truncate(sqrt(float n)) in
  fold_iter (fun li x ->
    if List.mem x li then (fold_iter remove (x*x) n li x) else li)
  2 (limit) numbers 1
;;

let largest_prime_factor n = 
  let limit = truncate(sqrt(float n)) in
  let primes = primes n in
  let rec aux acc n = function
    | [] -> acc
    | hd::tl -> if (n mod hd) = 0 then aux hd (n/hd) tl else aux acc n tl
  in aux 1 n primes
;;
