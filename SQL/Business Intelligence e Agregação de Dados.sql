use ContosoRetailDW
/* Foco: Business Intelligence e Agregação de Dados Este arquivo demonstra a capacidade de transformar milhões de registros transacionais em indicadores de performance (KPIs) claros para a diretoria.

Competências Técnicas: Agregações complexas (SUM, COUNT, AVG), filtros de grupo (HAVING) e Joins de múltiplas tabelas (até 4 níveis de profundidade).

Destaques de Negócio:

Análise de faturamento e volume de vendas por canal e categoria.

Gestão de logística através do monitoramento de taxas de devolução por loja.

Identificação de perfis de consumo e produtos "Best Sellers" (Top 10).*/
select
	top(100)*
from
	FactSales

select
	top(100) *
from
	dimchannel

select
	sum(factsales.salesquantity) as 'Total Vendido',
	dimchannel.ChannelName as 'Canal de Vendas'
from
	factsales
left join dimchannel
on factsales.channelkey = dimchannel.ChannelKey
group by dimchannel.channelname
order by sum(factsales.salesquantity) desc

---------------------------------------------------------------------------------------------------------------------------------------------------------
select top(100) * from FactSales
select top(100) * from DimStore

select
	dimstore.StoreName as 'Loja',
	sum(factsales.salesquantity) as 'Total Vendido',
	sum(factsales.ReturnQuantity) as 'Total Devolvido'
from
	factsales
left join dimstore
on factsales.storekey = dimstore.storekey
group by dimstore.StoreName

---------------------------------------------------------------------------------------------------------------------------------------------------------
select top(100) * from FactSales
select top(100) * from DimDate

select
	round(sum(FactSales.SalesAmount),2) as 'Faturamento Total',
	dimdate.CalendarMonthLabel as 'Mês',
	dimdate.CalendarYear as 'Ano'
from
	FactSales
left join DimDate
on factsales.DateKey = DimDate.Datekey
group by dimdate.CalendarMonthLabel,dimdate.CalendarYear,dimdate.CalendarMonth
order by dimdate.CalendarMonth asc

---------------------------------------------------------------------------------------------------------------------------------------------------------
select top(100) * from FactSales
select top(100) * from DimProduct

select
	round(sum(factsales.SalesAmount),2) as 'Faturamento com Vendas',
	dimproduct.ProductName as 'Produto'
from
	factsales
left join DimProduct
on factsales.productkey = DimProduct.productkey
group by 
	DimProduct.ProductName

---------------------------------------------------------------------------------------------------------------------------------------------------------
select
	top (1)
	sum(factsales.SalesQuantity) as 'Quantidade Vendida',
	dimproduct.ColorName as 'Cor'
from
	factsales
left join DimProduct
on factsales.productkey = DimProduct.productkey
group by 
	DimProduct.ColorName
order by sum(factsales.SalesQuantity) desc

---------------------------------------------------------------------------------------------------------------------------------------------------------
select
	sum(factsales.SalesQuantity) as 'Quantidade Vendida',
	dimproduct.ColorName as 'Cor'
from
	factsales
left join DimProduct
on factsales.productkey = DimProduct.productkey
group by 
	DimProduct.ColorName
having sum(factsales.SalesQuantity) >= 3000000
order by sum(factsales.SalesQuantity) desc

---------------------------------------------------------------------------------------------------------------------------------------------------------
select
	sum(factsales.SalesQuantity) as 'Quantidade Vendida',
	DimProductCategory.ProductCategoryName as 'Categoria'
from
	factsales
left join DimProduct
on factsales.productkey = DimProduct.productkey
left join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
left join DimProductCategory
on DimProductsubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
group by 
	DimProductCategory.ProductCategoryName
order by sum(factsales.SalesQuantity) desc

---------------------------------------------------------------------------------------------------------------------------------------------------------
select
	top(5)
	sum(factonlinesales.SalesQuantity) as 'Quantidade Comprada',
	DimCustomer.FirstName + DimCustomer.MiddleName + DimCustomer.LastName as 'Nome Completo'
from
	FactOnlineSales
