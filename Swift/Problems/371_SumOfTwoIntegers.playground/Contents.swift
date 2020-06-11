/*:
# 371. Sum of Two Integers
  https://leetcode.com/problems/sum-of-two-integers/
 
 ---

### Problem Statement:
 Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.


### Example:

 ```
 Input: a = 1, b = 2
 Output: 3

 Input: a = -2, b = 3
 Output: 1
 ```
 
 */

import UIKit

func getSum(_ a: Int, _ b: Int) -> Int {
//    return a.advanced(by: b)
    return b == 0 ? a : getSum(a^b, (a&b) << 1)
}


getSum(1, 2)
getSum(15, 32)
getSum(-2, 3)
