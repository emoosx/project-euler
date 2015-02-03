(*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * 
 * What is the largest prime factor of the number 600851475143 ?
 *)
let factors n =
  let rec aux d n =
    if n = 1 then [] else
      if n mod d = 0 then d :: aux d (n/d) else aux (d+1) n
  in aux 2 n;;

let rec last = function
  | [] -> None
  | [x] -> Some x
  | _ :: t -> last t;;

let _ = last (factors 600851475143);;

