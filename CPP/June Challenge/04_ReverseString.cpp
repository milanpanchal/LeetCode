/*
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
*/
class Solution {
public:
    void swap(char & a, char&b)
    {
        char t =a;
        a=b;
        b=t;
    }
    void reverseString(vector<char>& s) {
        int len = s.size();
        int len2 = len>>1;
        len--;
        for (int i=0; i<len2; i++)
        {
            swap(s[i],s[len-i]);
        }
    }
};