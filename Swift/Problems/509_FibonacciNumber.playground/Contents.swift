/*:
# 509. Fibonacci Number [Easy]
  https://leetcode.com/problems/fibonacci-number/

 ---

### Problem Statement:
 The Fibonacci numbers, commonly denoted `F(n)` form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from `0` and `1`. That is,

 ```
 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), for N > 1.
 ```
 
 Given `N`, calculate `F(N)`.


### Example:

 ```
 Input: 2
 Output: 1
 Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.

 Input: 3
 Output: 2

 Input: 4
 Output: 3

 ```

 ### Notes:
 + 0 ≤ N ≤ 30.
 
 */


import UIKit

class Solution {
    func fib(_ N: Int) -> Int {
        if N <= 1 {
            return N
        }
        
        var a = 0, b = 1, N = N
        
        while N > 0 {
            (a, b) = (b, a + b)
            N -= 1
        }
        
        return a
        
    }
}

let sol = Solution()
sol.fib(4) // 3

