##   Coin Change 2
#
# https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3353/
#
# ---
#
#### Problem Statement:
#
# You are given coins of different denominations and a total amount of money. Write a function to compute the number of combinations that make up that amount. You may assume that you have infinite number of each kind of coin.
#
#
#### Example 1:
#
# ```
# Input: amount = 5, coins = [1, 2, 5]
# Output: 4
# Explanation: there are four ways to make up the amount:
# 5=5
# 5=2+2+1
# 5=2+1+1+1
# 5=1+1+1+1+1
# ```
# 
# ### Example 2:
#
# ```
# Input: amount = 3, coins = [2]
# Output: 0
# Explanation: the amount of 3 cannot be made up just with coins of 2.
# ```
# ### Example 3:
#
# ```
# Input: amount = 10, coins = [10]
# Output: 1
# ```
#
# ### Notes:
# You can assume that
#
#
# + 0 <= amount <= 5000
# + 1 <= coin <= 5000
# + the number of coins is less than 500
# + the answer is guaranteed to fit into signed 32-bit integer
#

class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        def count(S, m, n):   
            # table[i] will be storing the number of solutions for 
            # value i. We need n+1 rows as the table is constructed 
            # in bottom up manner using the base case (n = 0) 
            # Initialize all table values as 0 
            table = [0 for k in range(n+1)] 

            # Base case (If given value is 0) 
            table[0] = 1

            # Pick all coins one by one and update the table[] values 
            # after the index greater than or equal to the value of the 
            # picked coin 
            for i in range(0,m): 
                for j in range(S[i],n+1): 
                    table[j] += table[j-S[i]] 

            return table[n] 
        return count(coins, len(coins), amount)
