class Solution:
    def finalPositionOfSnake(self, n: int, commands: List[str]) -> int:
        matrix = [[(i*n + j) for j in range(n)] for i in range(n)]
        row = 0
        column = 0
        
        for i in range(0,len(commands)):
            if commands[i] == 'DOWN':
                row+=1
            if commands[i] == 'RIGHT':
                column+=1
            if commands[i] == 'LEFT':
                column-=1
            if commands[i] == 'UP':
                row-=1
        
        return matrix[row][column]