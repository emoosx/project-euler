(*
 * 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
 * 
 * What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 *)

(* generate numbers from 2 to n *)
let range n = let rec aux n acc = if n <= 1 then acc else aux (pred n) (n :: acc) in
aux n [];;

(* remove an item n from a list l *)
let remove l n = 
  let rec aux l =
    match l with
    | [] -> []
    | hd::tl -> if hd <> n then hd::(aux tl) else aux tl
  in aux l
;;

let fold_iter f a b init step =
  let rec aux acc i =
    if i > b then acc else aux (f acc i) (i + step) 
  in aux init a
;;

(* seive of eratosthenes *)
let primes n = 
  let numbers = (range n) in
  let limit = truncate(sqrt(float n)) in
  fold_iter (fun li x ->
    if List.mem x li then (fold_iter remove (x*x) n li x) else li)
    2 (limit) numbers 1
;;

(* implementing an integer exponentiation *)
let rec pow a = function
  | 0 -> 1
  | 1 -> a
  | n -> let b = pow a (n/2) in
  b * b * (if n mod 2 = 0 then 1 else a)
;;

let f v n =
  let rec aux acc power =
    if (pow v power) > n then acc
    else aux (acc * v)  (succ power) 
  in aux 1 1
;;

let small_evenly_divisibe_number n =
  let primes_less_than_n = primes n in
  List.fold_left (fun acc x -> acc * (f x n)) 1 primes_less_than_n
;;

let _ = print_int (small_evenly_divisibe_number 20)
