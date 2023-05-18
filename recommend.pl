% First time starting: startinit
% Note: each answer needs to end in '.'

:- [gendb].

startinit :- 
    writeln('Loading product database, please wait... '),
    initdb,
    start.
    
start :-
    nl,nl,
    write('   Hello!  '),
    write('Welcome to the product recommendation system. Please answer questions below!'),nl,
    ask1, nl,
    read(Ans1), nl,
    ask2, nl, 
    read(Ans2), nl,
    ask3, nl, 
    read(Ans3), nl,
    % print the first 50 matched products
    write('we recommend following products:'), nl,
    forall(limit(50, distinct(recommend(Ans1, Ans2, Ans3, F))), writeln(F)).


ask1 :-
    write("What types of products are you searching? "), nl,
    write("1. Smartphone"),nl,
    write("2. Tablet"),nl,
    write("3. TV"),nl,
    write("4. Smartwatch"),nl,
    write("5. Air Conditioner"), nl,
    write("0. No preference").

ask2 :-
    write("Do you want a new or used product? "), nl,
    write("1. New"),nl,
    write("2. Used"),nl,
    write("0. No preference").

ask3 :-
    write("Do you prefer high-scoring products? "), nl,
    write("1. Yes"),nl, 
    write("0. Doesn't matter").

ask4 :-
    write("Type a list of searched products in the past."), nl,
    write("0. I don't have past searches").

% q1(0, _) is always true since no preference
q1(0, _).

% q1(1, N) is true if film N is  released before 2000
q1(1, ID) :-
    db(ID, category, 'Smartphone').
    
% q1(2, N) is true if film N is released after 2000 
q1(2, ID) :-  
    db(ID, category, 'Tablet').

q1(3, ID) :-
    db(ID, category, 'TV').

q1(4, ID) :-
    db(ID, category, 'Smartwatch').

q1(5, ID) :-
    db(ID, category, 'Air Conditioner').
    
% handle invalid input
q1(Op, _) :- not( member(Op, [0, 1, 2, 3, 4, 5]) ).
 
q2(0, _).
% New products

q2(1, ID) :- 
    db(ID, status, 'New').
    
% Used products
q2(2, ID) :- 
    db(ID, status, 'Used').
    
% handle invalid input
q2(Op, _) :- not( member(Op, [0, 1, 2]) ).

q3(0, _).

q3(1, ID) :-
    db(ID, rating, R),
    R > 3.
    
q3(2, ID) :-
    db(ID, rating, R),
    R < 4.
    
% handle invalid input
q3(Op, _) :- not( member(Op, [0, 1, 2]) ). 


% Bebug: recommend(2, 1, 0, 0, 0, F). -- returns all matches to modern emotional films
%   to add more questions, simply add another parameter and define all possible qn()'s for that question
recommend(Ans1, Ans2, Ans3, Filmname) :-
    db(ID, name, Filmname),
    q1(Ans1, ID),
    q2(Ans2, ID),
    q3(Ans3, ID).
