--Dla roku 2015, przygotowaæ w bazie TRUczelnia zestawienie które dla ka¿dego miesi¹ca poda liczbê dni w których nie wystawiono ¿adnej oceny niedostatecznej
WITH Daty as
(
	Select cast('2015-01-01' as date) as Dzien
	union all
	Select dateadd(day,1,Dzien) as Dzien
	from Daty
	where Dzien<'2015-12-31'
), zOceniami as
(
	select  Dzien, DataOceny, Ocena
	from Daty as D  inner join Oceny as O on D.Dzien = O.DataOceny
), DatyZDwojkami as
(
	select count(*) as czyNiedostateczna, Dzien
	from zOceniami
	where Ocena = 2 
	group by Dzien
), DzienZDzien as
(
	select D.Dzien, (DD.Dzien) as Dzien2 
	from Daty as D  left join DatyZDwojkami as DD on D.Dzien = DD.Dzien
), ZlyDzienZNULL as 
(
	select Dzien, count(case when Dzien is not null and Dzien2 is null then 1 end) as Result
	from DzienZDzien
	group by Dzien
)
select *
from ZlyDzienZNULL
option(maxrecursion 365)