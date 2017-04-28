person(lily, female, 180, 30, phd).
person(jenny, female, 167, 25, hs).
person(bob, male, 180, 40, phd).
person(richard, male, 190, 30, masters).
person(tom, male, 177, 29, hs).

degreeList(hs,bs).
degreeList(bs,masters).
degreeList(masters,phd).

sex(X,S):-person(X,S,_,_,_).
height(X,Height):- person(X,_,H,_,_), Height is H.
age(X,Age):-person(X,_,_,A,_), Age is A.
degree(X,D):-person(X,_,_,_,D).

degree_lower(A,B):-degreeList(A,B).
degree_lower(A,B):-degreeList(A,X),degree_lower(X,B).

height_verify(A,B):- (height(A,H1), height(B,H2)), H1>=H2.
age_verify(A,B):- (age(A,A1), age(B,A2)), (A1>=A2, A1=<A2+10).
degree_verify(A,B):- (degree(A,D1),degree(B,D2)), (D1\=D2->degree_lower(D2,D1);true).

dateable(Female,Male):-height_verify(Male,Female),age_verify(Male,Female),degree_verify(Male,Female).