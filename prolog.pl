/* Prolog program to "guess memes" among the most famous memes in Russia */
/* Run command swipl prolog.pl */ 
/* Start with ?- go. */
/* Build with ?- [memeID]. */

go :- hypothesize(Meme),
     write('I guess that the meme is: '),
     write(Meme),
     nl,
     undo.


/* Hypotheses to be test */
hypothesize(natalya_morskaya_pehota)        :- natalya_morskaya_pehota, !.
hypothesize(sanya_eto_bober)        :- sanya_eto_bober, !.
hypothesize(unknown).             /* no classification found */

/* MEME ID rules */
natalya_morskaya_pehota :- sad, 
                        verify(morskaya_pehota),
                        verify(matuki_govorit).


sanya_eto_bober :- funny, 
                verify(bober), 
                verify(doroga),
                verify(leningradsky_prospect).


/* classification rules */
funny :- verify(funny),
     verify(kind).

sad :- verify(sad).

zloy :- sad,
     verify(zloy).

/* how to ask questions */
ask(Question) :-
    write('Данный мем имеет данный атрибут: '),
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