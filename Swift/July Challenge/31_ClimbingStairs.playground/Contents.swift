/*:
# Climbing Stairs
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/548/week-5-july-29th-july-31st/3407/

 ---

### Problem Statement:

 You are climbing a stair case. It takes n steps to reach to the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

### Example 1:

 ```
 Input: 2
 Output: 2
 
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps

 ```

 ### Example 2:

 ```
 Input: 3
 Output: 3
 
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step

 ```

 ### Constraints:
 + 1 <= n <= 45

 ### Hint:
 + To reach nth step, what could have been your previous steps? (Think about the step sizes)
 
 */


import UIKit

class Solution {
    
//    45 / 45 test cases passed.
//    Status: Accepted
//    Runtime: 4 ms
//    Memory Usage: 20.7 MB

    func climbStairs(_ n: Int) -> Int {
        var n = n
        var a  = 1, b = 1
        while n > 0 {
            (a, b) = (b, a + b)
            n -= 1
        }
        
        return a
    }
}

let sol = Solution()
sol.climbStairs(2) // 2
sol.climbStairs(3) // 3
sol.climbStairs(4) // 5
sol.climbStairs(5) // 8
sol.climbStairs(6) // 13
