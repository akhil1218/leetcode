class Solution:
    def findNumbers(self, nums: List[int]) -> int:
        count=0
        for i in nums:
            count2=0
            n=i
            while n>0:
                j=n%10
                n=n//10
                count2+=1
            if count2%2==0:
                count+=1
        return count