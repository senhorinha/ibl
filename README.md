# Implementação IBL 1 e IBL 2

**Thiago Senhorinha Rose (12100774)**

## Pré-requisitos

Esse trabalho foi desenvolvido utilizando a linguagem de programação R e utiliza as bibliotecas ```readxl``` para leitura de arquivos xlsx, ```hashmap``` para utilizar hashmap e ```deldir``` para triangulação Delaunay. Instale os pacotes no R com o seguinte comando:

```r
install.packages(c("readxl", "hashmap", "deldir"), dependencies=TRUE)
```

## Como executar?

1. Primeirmanete é preciso entrar no modo de execução de scripts R na pasta raiz do projeto (/ibl)
2. Execute o arquivo do algoritmo escolhido (ibl 1 ou ibl 2) com o comando abaixo:

```r
source('ibl_1.R') # Para executar o algoritmo IBL 1
source('ibl_2.R') # Para executar o algoritmo IBL 2
```

**Obs:** Por padrão o dataset escolhido foi o da Iris porém é possível trocar de dataset alterando a linha 3 do arquivo escolhido (*ibl_1.R* ou *ibl_2.R*). Exemplo de troca:

```r
source('dependencies.R')

dataset = CancerDataset$new() # <- Utilizando outro dataset
. # linha 4
. # linha 5
. # ...

```
