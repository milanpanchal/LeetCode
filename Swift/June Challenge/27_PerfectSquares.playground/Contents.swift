/*:
# Perfect Squares

 https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/542/week-4-june-22nd-june-28th/3373/
 
 ---

### Problem Statement:

 Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.

### Example:

 ```
 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.

 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.

 ```

 */

import UIKit

class Solution {
    

//    588 / 588 test cases passed.
//    Status: Accepted
//    Runtime: 188 ms
//    Memory Usage: 20.5 MB

    func numSquares(_ n: Int) -> Int {
        
        var dp = Array(repeating: 0, count: n+1)
        for i in 1...n {
            var minValue = i
            var y = 1, square = 1
            while square <= i {
                minValue = min(minValue, 1 + dp[i-square])
                y += 1
                square = y * y
            }
            dp[i] = minValue
        }
        return dp[n]
    }
}

let sol = Solution()
sol.numSquares(12) // 3
sol.numSquares(13) // 2
sol.numSquares(20) // 2
