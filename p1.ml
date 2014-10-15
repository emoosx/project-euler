(*
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. 
 * The sum of these multiples is 23.
 * 
 * Find the sum of all the multiples of 3 or 5 below 1000.
 *)

let rec sum i accum =
  if i >= 1000 then accum
  else if (i mod 3) = 0 || (i mod 5) = 0 then sum (i+1) (accum+i)
  else sum (i+1) accum
;;

let _ = print_int (sum 0 0);;
