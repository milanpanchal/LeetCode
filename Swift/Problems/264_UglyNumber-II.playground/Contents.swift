/*:
# 264. Ugly Number II
  https://leetcode.com/problems/ugly-number-ii/
 
 ---

### Problem Statement:
 Write a program to find the `n`-th ugly number.

 Ugly numbers are positive numbers whose prime factors only include `2, 3, 5`.

### Example:

 ```
 Input: n = 10
 Output: 12
 Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.

 ```
 
 ### Hint:
 + The naive approach is to call `isUgly` for every number until you reach the nth one. Most numbers are not ugly. Try to focus your effort on generating only the ugly ones.
 + An ugly number must be multiplied by either 2, 3, or 5 from a smaller ugly number.
 + The key is how to maintain the order of the ugly numbers. Try a similar approach of merging from three sorted lists: L1, L2, and L3.
 + Assume you have `Uk`, the `kth` ugly number. Then `U(k+1)` must be `Min(L1 * 2, L2 * 3, L3 * 5)`.


 ### Notes:
 + `1` is typically treated as an ugly number.
 + `n` does not exceed 1690.
 
 */

import UIKit

// 596 / 596 test cases passed.
// Status: Accepted
// Runtime: 28 ms
// Memory Usage: 20.9 MB

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        
        precondition(n >= 0, "Number must not be negative")

        guard n > 1 else {
            return n
        }
        
        var p2 = 0, p3 = 0, p5 = 0
        var dp = Array(repeating: 0, count: n)
        
        dp[0] = 1
        for i in 1..<n {
//            dp[i] = [dp[p2] * 2, dp[p3] * 3, dp[p5] * 5].min()!
            dp[i] = min(dp[p2] * 2, min(dp[p3] * 3, dp[p5] * 5))

            if dp[i] == dp[p2] * 2 {
                p2 += 1
            }

            if dp[i] == dp[p3] * 3 {
                p3 += 1
            }

            if dp[i] == dp[p5] * 5 {
                p5 += 1
            }
        }
        
        return dp[n - 1]
        
    }
}

let sol = Solution()
sol.nthUglyNumber(0) // 0
sol.nthUglyNumber(1) // 1
sol.nthUglyNumber(10) // 12
sol.nthUglyNumber(100) // 1536

