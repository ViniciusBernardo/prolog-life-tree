# Árvore da vida em prolog

## Introdução

O objetivo do projeto é exibir as relações taxonômicas entre membros da classe das Aves. Entre as possibilidades, o programa pode exibir os níveis superiores e inferiores de um táxon, o ponto em comum entre dois táxons e toda a cadeia taxonômica registrada no banco.

Para mais informações: [Tree of life project](http://tolweb.org/Neornithes/15834)

## Execução

Para rodar o programa, clone o repositório e abra a plataforma swipl. Nela, importe os arquivos lifeTree.pl e rules.pl com o comando:
`[lifeTree, rules]`

Agora, utilize algumas das funções abaixo para exibir os resultados:

ancestrais_de(X,Y)
ancestral_comum(A,B,X)
irmao(X,Y)
descendente(X,Y)
descendentes_de(X,L)
ver_todos
ver_filhos(X)
ver_descendentes(X)

## Exemplo

`ancestral_comum(falcao, gaviao). /* Retorna telluraves */` </br>
`irmao(pinguim, pelicano) /* Retorna true */`

