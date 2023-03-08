;;Run commands in terminal
;;  ~: clips (if u havent got alias in the system run absolute path: /dirs/abs_path/your_dir/clips)
;; CLIPS> ( chdir "/dirs/abs_path/your_dir/Expert_Systems_Labs" ) - its only for setting work directory with project file
;; CLIPS> (load ./clips.clp)
;; CLIPS> (reset)
;; CLIPS> (run)
;; Then u will see programm inputs

;; initialiaze relations and facts
(deffacts initialFacts
        "initialize relations in program"
        (parent dima katya)
        (parent dima kirill)
        (parent dima maria)
        (parent ira maria)
        (parent maria egor)
        (parent maria anya)
        (parent kirill vitya)
        (female katya)
        (male kirill)
        (female ira)
        (female maria)
        (female anya)
        (male egor)
        (male vitya)
        (male dima)
)


;;===============inputs===========================================
(defrule getNames
   (declare (salience 100))
   =>
   (printout t "Enter first name: ")
   (bind ?name1 (read))
   (printout t "Enter second name: ")
   (bind ?name2 (read))
   (printout t "--------Results--------" crlf)

   (assert (abuelo ?name1))
)

;;===============relatonship rules=====================================================

(defrule brotherRelation
    (male ?x)
    (parent ?z ?x)
    (parent ?z ?y)
    (test (not (eq ?y ?x)))
   =>
    (assert (brother ?x ?y))
)

(defrule sisterRelation
    (female ?x)
    (parent ?z ?x)
    (parent ?z ?y)
    (test (not (eq ?y ?x)))
   =>
    (assert (sister ?x ?y))
)

(defrule brother0rSisterRelation
    (parent ?z ?x)
    (parent ?z ?y)
    (test (not (eq ?y ?x)))
   =>
    (assert (brother-sister ?x ?y))
)

(defrule cousingRelation
    (parent ?w ?x)
    (parent ?z ?y)
    (brother ?w ?z)
   =>
    (assert (cousing ?x ?y))
)

(defrule grandFatherRelation
    (parent ?x ?z)
    (parent ?z ?y)
    (male ?x)
   =>
    (assert (grandFather ?x ?y))
)

(defrule grandMotherRelation
    (parent ?x ?z)
    (parent ?z ?y)
    (female ?x)
   =>
    (assert (grandMother ?x ?y))
)

(defrule grandChildRelation
    (grandFather ?z ?x)
    (male ?x)   
   =>
    (assert (grandChild ?x ?z))
)

(defrule grandDaugtherRelation
    (grandFather ?z ?x)
    (female ?x)   
   =>
    (assert (grandDaugther ?x ?z))
)


(defrule uncleRelation
    (parent ?z ?x)
    (brother ?y ?z)  
   =>
    (assert (uncle ?y ?x))
)

(defrule auntRelation
    (parent ?z ?x)
    (sister ?y ?z)  
   =>
    (assert (aunt ?y ?x))
)


(defrule grandFatherOrGrandMotherRelation
    (parent ?x ?z)
    (parent ?z ?y)
   =>
    (assert (grandFather-grandMother ?x ?y))
)



;;===============extra rules===============================================
(defrule isGrandFather
    (grandFather ?a ?b)
   =>
    (printout t ?a " is GrandFather of: " ?b crlf)
)

(defrule isNotGrandFather
   (not (grandFather ?resp1 ?resp2))
   =>
    (printout t "Not is grand father" crlf)
)

(defrule isGrandMother
   (grandMother ?a ?b)
   =>
    (printout t ?a " is GrandMother of: " ?b crlf)
)

(defrule isNotGrandMother
    (not (grandMother ?resp1 ?resp2))
   =>
    (printout t "Not is grand mother" crlf)
)

