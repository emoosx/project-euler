(*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 * 
 * What is the 10 001st prime number?
 *)

let isPrime (n:int) : bool =
  let sqrt_n = truncate(sqrt (float n)) in
  let rec helper k =
    if k <= 1 then true
      else if n mod k == 0 then false
    else helper (pred k) in
  helper sqrt_n
;;

let nthPrime n =
  let rec aux nth prime = 
    if nth = (n+1) then (prime-1)
    else (if isPrime prime then aux (nth+1) (prime+1)  else aux nth (prime+1))
  in aux 1 2;;

let _ = print_int (nthPrime 10_001);;
