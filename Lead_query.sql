--W bazie danych TRUczelnia wybraæ studentów (Nazwisko,imiê ,pesel i dataurodzenia, data poczatkowa i data koñcowa),
-- którzy przez trzy dni z rzêdu otrzymali co najmniej jedn¹ ocene niedostateczn¹.

WITH CTE as
(
      Select  S.IdStudenta,
	  lead(O.DataOceny,0) over (partition by S.idStudenta order by O.DataOceny) as PierwszaData, 
	  lead(O.DataOceny,1) over (partition by S.idStudenta order by O.DataOceny) as DrugaData, 
	  lead(O.DataOceny,2) over (partition by S.idStudenta order by O.DataOceny) as TrzeciaData,
	  S.Nazwisko,S.Imie,O.DataOceny,S.Pesel,S.DataUrodzenia
	  from Studenci as S join Oceny as O on S.IdStudenta = O.IdStudenta
	  where O.Ocena = 2
) , CTE2 as
(
      Select DATEADD(day,0,PierwszaData) as Wynik1, DATEADD(day,-1,DrugaData) as Wynik2,DATEADD(day,-2,TrzeciaData) as Wynik3,
	  Imie,Nazwisko,Pesel, DataUrodzenia, DataOceny
	  from CTE
)
Select * 
from CTE2
where Wynik1 = Wynik2 and Wynik2 = Wynik3