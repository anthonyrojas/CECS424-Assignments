:- use_module(library(clpdf)).
kenken(Puzzle) :-
    Puzzle=[A,B,C,D,E,F],
    %Rows%
    A=[A1,A2,A3,A4,A5,A6],
    B=[B1,B2,B3,B4,B5,B6],
    C=[C1,C2,C3,C4,C5,C6],
    D=[D1,D2,D3,D4,D5,D6],
    E=[E1,E2,E3,E4,E5,E6],
    F=[F1,F2,F3,F4,F5,F6],
    %Columns%
    Co1=[A1,B1,C1,D1,E1,F1],
    Co2=[A2,B2,C2,D2,E2,F2],
    Co3=[A3,B3,C3,D3,E3,F3],
    Co4=[A4,B4,C4,D4,E4,F4],
    Co5=[A5,B5,C5,D5,E5,F5],
    Co6=[A6,B6,C6,D6,E6,F6],
    %Cages%
    /*Cage1=[A1,B1,B2,B3,C3],
    Cage2=[A2,A3],
    Cage3=[A4,A5],
    Cage4=[A6,B4,B5,B6,C4],
    Cage5=[C1,D1,D2],
    Cage6=[C2],
    Cage7=[C5],
    Cage8=[C6,D5,D6],
    Cage9=[D3,D4,E3,E4],
    Cage10=[E1,F1],
    Cage11=[E2,F2,F3,F4,F5,E5],
    Cage12=[E6,F6],*/
    %Cage constraints%
    Cage1