left join dimcustomer
on factonlinesales.CustomerKey = DimCustomer.CustomerKey
group by DimCustomer.FirstName + DimCustomer.MiddleName + DimCustomer.LastName
having DimCustomer.FirstName + DimCustomer.MiddleName + DimCustomer.LastName is not NULL
order by sum(factonlinesales.SalesQuantity) desc

---------------------------------------------------------------------------------------------------------------------------------------------------------
select
	top(10)
	Dimproduct.productname as 'Produto',
	sum(factonlinesales.SalesQuantity) as 'Quantidade Comprada'
from
	FactOnlineSales
left join dimcustomer
on factonlinesales.CustomerKey = DimCustomer.CustomerKey
left join DimProduct
on FactOnlineSales.ProductKey = DimProduct.ProductKey
WHERE DimCustomer.FirstName = 'Robert' and DimCustomer.MiddleName = 'C' and DimCustomer.LastName = 'Long'
group by DimProduct.ProductName
order by sum(factonlinesales.SalesQuantity) desc

---------------------------------------------------------------------------------------------------------------------------------------------------------

select top(10) * from FactOnlineSales
select top(10) * from DimCustomer

select
	sum(FactOnlineSales.SalesQuantity) as 'Total Comprado',
	DimCustomer.Gender as 'Sexo'
from
	FactOnlineSales
left join DimCustomer
on FactOnlineSales.CustomerKey = dimcustomer.CustomerKey
where DimCustomer.Gender is not NULL
group by DimCustomer.Gender

---------------------------------------------------------------------------------------------------------------------------------------------------------
select top(10) * from FactExchangeRate
select top(10) * from DimCurrency

select
	DimCurrency.CurrencyDescription as 'Moeda',
	round(avg(factexchangerate.AverageRate),2) as 'Taxa Média de Câmbio'
from
	FactExchangeRate
left join DimCurrency
on factexchangerate.CurrencyKey = DimCurrency.CurrencyKey
group by DimCurrency.CurrencyDescription
having round(avg(factexchangerate.AverageRate),2) between 10 and 100
order by round(avg(factexchangerate.AverageRate),2) desc

---------------------------------------------------------------------------------------------------------------------------------------------------------
select top(10) * from FactStrategyPlan
select top(10) * from DimScenario

select
	round(sum(FactStrategyPlan.Amount),2) as 'Total',
	DimScenario.ScenarioName as 'Cenário'
from
	factstrategyplan
left join dimscenario
on factstrategyplan.ScenarioKey = DimScenario.ScenarioKey
where DimScenario.ScenarioName in ('Actual', 'Budget')
group by DimScenario.ScenarioName

---------------------------------------------------------------------------------------------------------------------------------------------------------
select top(10) * from FactStrategyPlan
select top(10) * from DimDate

select
	DimDate.CalendarYear as 'Ano',
	round(sum(FactStrategyPlan.Amount),2) as 'Total'
from
	FactStrategyPlan
left join DimDate
on FactStrategyPlan.Datekey = DimDate.Datekey
group by DimDate.CalendarYear

---------------------------------------------------------------------------------------------------------------------------------------------------------
select top(10) * from DimProduct
select top(10) * from DimProductSubcategory

select
	count(DimProduct.ProductName) as 'Quantidade de Produtos',
	DimProductSubcategory.ProductSubcategoryName as 'Subcategoria'
from
	DimProduct
left join DimProductSubcategory
on dimproduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where dimproduct.ColorName = 'Silver' and dimproduct.BrandName = 'Contoso'
group by DimProductSubcategory.ProductSubcategoryName
order by count(DimProduct.ProductName) desc

---------------------------------------------------------------------------------------------------------------------------------------------------------
select
	dimproduct.BrandName as 'Marca',
	DimProductSubcategory.ProductSubcategoryName as 'Subcategoria',
	count(DimProduct.ProductName) as 'Quantidade de Produtos'
from
	DimProduct
left join DimProductSubcategory
on dimproduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
group by dimproduct.BrandName, DimProductSubcategory.ProductSubcategoryName
order by dimproduct.BrandName asc






