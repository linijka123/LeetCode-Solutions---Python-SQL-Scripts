from typing import List
class Solution:
    def hardestWorker(self, n: int, logs: List[List[int]]) -> int:
       
         t = 0
         x = 0
         time = []
         idx = []
         for i, element in enumerate(logs):
            for j, wartosc in enumerate(element):
                 if j == 0:
                  idx.append(wartosc)                               
                 if j == 1:
                  y = abs(t - wartosc)                  
                  time.append(y) 
                  t = wartosc
          
         res = [[x,y] for x,y in zip(idx,time)]

         max_second = max([x[1] for x in res])
         filtered = [x for x in res if x[1] == max_second]
         result = min(filtered, key=lambda x: x[0])
         
         return result[0]