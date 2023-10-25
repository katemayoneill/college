
add(0, X, X).
add(X, 0, X).
add(s(X), Y, s(Z)) :- add(X, Y ,Z).

% Exercise 1



% Adding X + Y, where X and Y are terms, results in Z.
add2(X + Y, W, Z) :- add2(X, Y, V), add2(V, W, Z).
add2(X, Y + W, Z) :- add2(Y, W, V), add2(V, X, Z).

% Recursive case: Adding the successor of X to Y results in the successor of Z,
% where Z is the result of adding X to Y.
add2(s(X), Y, s(Z)) :- add(X, Y, Z).

% Exercise 2
add3(p(X), Y, Z) :- add2(X, Y, Z).
add3(X, p(Y), Z) :- add2(X, Y, Z).
add3(p(X), p(Y), p(Z)) :- add3(X, Y, Z).

% Exercise 3
minus(X, X).
minus(0, p(X)) :- minus(X, 0).
minus(s(X), s(Y)) :- minus(X, Y).

% Exercise 4
add4(X, Y, Z) :- add3(X, Y, Z).
add4(-X, Y, Z) :- subtract(X, Y, Z).

% Exercise 5
subtract(X, 0, X).
subtract(0, p(X), s(Z)) :- subtract(X, 0, Z).
subtract(p(X), p(Y), Z) :- subtract(X, Y, Z).

% Exercise 6
add5(X - Y, Z, Result) :- subtract2(X, Y, Temp), add4(Temp, Z, Result).
subtract2(X, Y - Z, Result) :- subtract(X, Y, Temp), add4(Temp, Z, Result).