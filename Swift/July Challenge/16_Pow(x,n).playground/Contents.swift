/*:
# Pow(x, n)
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3392/

 ---

### Problem Statement:

 Implement pow(x, n), which calculates x raised to the power n (xn).

### Example:

 ```
 Input: 2.00000, 10
 Output: 1024.00000

 Input: 2.10000, 3
 Output: 9.26100

 Input: 2.00000, -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25

 ```
 
 ### Constraints:
 + -100.0 < x < 100.0
 + n is a 32-bit signed integer, within the range [−2^31, 2^31 − 1]
 
 */

import UIKit

class Solution {
    
    // Status: Time Limit Exceeded
    func myPow1(_ x: Double, _ n: Int) -> Double {
        
        if n == 0 {
            return 1
        }
        
        let nAbs = abs(n)
        
        var xPow = x
        for _ in 1..<nAbs {
            xPow *= x
        }
        return n > 0 ? xPow : 1 / xPow
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        
        if n == 0 {
            return 1
        }
        
        if n == 1 {
            return x
        }
        
        
        let temp = myPow(x, n/2)
        
        if n % 2 == 0 {
            return temp * temp
        } else {
            if n > 0 {
                return x * temp * temp
            } else {
              return (temp * temp) / x
            }
        }
        
    }
    
    // Without recursion
    func myPow3(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        
        var result: Double = 1
        var temp = x
        var count = abs(n)
        while count >= 1 {
            if count % 2 != 0 {
                result *= temp
            }
            
            temp *= temp
            count = count / 2
        }
        
        return n > 0 ? result : 1 / result
    }

}

let sol = Solution()
sol.myPow(2.00000, 10)  // 1024.00000
sol.myPow(2.10000, 3)   // 9.26100
sol.myPow(2.00000, -2)  // 0.25000
sol.myPow(0.00001, 2147483647) // TLE: Exception



