class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        count = 0
        for x in reversed(s):
            if x != " ":
                count+=1
            if x == " " and count >= 1:
                break
            if x == " ":
                continue
        return count