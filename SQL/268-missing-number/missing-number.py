class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        n=len(nums)
        sum=0
        for i in range(n):
            sum+=nums[i]
        s_t=(n*(n+1))/2
        return int(s_t-sum)