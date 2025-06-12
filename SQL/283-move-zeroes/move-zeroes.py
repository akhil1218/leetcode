class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        i=0
        for j in range(len(nums)):
            if j+1<len(nums):
                if nums[j]==0:
                    if nums[j+1]==0:
                        pass
                    else:
                        t=nums[j]
                        nums[i]=nums[j+1]
                        nums[j+1]=t
                        i+=1
                else:
                    i+=1
                    pass
                


                    
        