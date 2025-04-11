class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        if len(matrix)>0:
            for i in range(len(matrix)):
                if target>max(matrix[i]):
                    if i+1==len(matrix):
                        return False
                    continue
                else:
                    if target in matrix[i]:
                        return True
                    return False
        else:
            return False
