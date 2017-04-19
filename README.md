# Implementação IBL 1 e IBL 2

**Thiago Senhorinha Rose (12100774)**

## Pré-requisitos

Versão do **R 3.2+**

Esse trabalho foi desenvolvido utilizando a linguagem de programação R e utiliza as bibliotecas ```readxl``` para leitura de arquivos xlsx e```hashmap``` para utilizar hashmap Instale os pacotes no R com o seguinte comando:

```r
install.packages(c("readxl", "hashmap"), dependencies=TRUE)
```

## Como executar?

1. Primeirmanete é preciso entrar no modo de execução de scripts R na pasta raiz do projeto (/ibl)
2. Execute o arquivo do algoritmo escolhido (ibl 1 ou ibl 2) com o comando abaixo:

```r
source('ibl_1.R') # Para executar o algoritmo IBL 1
source('ibl_2.R') # Para executar o algoritmo IBL 2
```

**Obs:** Por padrão o dataset escolhido foi o da Iris porém é possível trocar de dataset alterando a variável ```initialDataset```  do arquivo escolhido (*ibl_1.R* ou *ibl_2.R*). Datasets disponíveis:

```r
IrisDataset$new()
CarsDataset$new()
CancerDataset$new()
DoubleSpiral$new()
BankTwoDimensionsDataset$new()
```

Exemplo de troca:

```r
initialDataset = CarsDataset$new() # Utilizando outro dataset
. # linha 4
. # linha 5
. # ...

```
