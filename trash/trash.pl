/* Prolog program to "guess that produce" among vegetables and fruits */
/* Andrew Canaan & Philip Chang Intro to AI Project 3 */
/* Start with ?- go. */
/* Build with ?- [produceid]. */

go :- hypothesize(Produce),
     write('I guess that the produce is: '),
     write(Produce),
     nl,
     undo.

/* Hypotheses to be test */
hypothesize(natalya_morskaya_pehota)        :- natalya_morskaya_pehota, !.
hypothesize(sanya_eto_bober)        :- sanya_eto_bober, !.
hypothesize(unknown).             /* no classification found */

/* MEME ID rules */
natalya_morskaya_pehota :- grain, 
                        verify(red), 
                        verify(has_leaves),
                        verify(not_spherical).
sanya_eto_bober :- citrus, 
                verify(orange), 
                verify(has_no_leaves),
                verify(is_spherical).

/* classification rules */
fruit    :- verify(has_seeds),
            verify(has_juice).

citrus    :- fruit,
              verify(grows_on_trees).

vegetable :- verify(no_seeds),
              verify(part_of_a_plant).
        
grain     :- vegetable,
            verify(usually_dry_and_durable).

seeded_vegetable :- verify(part_of_a_plant),
                      verify(has_seeds).
berry :- fruit,
              verify(multiple_fruits_from_flower).

/* how to ask questions */
ask(Question) :-
    write('Does the produce have the following attribute: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.