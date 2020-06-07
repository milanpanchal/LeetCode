/*:
# Power of Two
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3354/

 ---

### Problem Statement:
 
 Given an integer, write a function to determine if it is a power of two.

### Example:

 ```
 Input: 1
 Output: true
 Explanation: 20 = 1

 Input: 16
 Output: true
 Explanation: 24 = 16

 Input: 218
 Output: false

 ```
  */

import UIKit

func isPowerOfTwo(_ n: Int) -> Bool {
    var k = 1

    while k < n {
        k <<= 1
    }
    
    return k == n
}

func isPowerOfTwo1(_ n: Int) -> Bool {
    return n & (n - 1) == 0 && n != 0
}

func isPowerOfTwo2(_ n: Int) -> Bool {
    if n == 0 { return false}
    
    let log2Value = log2(Double(n))
    return log2Value == log2Value.rounded()
}

isPowerOfTwo(0) // false
isPowerOfTwo(1)  // true
isPowerOfTwo(16) // true
isPowerOfTwo(218) // false
