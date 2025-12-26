/*Foco: T-SQL Scripting e Programação Procedural Este script vai além de consultas simples, utilizando lógica de programação dentro do SQL para criar automações e relatórios dinâmicos.

Competências Técnicas: Declaração e manipulação de variáveis (DECLARE, SET), tipos de dados, funções de conversão (CAST, FORMAT) e lógica condicional.

Destaques de Negócio:

Criação de scripts dinâmicos para filtragem de categorias sob demanda.

Automação de strings de texto para comunicação interna (Ex: Relatório de lojas fechadas).

Cálculos matemáticos e financeiros processados diretamente no servidor de dados.*/


/* 1. Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7
a)   Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame essa variável de soma.
b)   Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4. Chame essa variável de subtracao.
c)   Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o valor4. Chame essa variável de multiplicacao.
d)   Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.
e)   Arredonde o resultado da letra d) para 2 casas decimais.*/
declare @valor1 float = 10, @valor2 float = 5, @valor3 float = 34, @valor4 float = 7
-- a.
declare @sum int
set @sum = @valor1 + @valor2
select @sum as 'Soma'
-- b.
declare @sub int
set @sub = @valor3 + @valor4
select @sub as 'Subtração'
-- c.
declare @mult int
set @mult = @valor1 * @valor4
select @mult as 'Multiplicação'
-- d.
declare @div float
set @div = @valor3 / @valor4
select @div as 'Divisão'
-- e.
select round(@div,2) as 'Divisão'

/* 2. Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser especificado.
a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.
b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12. 
c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre ‘quantidade’ e ‘preco’. 
e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT.*/
-- a.
declare @produto varchar(50) = 'Celular'
-- b.
declare @quantidade float = 12
-- c.
declare @preco float = 9.99
-- d.
declare @faturamento int = @quantidade * @preco
-- e.
select @produto as 'Produto', @quantidade as 'Quantidade', @preco as 'Preço', @faturamento as 'Faturamento'

/* 3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de usuários. Em resumo, esses dados são:
- Nome do usuário
- Data de nascimento
- Quantidade de pets que aquele usuário possui
Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este usuário. Para simular estes dados, crie 3 variáveis, chamadas: nome, data_nascimento e num_pets. Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.
O resultado final a ser alcançado é mostrado no print abaixo:
Dica: você precisará utilizar as funções CAST e FORMAT para chegar no resultado. */
declare @nome varchar(50) = 'André',
		@data_nascimento datetime = '10/02/1998',
		@num_pets int = 2

select 'Meu nome é ' + @nome + ', nasci em ' + format(@data_nascimento, 'dd/MM/yyyy') + ' e tenho ' + cast(@num_pets as varchar (200)) + ' pets.'

/* 4. Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as lojas da empresa. 
A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio é descobrir o nome dessas lojas que fecharam no ano de 2008, para que você possa entender o motivo e mapear planos de ação para evitar que outras lojas importantes tomem o mesmo caminho.
O seu resultado deverá estar estruturado em uma frase, com a seguinte estrutura:
‘As lojas fechadas no ano de 2008 foram:  ’ + nome_das_lojas
Obs: utilize o comando PRINT (e não o SELECT!) para mostrar o resultado. */
DECLARE @ano_fechamento INT = 2008,
        @lista_lojas VARCHAR(MAX) = '';

SELECT
    @lista_lojas = @lista_lojas 
                 + CASE WHEN @lista_lojas = '' THEN '' ELSE ', ' END
                 + StoreName
FROM DimStore
WHERE YEAR(CloseDate) = @ano_fechamento
ORDER BY StoreName;

PRINT 'As lojas fechadas no ano de ' 
      + CAST(@ano_fechamento AS VARCHAR)
      + ' foram: ' 
      + @lista_lojas;

/* 5. Você precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para uma subcategoria específica: ‘Lamps’.
Utilize o conceito de variáveis para chegar neste resultado. */
declare @subcategoria varchar(max) = 'Lamps'

select
    dimproduct.ProductName as 'Nome',
    ClassName as 'Classe',
    BrandName as 'Marca'
from
    DimProduct
left join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where DimProductSubcategory.ProductSubcategoryName = @subcategoria

/*select
    distinct(ProductSubcategoryName),
    ProductSubcategoryKey
from
    DimProductSubcategory*/


