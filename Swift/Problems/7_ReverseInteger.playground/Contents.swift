/*:
# 7. Reverse Integer
  https://leetcode.com/problems/reverse-integer/

 ---

### Problem Statement:

 Given a 32-bit signed integer, reverse digits of an integer.

### Example:

 ```
 Input: 123
 Output: 321

 Input: -123
 Output: -321

 Input: 120
 Output: 21

 ```

 ### Notes:
 + Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

 
 */

import UIKit

func reverse(_ x: Int) -> Int {
    if x == 0 { return 0 }

    var value = x > 0 ? x : -x
    var reverseValue = 0
    while value > 0 {
        reverseValue = (reverseValue * 10) + value%10
        value /= 10
    }
    
    if reverseValue <= Int32.max {
        return x > 0 ? reverseValue : -reverseValue
    } else {
        return 0
    }
    
}

reverse(123)
reverse(-123)
reverse(120)
