imaginary_friend(grizzly_bear).
imaginary_friend(mooose).
imaginary_friend(seal).
imaginary_friend(zebra).
adventure(circus).
adventure(rock_band).
adventure(spaceship).
adventure(train).

solve :-
    imaginary_friend(JoanneFriend),
    imaginary_friend(LouFriend),
    imaginary_friend(RalphFriend),
    imaginary_friend(WinnieFriend),
    all_different([JoanneFriend, LouFriend, RalphFriend, WinnieFriend]),
    adventure(JoanneAdventure),
    adventure(LouAdventure),
    adventure(RalphAdventure),
    adventure(WinnieAdventure),
    all_different([JoanneAdventure, LouAdventure, RalphAdventure, WinnieAdventure]),
    Triples=[ [Joanne, JoanneFriend, JoanneAdventure],
              [Lou, LouFriend, LouAdventure],
              [Ralph, RalphFriend, RalphAdventure],
              [Winnie, WinnieFriend, WinnieAdventure] ],
    %1. The seal --who isnt a  creation of either Joanne or Lou--
    %neither rode to the moon in a spaceship
    %nor took a trip around the world on a magic train
    \+ member([Joanne, seal, _], Triples),
    \+ member([Lou, seal, _], Triples),
    \+ member([_, seal, spaceship], Triples),
    \+ member([_, seal, train], Triples),
    %2. Joanne's imaginary friend (who's not a grizzly)
    %went to the circus
    \+ member([Joanne, grizzly_bear, _], Triples),
    \+ member([_, grizzly_bear, circus], Triples),
    (member([Joanne, _, circus], Triples)),
    %3. Winnie's imaginary friend is a zebra
    (member([Winnie, zebra, _], Triples)),
    %4. The grizzly bear didn't board the spaceship to the moon
    \+ member([_, grizzly_bear, spaceship], Triples),
    tell(Joanne, JoanneFriend, JoanneAdventure),
    tell(Lou, LouFriend, LouAdventure),
    tell(Ralph, RalphFriend, RalphAdventure),
    tell(Winnie, WinnieFriend, WinnieAdventure).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X,Y,Z) :- 
    write('Test: '),
    write(X), 
    write(Y), 
    write(Z).
