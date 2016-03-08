### Trabalho 00 --- Um texto pessoal formatado em Markdown
### UERJ -- 2016.1 -- 09/03/2016
#
---
> Aluno: Leonardo Lima Marinho  
> Disciplina: Estruturas de Linguagens  
> Professor: Francisco Santanna
---
#
## Uma história de um estagiário de TI
Na segunda metade de setembro de 2015 comecei a realizar um estágio em um projeto, dentro da própria universidade. Meu orientador era -- e ainda é -- o professor Guilherme Mota, que foi meu professor de Linguagem de Programação I. Inicialmente, ele me colocou para trabalhar com o professor Leandro Marzulo, que atualmente é meu professor de Sistemas Operacionais I. 

Como o projeto envolve computação de alto desempenho, foi definido que montaríamos um cluster para processamento paralelo. Essa montagem ficou a cargo do professor Leandro, e este me explicou como e o quê deveria ser feito, me dando total suporte enquanto eu deveria realizar o trabalho propriamente dito (configuração das máquinas e alocação no rack). Além disso, ele me passou o contato de vários técnicos do LABIME que também poderiam me auxiliar.

Dadas as orientações, comecei meu trabalho. O cluster deveria ter, ao todo, 11 computadores, sendo um chamado Frontend, que coordenaria os outros, e 10 Nodes, que fariam o processamento em si. Meu trabalho seria: configurar o Frontend e sincronizá-lo com o Node 1, clonar esse Node 1 para os outros 9 nodes, e enfim realizar a montagem das máquinas no rack em que ficariam. 

Como substituí um outro estagiário, boa parte da configuração do Frontend já estava feita, então aparentemente deveria ser rápido terminá-la e configurar o Node 1 do zero. Apenas aparentemente. 

Apesar de eu nunca ter tido nenhuma experiência com servidores e, muito menos com Ubuntu Server, todas as configurações foram feitas em menos de 2 dias, exceto a do 
~~maldito~~ LDAP, um gerenciador de diretórios.

O problema era que tudo estava certo: eu procurei o antigo estagiário e ele me passou os links de todos os tutoriais que havia utilizado para a configuração do LDAP; eu os refiz passo a passo mais de 10 vezes, mas nada de funcionar. Formatei o Node 1 (que eu já sabia reconfigurar rapidamente, pois fiz tudo sozinho) mais de 5 vezes, e nada do problema mudar. 

Desde o segundo dia em que eu não havia conseguido resolver esse problema, chamei, um por um, todos os 5 técnicos que estavam a minha disposição para ajudar (todos com formação na área de redes). Foram mais de 3 semanas, várias visitas de cada um deles (que já haviam realizado essa mesma configuração em outras oportunidades, utilizando os mesmos tutoriais) e LDAP não funcionava. 

Quando estava prestes a desistir, ouvi de um deles -- que, por acaso, era o único doutorando dentre eles -- a melhor sugestão que podia, e que vou levar para a minha vida: "Formata essa merd*!" <apontando para o Frontend>.

Seguindo sua valiosa dica, em 1 dia reconfigurei o Frontend (pela primeira vez, pois o serviço havia sido ~~mal~~ feito pelo estagiário anterior) e, para a surpresa de todos, tudo funcionou perfeitamente, incluindo o LDAP.

Portanto, 3 semanas de trabalho poderiam ter sido poupadas se eu simplesmente tivesse recomeçado do nada. Com isso, aprendi que, às vezes (principalmente quando não foi você que fez todo o trabalho), a melhor solução é não tentar aproveitar ou entender o que outros já fizeram, mas sim fazer por si mesmo. (Se a tarefa não for grande, é claro). 

Afinal,  já dizia o ditado:
> Se quer algo bem feito, faça você mesmo.








