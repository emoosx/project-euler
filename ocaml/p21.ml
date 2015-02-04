(* Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n). *)
(* If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers. *)

(* For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220. *)

(* Evaluate the sum of all the amicable numbers under 10000. *)

let range n =
  let rec aux n acc = if n = 0 then acc else aux (n-1) (n::acc)
  in aux n []
;;

let factors n =
  let _sqrt = truncate (sqrt (float n)) in
  let rec aux divisor factors =
    if ((divisor = 0) && (_sqrt * _sqrt = n)) then _sqrt::factors
    else if (divisor = 0 && (_sqrt * _sqrt <> n)) then factors
    else if (n mod divisor = 0) then aux (pred divisor)
    (divisor::(n/divisor)::factors)
    else aux (pred divisor) factors
  in aux _sqrt []
;;

(* was being lazy, just reuse some of the stuffs from previous problems *)
let proper_divisors n = List.filter (fun x -> x <> n) (factors n);;

let sum_factors n = (List.fold_left (+) 0 (proper_divisors n));;

let sum_amicable_pairs max =
  let rec amicable_sum n sum =
    if n >= max then sum
    else
      let pair = sum_factors n in
      amicable_sum (succ n) (sum + if pair != n && sum_factors pair = n then
        n else 0)
  in amicable_sum 2 0;;



