class Solution:
    def removeDuplicates(self, s: str) -> str:
        stack = []
        for le in s:
            if stack and stack[-1] == le:
                stack.pop()
            else:
                stack.append(le)
        return "".join(stack)