
# PHP

## Introdução

O PHP (**P**HP: **H**ypertext **P**reprocessor) é uma linguagem interpretada e livre (gratuita/de código aberto), 
amplamente utilizada (ocupando o **3º lugar** no ranking de 2015 da [RedMonk](http://redmonk.com/sogrady/2015/01/14/language-rankings-1-15/)), sendo 
mais adequada para o desenvolvimento web (1 a cada 3 websites a utilizam, segundo a [Netcraft](http://php.net/usage.php)).
Poderosa e de fácil aprendizado, seu código é mesclado com HTML, o que aumenta drasticamente a sua praticidade.

O código PHP é executado no servidor, não tendo o conhecimento do que acontece no cliente (navegador), exceto por meio solicitações deste. Sendo assim, o PHP é mais recomendado quando a geração de HTML ou a utilização de banco de dados são práticas frequentes para o website.

## Origens e Influências

A linguagem PHP foi criada por Rasmus Lerdorf com o nome de **P**ersonal **H**ome **P**age Tools em 1994, tendo seu código fonte liberado em 1995. Seu objetivo inicial era ser um pacote de programas para a geração de imagens com a finalidade de substituir scripts Perl utilizados por seu autor na criação de sua página pessoal.

Em 1997 foi lançada a segunda versão da linguagem, chamada de PHP/FI, pois trazia a ferramenta Forms Interpreter, um interpretador de comandos SQL. Após isso, Zeev Suraski desenvolveu o analisador de PHP 3 que contava com alguns recursos de orientação a objetos, entre eles herança e a possibilidade de implementar propriedades e métodos. Em seguida, Zeev (o mesmo da versão anterior) e Andi Gutman escreveram o PHP 4, dando maior poder à linguagem e mais recursos de orientação a objetos. O maior problema dessa versão foi a criação de cópias de objetos, onde a alteração em um objeto não afetava a sua cópia, algo que só foi corrigido na versão seguinte. Em junho de 2004 foi lançado o PHP 5, com um novo modelo de orientação a objetos, com maior desempenho e mais vantagens.
A versão oficial seguinte à da 5 foi a 7, pois funcionalidades esperadas para a versão 6 já estavam implementadas na versão 5.6 (com destaque para o suporte nativo ao Unicode), sem grandes mudanças. O PHP 7 teve sua versão de testes lançada em junho de 2015. As principais mudanças são a grande melhora no desempenho e a implementação do tratamento de exceções.


## Classificação

- Interpretada:
	- Durante a execução, um código intermediário é gerado, para em seguida ser transformado em código de máquina.
	
- Paradigmas: 
	- Procedural
	- Reflexiva
	- Funcional
	- Orientada a Objetos

- Facilmente Portável:
	- Pode ser utilizada nos mais diversos sistemas operacionais.
	
- Inferência de tipo e tipagem fraca:
	- Os tipos das variáveis não precisam ser declarados e podem mudar ao longo da execução.
	
- Open-source:
	- O código-fonte da linguagem está disponível na internet e qualquer um pode colaborar com seu desenvolvimento.


## Avaliação Comparativa
PHP tem uma sintaxe básica parecida com C++.

##### Fatorial em PHP:

          <?php
            function fatorial($n){
                if ($n==0 || $n==1)
                    return 1;
                else
                    return $n * fatorial($n-1);
            }
          
            echo "Digite seu nome: " . $_GET["nome"];
            echo "Digite o Numero que voce quer saber o fatorial (n <= 20): " . $_GET["n"];
            $n = intval($n)
            
            if ($n>20)
                echo "n deve ser menor ou igual a 20!";
            else{
                $resultado = fatorial($n);
                print $nome . ", o fatorial de " . $n . " eh " . $resultado;
            }
          ?>

##### Fatorial em C++
	#include <iostream>
	#include <stdio.h>
	using namespace std;
	
	int fatorial(int n);
	
	int main() {
		string nome;
		unsigned int n;
	    unsigned long long resultado;
	
	    cout << "Digite seu nome: ";
	    cin >> nome;
	    cout << "Digite o Numero que voce quer saber o fatorial (n <= 20): ";
	    cin >> n;
	    if (n>20)
	        cout << "n deve ser menor ou igual a 20!" << endl;
	    else{
	        resultado = fatorial(n);
	        cout << nome << ", o fatorial de " << n << " eh " << resultado << "." << endl;
	    }
	    
		return 0;
	}
	
	int fatorial(int n){
	    if (n==0 || n==1)
	        return 1;
	    else
	        return n * fatorial(n-1);
	}

Conforme pode ser visto, ambas são muito parecidas, onde a maior diferença fica por conta da tipagem e na entrada/saída de dados.

##### Readability:

Quanto a readability, C++ ganha devido à tipagem estática, onde o tipo de conteúdo é bem controlado e fácil de ser reconhecido, mas perde por não ter o '$' anterior ao nome das variáveis, o que as torna de identificação imediata. Apesar de diferentes, ambas tem praticamente a mesma readbility na entrada/saída de dados.

##### Writeability:

  Analisando a writeability, é óbvio que o PHP é bem mais direto, necessitando de menos linhas de código. Ganha também pela tipagem dinâmica, onde a digitação de muitos caracteres é economizada já que não é preciso definir tipos para as variáveis. Por outro lado, pode ser exaustivo ter que escrever "$" o tempo inteiro. Aqui, a entrada e saída de dados também é de writeablity equivalente em ambas.

##### Expressividade:
  Ambas são linguagens expressivas e, por não terem muitas diferenças sintáticas, vem do programador considerar uma mais expressiva do que a outra. Eu, particularmente, considero PHP mais expressiva, por poder ser mesclada com HTML e ter uma sintaxe alternativa à das chaves (ex: endif, endwhile).

## Conclusão

Apesar de não ser uma linguagem muito antiga, também não é nova, e os fatos de ser open-source e de ser largamente utilizada fez com que se tornasse rapidamente
madura.

Diversas implementações foram realizadas para dar suporte também a outros tipos de aplicação além da web, mas não é uma linguagem feita para isso, logo perde em
desempenho para outras concorrentes. Mesmo em relação à web, uma das maiores críticas ao PHP era seu desempenho ruim, o que a atualização 7 está vindo para tentar
corrigir.

Portanto, o aprendizado rápido, a fácil integração com a maioria dos bancos de dados atuais e a utilização absolutamente gratuita fazem com que o PHP seja, 
sem dúvidas, uma das melhores alternativas para o desenvolvimento web. O grande número de desenvolvedores PHP que existem só confirma essa afirmação.

## Bibliografia
* Site da linguagem: http://php.net
* Wikipedia: https://pt.wikipedia.org/wiki/PHP
* Tableless: http://tableless.com.br/10-novidades-do-php-7/
