class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int)-> None:
        index=m
        for j in range(n):
            nums1[index]=nums2[j]
            index=index+1
        for k in range(m+n):
            for i in range(k+1,m+n):
                if nums1[k]>nums1[i]:
                    t=nums1[k]
                    nums1[k]=nums1[i]
                    nums1[i]=t


        
        