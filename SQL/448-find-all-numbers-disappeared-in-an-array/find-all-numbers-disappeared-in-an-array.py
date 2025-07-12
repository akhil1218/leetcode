class Solution:
    def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
        l=len(nums)
        l2=set(nums)
        newl=[]
        for i in range(1,l+1):
            if i not in l2:
                newl.append(i)
        return newl

        