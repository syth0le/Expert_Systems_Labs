(clear) 
(reset)


(deffunction ask (?prompt)
   (printout t ?prompt)
   (return (read))
)

(deffunction fibonacci ()
   (bind ?number (ask "Enter a positive integer representing how many numbers of the Fibonacci sequence you want: "))
   (if (and (integerp ?number) (> ?number 0)) then
      (printout t (fib ?number) crlf)
   else
      (printout t "This input did not meet the requirements. Try again." crlf)
      (fibonacci)
   )
   (return)
)

(deffunction fib (?n)
   (bind ?values (list))
   (bind ?values (insert$ ?values 1 1)) 
   (if (= ?n 1) then      ; Check if number wanted is 1, so list can be returned now
      (return ?values)
   )
   (bind ?values (insert$ ?values 2 1))
   (for (bind ?i 3) (<= ?i ?n) (++ ?i)
      (bind ?values (insert$ ?values ?i (+ (nth$ (- ?i 1) ?values) (nth$ (- ?i 2) ?values))))
   )
   (return ?values)
)