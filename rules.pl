ancestrais_de(X,Y):- ancestral(X,Y);
                     ancestral(X,Z),
                     ancestrais_de(Z,Y).

ancestral_comum(A,B,X):- ancestrais_de(A,X),
                         ancestrais_de(B,X) ,!.

irmao(X,Y):- ancestral(X,Z),
             ancestral(Y,Z).

descendente(X,Y):- ancestral(X,Y).
descendente(X,Y):- ancestral(X,Z),
                   descendente(Z,Y).

descendentes_de(X,L):- findall(A, descendente(A,X), L).

ver_todos:- ancestral(Descendente, Pai),
            write(Descendente),
            write(' descende de '),
            write(Pai),nl,fail.

ver_filhos(X):- ancestral(Descendente, Pai),
                X=Pai,
                write(Descendente),
                write(' descende de '),
                write(Pai),nl,fail.

ver_descendentes(X):- ancestral(Descendente, Pai),
                      descendente(Descendente,X),
                      write(Descendente),
                      write(' descende de '),
                      write(Pai),nl,fail.
