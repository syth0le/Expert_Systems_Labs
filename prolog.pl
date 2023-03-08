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
hypothesize(kavkazskie_uchenye_razrabotali)        :- kavkazskie_uchenye_razrabotali, !.
hypothesize(tam_v_gorah_vysokih_rodina_caucasus)        :- tam_v_gorah_vysokih_rodina_caucasus, !.
hypothesize(ryan_gosling)        :- ryan_gosling, !.
hypothesize(burger_king_gvn)        :- burger_king_gvn, !.
hypothesize(eto_moy_grib_eto_ya_ego_em)        :- eto_moy_grib_eto_ya_ego_em, !.
hypothesize(devochki_vi_upali)        :- devochki_vi_upali, !.
hypothesize(tapok_zaminirovali)        :- tapok_zaminirovali, !.
hypothesize(minecraft_eto_moya_zhizn)        :- minecraft_eto_moya_zhizn, !.
hypothesize(ricardo_milos)        :- ricardo_milos, !.
hypothesize(kak_tebe_takoe_elon_musk)        :- kak_tebe_takoe_elon_musk, !.
hypothesize(unknown).             /* no classification found */

/* MEME ID rules */
natalya_morskaya_pehota :- sad, 
                         verify(morskaya_pehota).

sanya_eto_bober :- smeshnoy, 
                verify(bober), 
                verify(doroga),
                verify(leningradsky_prospect).

kavkazskie_uchenye_razrabotali  :- krinzh,
                verify(baran),
                verify(mountains).
                
tam_v_gorah_vysokih_rodina_caucasus :- smeshnoy,
                verify(baran),
                verify(mountains),
                verify(donkey).

ryan_gosling :- smeshnoy,
               verify(ryan_gosling),
               verify(v_glavnyh_rolyah).

burger_king_gvn :- krinzh,
               verify(gde_moi_sous),
               verify(burgert_king).

eto_moy_grib_eto_ya_ego_em :- krinzh,
                              verify(take_picture_of_mushroom),
                              verify(eto_moi_grib),
                              verify(homeless),
                              verify(aaaaaa_scream).

devochki_vi_upali :- smeshnoy,
                    verify(son_is_an_excellent_student),
                    verify(devochkiiii).

tapok_zaminirovali :- sad,
                    verify(tapok),
                    verify(mina).

minecraft_eto_moya_zhizn :- sad,
                         verify(minecraft).

ricardo_milos :- krinzh,
               verify(pants),
               verify(dance),
               verify(latinos).


kak_tebe_takoe_elon_musk :- smeshnoy,
                         verify(elon_musk),
                         verify(invention).
               


/* classification rules */
smeshnoy :- verify(smeshnoy).

sad :- verify(sad).

krinzh :- verify(krinzh).

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