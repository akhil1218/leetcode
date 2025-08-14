class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        res=defaultdict(list)
        for i in strs:
            sorteds=''.join(sorted(i))
            res[sorteds].append(i)
        return list(res.values())
        