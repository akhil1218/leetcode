class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        r=[]
        count=0
        for i in range(len(nums)):
            if nums[i]==1:
                count+=1
            else:
                r.append(count)
                count=0
        r.append(count)
        return max(r)

        