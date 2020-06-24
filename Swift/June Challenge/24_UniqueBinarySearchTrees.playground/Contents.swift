/*:
# Unique Binary Search Trees
 
https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/542/week-4-june-22nd-june-28th/3370/

 ---

### Problem Statement:

 Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

### Example:

 ```
 Input: 3
 Output: 5

 Given n = 3, there are a total of 5 unique BST's:

 1         3     3      2      1
  \       /     /      / \      \
   3     2     1      1   3      2
  /     /       \                 \
 2     1         2                 3

 ```
 
 */

import UIKit

class Solution {
    
    //    19 / 19 test cases passed.
    //    Status: Accepted
    //    Runtime: 4 ms
    //    Memory Usage: 20.9 MB
    
    func numTrees(_ n: Int) -> Int {
        
        guard n > 1 else {
            return 1
        }
        
        var dp = [Int](repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 0..<i {
                dp[i] += dp[j] * dp[i-j-1]
            }
        }
        return dp[n]
    }
}

let sol = Solution()
sol.numTrees(3) // 5
sol.numTrees(4) // 14
sol.numTrees(5) // 42
