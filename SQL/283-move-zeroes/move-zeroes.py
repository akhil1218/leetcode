class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        for i in range(len(nums)):
            for j in range(i+1,len(nums)):
                if nums[i]==0:
                    if nums[j]!=0:
                        t=nums[i]
                        nums[i]=nums[j]
                        nums[j]=t
                        break
                    else:
                        j+=1
                else:
                        break

                    
        