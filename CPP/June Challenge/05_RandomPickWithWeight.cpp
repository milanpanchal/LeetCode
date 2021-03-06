#
## Random Pick with Weight
#
#https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3351/
#
# ---
#
#### Problem Statement:
#
# Given an array `w` of positive integers, where `w[i]` describes the weight of index `i`, write a function `pickIndex` which randomly picks an index in proportion to its weight.
#
#### Example:
#
# ```
# Input:
# ["Solution","pickIndex"]
# [[[1]],[]]
# Output: [null,0]
#
# 
# Input:
# ["Solution","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex"]
# [[[1,3]],[],[],[],[],[]]
# Output: [null,0,1,1,1,0]
#
# ```
# 
# ### Notes:
# + 1 <= w.length <= 10000
# + 1 <= w[i] <= 10^5
# + pickIndex will be called at most 10000 times.
# 
# #### Explanation of Input Syntax:
#
# The input is two lists: the subroutines called and their arguments. Solution's constructor has one argument, the array w. pickIndex has no arguments. Arguments are always wrapped with a list, even if there aren't any.
#
# https://leetcode.com/problems/random-pick-with-weight/discuss/671674/Explanation-and-Swift-Solution%3A-Random-Pick-with-Weight
# 
# 

class Solution:
    def __init__(self, w:List[int]):
	    self.pickIndex = lamda:random.choices(range(len(w)), weights=w)[0]