(*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * 
 * Find the sum of all the primes below two million.
 *)

let isPrime (n:int) : bool =
  let sqrt_n = truncate (sqrt (float n)) in
  let rec helper k =
    if k <= 1 then true
    else if n mod k == 0 then false
      else helper (pred k) in 
  helper sqrt_n
;;

let rec primeSumBelow acc = function
  | n when n = 1 -> acc
  | n -> if isPrime n then primeSumBelow (acc + n) (pred n)
         else primeSumBelow acc (pred n)
;;

let _ = print_int (primeSumBelow 0 2_000_000)
