/*
## Power of Two
#  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3354/
#
# ---
#
#### Problem Statement:
# 
# Given an integer, write a function to determine if it is a power of two.
#
#### Example:
#
# ```
# Input: 1
# Output: true
# Explanation: 20 = 1
#
# Input: 16
# Output: true
# Explanation: 24 = 16
#
# Input: 218
# Output: false
#
*/
class Solution {
public:
    bool isPowerOfTwo(int n) {
        if (n <= 0)
            return false;
        return (n & (n-1)) == 0;
    }
};
