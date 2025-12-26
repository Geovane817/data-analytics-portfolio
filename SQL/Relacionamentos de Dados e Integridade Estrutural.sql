use ContosoRetailDW

/*Foco: Relacionamentos de Dados e Integridade Estrutural Um mergulho profundo na arquitetura do banco de dados Contoso, focando em como conectar diferentes silos de informação para uma visão 360º da operação.

Competências Técnicas: Domínio de INNER JOIN, LEFT JOIN e RIGHT JOIN para mapear dependências.

Destaques de Negócio:

Mapeamento geográfico de performance (Continente vs. País vs. Loja).

Auditoria de catálogo: Identificação de subcategorias de produtos sem estoque ou vendas (análise de "Gaps").

Cruzamento de dados de marketing e promoções com o faturamento real.*/

-- 1.Utilize  o  INNER  JOIN  para  trazer  os  nomes  das  subcategorias  dos  produtos,  da  tabela DimProductSubcategory para a tabela DimProduct.
select
	*
from
	DimProduct

select
	top(3) *
from
	DimProductSubcategory

select
	DimProduct.ProductName as 'Produto',
	DimProduct.ProductKey as 'ID',
	DimProductSubcategory.ProductSubcategoryName as 'Subcategoria'
from
	DimProduct
inner join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

-- 2. Identifique    uma    coluna    em    comum    entre    as    tabelas    DimProductSubcategory    e DimProductCategory.   Utilize   essa   coluna   para   complementar   informações   na   tabela DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.
select
	*
from
	DimProductSubcategory

select
	*
from
	DimProductCategory

select
	*
from
	DimProductSubcategory
left join DimProductCategory
on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

