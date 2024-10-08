--Zadanie 1
--W bazie danych TRUczelnia wyszuka� studentki, 
--kt�re w roku 2013 mia�y jedn� z 10 najwy�szych �rednich ocen na uczelni 
--a jednocze�nie nie mia�y najwy�szej �redniej w swojej grupie szkoleniowej

With SRG as
(
     Select S.IdStudenta  ,
	                 DENSE_RANK() over (
					                    order by avg(ocena) desc) as rk
					 , avg(Ocena) as Sr
	 from oceny as O join Studenci as S on  S.IdStudenta = O.IdStudenta
	 where DataOceny  between '20130101' and '20131231' and S.CzyKobieta = 1
	 group by S.IdStudenta
),   NGS as
(
     Select S.IdStudenta , IdGrupy ,
	                 DENSE_RANK() over (partition by idgrupy
					                    order by avg(ocena) desc) as rk2
					 , avg(Ocena) as Sr
	 from oceny as O join Studenci as S on  S.IdStudenta = O.IdStudenta
	 where DataOceny  between '20130101' and '20131231' and S.CzyKobieta = 1
	 group by S.IdStudenta , IdGrupy
) 
Select S.Nazwisko , S.Imie , S.Pesel
from Studenci as S join Oceny O on  S.IdStudenta = O.IdStudenta
Where O.DataOceny between '20130101' and '20131231' 
                  and S.IdStudenta  in (Select IdStudenta from SRG where rk < 10)
	              and S.IdStudenta in (Select IdStudenta from NGS where rk2 != 1)
group by S.Nazwisko , S.Imie , S.Pesel