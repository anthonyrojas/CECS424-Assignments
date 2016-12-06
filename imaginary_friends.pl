imaginary_friend(grizzly_bear).
imaginary_friend(moose).
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
    
    Triples=[ [joanne, JoanneFriend, JoanneAdventure],
              [lou, LouFriend, LouAdventure],
              [ralph, RalphFriend, RalphAdventure],
              [winnie, WinnieFriend, WinnieAdventure] 
            ],
    %1. The seal (who isnt a  creation of either Joanne or Lou)
    %neither rode to the moon in a spaceship
    %nor took a trip around the world on a magic train
    \+ member([joanne, seal, _], Triples),
    \+ member([lou, seal, _], Triples),    
    \+ member([_, seal, spaceship], Triples),    
    \+ member([_, seal, train], Triples),
    %2. Joanne's imaginary friend who's not a grizzly
    %went to the circus
    \+ member([joanne, grizzly_bear, _], Triples),
    member([joanne, _, circus], Triples),    
    \+ member([_, grizzly_bear, circus], Triples),
    %3. Winnie's imaginary friend is a zebra    
    member([winnie, zebra, _], Triples),
    %4. The grizzly bear didn't board the spaceship to the moon
    \+ member([_, grizzly_bear, spaceship], Triples),
    
    tell(joanne, JoanneFriend, JoanneAdventure),
    tell(lou, LouFriend, LouAdventure),    
    tell(ralph, RalphFriend, RalphAdventure),    
    tell(winnie, WinnieFriend, WinnieAdventure).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X, Y, Z) :- 
    write(X), write(' has the imaginary friend of a '), 
    write(Y), write(' and they went on/in '), 
    write(Z), nl.
