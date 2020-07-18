/*:
# 69. Sqrt(x)
  https://leetcode.com/problems/sqrtx/

 ---

### Problem Statement:

 Implement `int sqrt(int x)`.

 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.


### Example:

 ```
 Input: 4
 Output: 2

 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since
              the decimal part is truncated, 2 is returned.

 ```
 
 ### Hint:
 + Try exploring all integers. (Credits: @annujoshi)
 + Use the sorted property of integers to reduced the search space. (Credits: @annujoshi)
 
 */


import UIKit

class Solution {
    func mySqrt(_ x: Int) -> Int {
        var i = 0
        while i*i <= x {
            i += 1
        }
        return i-1
    }
    
    func mySqrt2(_ x: Int) -> Int {
        return Int(sqrt(Double(x)))
    }
    
    //    1017 / 1017 test cases passed.
    //    Status: Accepted
    //    Runtime: 4 ms
    //    Memory Usage: 20.9 MB

    func mySqrt3(_ x: Int) -> Int { // Knowing that sqrt(x) is equivalent to x ^ (1/2), I did
        return Int(pow(Double(x), 0.5))
    }
    
    // Binray Search
    func mySqrt4(_ x: Int) -> Int {
        
        guard x > 1 else {
            return 1
        }
        
        var left = 0
        var right = x / 2 + 1
        
        while left <= right {
            let middle = (left + right) / 2
            let middleSqueared = middle * middle
            
            if middleSqueared == x {
                return middle
            } else if middleSqueared < x {
                left = middle
            } else {
                right = middle
            }
        }
        return left
    }

}

let sol = Solution()
sol.mySqrt(4)
sol.mySqrt(8)
sol.mySqrt(12)
sol.mySqrt(16)
sol.mySqrt(20)
sol.mySqrt(22)
sol.mySqrt(24)
sol.mySqrt(28)
