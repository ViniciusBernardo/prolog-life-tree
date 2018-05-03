ancestrais_de(X,Y) :- ancestral(X,Y) ; ancestral(X,Z) , ancestrais_de(Z,Y).
ancestral_comum(A,B,X) :- ancestrais_de(A,X) , ancestrais_de(B,X) ,!.
