ancestrais_de(X):- ancestral(X,Y),
                   write(Y), nl,fail;
                   ancestral(X,Z),
                   ancestrais_de(Z,Y),
                   write(Y), nl,fail.

ancestrais_de(X):- ancestral(X, _).

ancestral_comum(A,B,X):- ancestrais_de(A,X),
                         ancestrais_de(B,X) ,!.

irmaos(X):- ancestral(X,Z),
            ancestral(Y,Z),
            X \== Y,
            write(Y), nl, fail.

irmaos(X):- ancestral(X,Z),
           ancestral(Y,Z),
           X \== Y.

filhos(X):- ancestral(Descendente, X),
            write(Descendente),nl, fail.
filhos(X):- ancestral(_, X).

descendente(X,Y):- ancestral(X,Y).
descendente(X,Y):- ancestral(X,Z),
                   descendente(Z,Y).

descendentes_de(X,L):- findall(A, descendente(A,X), L).

descendentes_de(X):- ancestral(Descendente, _),
                      descendente(Descendente,X),
                      write(Descendente), nl,fail.

descendentes_de(X):- ancestral(_, X).

ver_todos:- ancestral(Descendente, Pai),
            write(Descendente),
            write(' DESCENDENTE DE '),
            write(Pai),nl,nl,fail.
ver_todos.

remover(X):- retract(ancestral(X, _)),
             remover(X).
remover(_).

salvar(X, Y):- remover(X),
               assertz(ancestral(X, Y)).

% ==================================================

main:- write("Bem Vindo a Árvore da Vida"), nl, nl,
       write("O que você deseja saber?"), nl,
       write("1. Ancestral comum"),nl,
       write("2. Ancestrais"),nl,
       write("3. Irmãos"),nl,
       write("4. Descendentes"),nl,
       write("5. Filhos"),nl,
       write("6. Adicionar"),nl,
       write("7. Remover"),nl,
       write("8. Ver toda a arvore"), nl,
       write("9. Sair"), nl,
       read(Opcao),
       escolha(Opcao), nl, nl, nl,
       main.

escolha(1):- write("Nome do primeiro animal:"), nl,
             read(Animal_1),
             write("Nome do segundo animal:"), nl,
             read(Animal_2),
             ancestral_comum(Animal_1, Animal_2, X),
             write("O ancestral comum eh: "),
             write(X);
             write("Nao possuem ancestral_comum.").

escolha(2):- write("Nome do animal:"), nl,
             read(Animal),
             ancestrais_de(Animal);
             write("Nao possui ancestral conhecido.").

escolha(3):- write("Nome do animal:"), nl,
             read(Animal),
             irmaos(Animal);
             write("Este animal nao possui irmaos").

escolha(4):- write("Nome do animal:"), nl,
             read(Animal),
             descendentes_de(Animal);
             write("Este animal nao tem descendentes").

escolha(5):- write("Nome do animal:"), nl,
             read(Animal),
             filhos(Animal);
             write("Este animal nao possui filhos").

escolha(6):- write("Novo animal:"), nl,
             read(Animal),
             write("Ancestral:"), nl,
             read(Pai),
             salvar(Animal, Pai),
             write(Animal),
             write(" salvo como descendente de "),
             write(Pai);
             write("Falha ao salva animal").

escolha(7):- write("Remover animal:"), nl,
             read(Animal),
             remover(Animal),
             write(Animal),
             write(" excluido da base de dados.");
             write("Falha ao remover animal").

escolha(8):- ver_todos.

escolha(9):- write("Tchau!"),
             fail.
