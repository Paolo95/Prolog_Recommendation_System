:- use_module(library(persistency)).
:- persistent(db(id:atom, property:atom, value:atom)).

% generate product knowledge base from provided csv file

initdb :-
    open('product_list.csv', read, Stream),
    parseProducts(Stream).
    close(Stream).

% do nothing if at the end of stream
parseProducts(Stream) :-
    at_end_of_stream(Stream),
    writeln("Reached end of stream"). 

parseProducts(Stream) :-
    \+ at_end_of_stream(Stream),
    csv_options(Options, [arity(7)]),
    csv_read_row(Stream, Row, Options),
    addInfo(Row),
    parseProducts(Stream).

% add info contained in Row into knowledge base
addInfo(Row) :-
    % convert terms into lists
    Row =.. [_, ID, Category, Status, Name, Price, Rating, QtyInStock],
    addTitle(ID, Category, Status, Name, Price, Rating, QtyInStock).

% return true (skip film) if one of the arguments is missing from the csv file
addTitle('',_,_,_,_,_,_).
addTitle(_,'',_,_,_,_,_).
addTitle(_,_,'',_,_,_,_).
addTitle(_,_,_,'',_,_,_).
addTitle(_,_,_,_,'',_,_).
addTitle(_,_,_,_,_,'',_).
addTitle(_,_,_,_,_,_,'').

% skip not in stock products
addTitle(_,_,_,_,_,_,QtyInStock) :-
    QtyInStock == 0.


addTitle(ID, Category, Status, Name, Price, Rating, QtyInStock) :-
    assert( db(ID, category, Category) ),
    assert( db(ID, status, Status) ),
    assert( db(ID, name, Name) ),
    assert( db(ID, price, Price) ),
    assert( db(ID, rating, Rating) ),
    assert( db(ID, qtyInStock, QtyInStock) ).

