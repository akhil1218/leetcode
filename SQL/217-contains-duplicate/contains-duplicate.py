class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        d_nums=set(nums)
        if len(d_nums)!=len(nums):
            return True
        return False