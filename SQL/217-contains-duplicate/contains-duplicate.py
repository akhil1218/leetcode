class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        d=set(nums)
        if len(d)==len(nums):
            return False
        else:
            return True