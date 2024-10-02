class Solution:
    def isPalindrome(self, x: int) -> bool:
        str_number = str(x)
        resversed_number = str_number[::-1]
        if str_number == resversed_number:
            return True
        else:
            return False