-- 3. Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados (de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas: StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT JOIN neste exercício.
select
	*
from
	DimStore

select
	*
from
	DimGeography

select
	dimstore.StoreKey as 'ID Loja', 
	dimstore.StoreName 'Loja', 
	dimstore.EmployeeCount 'Quantidade de Funcionários', 
	DimGeography.ContinentName as 'Continente',
	dimgeography.RegionCountryName as 'País'
from
	DimStore
left join DimGeography
on dimstore.geographykey = DimGeography.GeographyKey

-- 4. Complementa a tabela DimProduct com a informação de ProductCategoryDescription. Utilize o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.
select
	*
from
	DimProduct

select
	*
from
	DimProductSubcategory

select
	*
from
	DimProductCategory

select
	dimproduct.ProductName,
	DimProduct.ProductKey,
	DimProduct.Manufacturer,
	dimproductcategory.ProductCategoryDescription,
	dimproductsubcategory.productcategorykey
from
	DimProduct
left join DimProductSubcategory
on dimproduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
left join DimProductCategory
on DimProductSubcategory.productcategorykey = dimproductcategory.productcategorykey

/* 5. A  tabela  FactStrategyPlan  resume  o  planejamento  estratégico  da  empresa.  Cada  linha representa um montante destinado a uma determinada AccountKey.
a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela. 
b) Faça  um  INNER  JOIN  para  criar  uma  tabela  contendo  o  AccountName  para  cada 
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
•    StrategyPlanKey
•    DateKey
•    AccountName
•    Amount */

-- a.
select
	top(100) *
from
	FactStrategyPlan
-- b.
select
	*
from
	DimAccount

select
	FactStrategyPlan.StrategyPlanKey,
    FactStrategyPlan.DateKey,
    dimaccount.AccountName,
    FactStrategyPlan.Amount
from
	FactStrategyPlan
inner join DimAccount
on FactStrategyPlan.AccountKey = DimAccount.AccountKey

/* 6. Vamos  continuar  analisando  a  tabela  FactStrategyPlan.  Além  da  coluna  AccountKey  que identifica o tipo de conta, há também uma outra coluna chamada ScenarioKey. Essa coluna possui a numeração que identifica o tipo de cenário: Real, Orçado e Previsão.
Faça um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
•    StrategyPlanKey
•    DateKey
•    ScenarioName 
•    Amount */
select
	top(20) *
from
	FactStrategyPlan

select
	top(20) *
from
	DimAccount

select
	top(20) *
from
	DimScenario

select
	FactStrategyPlan.StrategyPlanKey,
	FactStrategyPlan.DateKey,
	DimScenario.ScenarioKey,
	round(FactStrategyPlan.Amount,2) as 'Quantidade'
from 
	FactStrategyPlan
inner join DimScenario
on FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey

-- 7. Algumas  subcategorias  não  possuem  nenhum  exemplar  de  produto.  Identifique  que subcategorias são essas.
select
	top(10) *
from
	DimProduct

select
	*
from
	DimProductSubcategory

SELECT
    COUNT(DimProduct.ProductSubcategoryKey) AS ProductCount,
    DimProductSubcategory.ProductSubcategoryName,
    DimProductSubcategory.ProductSubcategoryKey
FROM
    DimProductSubcategory
LEFT JOIN DimProduct
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
GROUP BY
    DimProductSubcategory.ProductSubcategoryName,
    DimProductSubcategory.ProductSubcategoryKey
HAVING
    COUNT(DimProduct.ProductSubcategoryKey) = 0;

-- Outra forma:
select
	--dimproduct.ProductName,
	--DimProductSubcategory.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
from
	DimProduct
right join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where ProductName is null

-- 8. A tabela abaixo mostra a combinação entre Marca e Canal de Venda, para as marcas Contoso, Fabrikam e Litware. Crie um código SQL para chegar no mesmo resultado.
select
	top(2) *
from
	dimproduct

select
	top(2) *
from
	factsales

select
	top(2) *
from
	dimchannel

SELECT
    distinct(dimproduct.brandname) as 'Marca',
    dimchannel.channelname as 'Canal'
FROM
    dimproduct
LEFT JOIN factsales
    ON dimproduct.productkey = factsales.productkey
LEFT JOIN dimchannel
    ON factsales.channelkey = dimchannel.channelkey
where brandname in ('Contoso','Fabrikam','Litware')

/* 9. Neste  exercício,  você  deverá  relacionar  as  tabelas  FactOnlineSales  com  DimPromotion. Identifique  a  coluna  que  as  duas  tabelas  têm  em  comum  e  utilize-a  para  criar  esse relacionamento.
Retorne uma tabela contendo as seguintes colunas:
•    OnlineSalesKey
•    DateKey
•    PromotionName
•    SalesAmount
A  sua  consulta  deve  considerar  apenas  as  linhas  de  vendas  referentes  a  produtos  com desconto (PromotionName <> ‘No Discount’). Além disso, você deverá ordenar essa tabela de acordo com a coluna DateKey, em ordem crescente. */
select
	top(5) *
from
	factonlinesales

select
	top(5) *
from
	dimpromotion

select
	factonlinesales.onlinesaleskey as 'ID Vendas Online',
	factonlinesales.datekey as 'Data',
	dimpromotion.promotionname as 'Promoção',
	round(factonlinesales.salesamount,2) as 'Quantidade de Vendas'
from
	factonlinesales
left join dimpromotion
on factonlinesales.promotionkey = dimpromotion.promotionkey
where dimpromotion.PromotionName <> 'No Discount'
order by DateKey asc

/* 10. A tabela abaixo é resultado de um Join entre a tabela FactSales e as tabelas: DimChannel, DimStore e DimProduct.
Recrie esta consulta e classifique em ordem crescente de acordo com SalesAmount. */
select
	top(5) *
from
	factsales

select
	top(5) *
from
	dimchannel

select
	top(5) *
from
	dimstore

select
	top(5) *
from
	dimproduct

select top(100)
	factsales.saleskey as 'ID Venda',
	dimchannel.channelname as 'Canal',
	dimstore.storename as 'Loja',
	dimproduct.productname as 'Produto',
	round(factsales.salesamount,2) as 'Quantidade de Venda'
from
	factsales
left join dimchannel
on factsales.channelkey = dimchannel.channelkey
left join dimstore
on factsales.storekey = dimstore.storekey
left join dimproduct
on factsales.productkey = dimproduct.productkey
order by round(factsales.salesamount,2) desc
