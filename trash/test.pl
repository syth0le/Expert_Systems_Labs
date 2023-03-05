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
hypothesize(strawberry)  :- strawberry, !.
hypothesize(oranges)     :- oranges, !.
hypothesize(banana)      :- banana, !.
hypothesize(avocado)     :- avocado, !.
hypothesize(tomato)      :- tomato, !.
hypothesize(blackberry) :- blackberry, !.
hypothesize(lemon)      :- lemon, !.
hypothesize(rice)       :- rice, !.
hypothesize(carrot)      :- carrot, !.
hypothesize(bellpepper)      :- bellpepper, !.
hypothesize(potato)      :- potato, !.
hypothesize(corn)        :- corn, !.
hypothesize(unknown).             /* no classification found */

/* Produce ID rules */
strawberry :- berry, 
           verify(red), 
           verify(has_leaves),
           verify(not_spherical).
oranges :- citrus, 
           verify(orange), 
           verify(has_no_leaves),
           verify(is_spherical).
banana :- fruit, 
          verify(yellow), 
          verify(has_no_leaves),
          verify(is_cylindrical).
avocado :- fruit, 
          verify(dark_green), 
          verify(has_no_leaves),
          verify(is_spherical).
blackberry :- berry,
            verify(dark_purple),
            verify(has_leaves).
tomato :- fruit, 
          verify(red), 
          verify(has_leaves),
          verify(is_spherical).
lemon   :- citrus,
          verify(yellow),
          verify(is_spherical),
          verify(sour).
rice    :- grain,
          verify(is_small),
          verify(usually_white).
carrot :- vegetable,
          verify(orange),
          verify(has_leaves),
          verify(not_spherical).
bellpepper  :- seeded_vegetable,
          verify(green),
          verify(not_spherical).
potato :- vegetable, 
          verify(brown), 
          verify(has__no_leaves),
          verify(is_spherical).
corn :- grain, 
          verify(yellow), 
          verify(has_leaves),
          verify(not_spherical).

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