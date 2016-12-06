day(monday).
day(tuesday).
day(wednesday).
day(thursday).
day(friday).

earlier(monday, tuesday).
earlier(monday, wednesday).
earlier(monday, thursday).
earlier(monday, friday).
earlier(tuesday, wednesday).
earlier(tuesday, thursday).
earlier(tuesday, friday).
earlier(wednesday, thursday).
earlier(wednesday, friday).
earlier(thursday, friday).

sighting(balloon).
sighting(clothesline).
sighting(frisbee).
sighting(water_tower).

solve :-
    day(BarradaDay),
    day(GortDay),
    day(KlatuDay),
    day(NiktoDay),
    all_different([BarradaDay, GortDay, KlatuDay, NiktoDay]),
    sighting(BarradaSighting),
    sighting(GortSighting),
    sighting(KlatuSighting),
    sighting(NiktoSighting),
    all_different([BarradaSighting, GortSighting, KlatuSighting, NiktoSighting]),
    Triples = [ [barrada, BarradaDay, BarradaSighting],
                [gort, GortDay, GortSighting],
                [klatu, KlatuDay, KlatuSighting],
                [nikto, NiktoDay, NiktoSighting]
              ],
    %1. Mr. Klatu made his sighting at some point earlier in the week than
    %the one who saw the balloon, but at some point later in the week than
    %the one who spotted the frisbee.
    \+ member([klatu, _, balloon], Triples),
    \+ member([klatu, _, frisbee], Triples),
    member([_, X, balloon], Triples),
    member([_, Y, frisbee], Triples),
    earlier(KlatuDay, X),
    earlier(Y, KlatuDay),
    %2. Friday's sighting was made by either Ms. Barrada or the one
    %who saw the clothesline (or both).
    (member([barrada, friday, _], Triples);
    member([_, friday, clothesline], Triples);
    member([barrada, friday, clothesline], Triples)),
    %3. Mr. Nikto did not make his sighting Tuesday
    \+ member([nikto, tuesday, _], Triples),
    %4. Mr. Klatu isn't the one whose object turned out to be a water tower.
    \+ member([klatu, _, water_tower], Triples),
    tell(barrada, BarradaDay, BarradaSighting),
    tell(gort, GortDay, GortSighting),
    tell(klatu, KlatuDay, KlatuSighting),
    tell(nikto, NiktoDay, NiktoSighting).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X, Y, Z) :-
    write(X), write(' saw the '), write(Z), write(' on '), write(Y), nl.
