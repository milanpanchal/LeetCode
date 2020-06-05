## Reverse String
#  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3350/
#
# ---
#
#### Problem Statement:
#Write a function that reverses a string. The input string is given as an array of characters char[].
#
#Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
#
#You may assume all the characters consist of printable ascii characters.
#
# 
#
#Example 1:
#
#Input: ["h","e","l","l","o"]
#Output: ["o","l","l","e","h"]
#
#Example 2:
#
#Input: ["H","a","n","n","a","h"]
#Output: ["h","a","n","n","a","H"]
#
#

class Solution:
    def reverseString(self, s: List[str]) -> None:
        lenght = len(s)
        len2 = lenght//2
        lenght -= 1
        for i in range(len2):
            (s[i],s[lenght-i])= (s[lenght-i],s[i])
