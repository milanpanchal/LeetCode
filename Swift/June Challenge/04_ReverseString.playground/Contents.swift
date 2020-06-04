/*:
# Reverse String
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3350/

 ---

### Problem Statement:

 Write a function that reverses a string. The input string is given as an array of characters `char[]`.

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 You may assume all the characters consist of printable ascii characters.

### Example:

 ```
 Input: ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]

 Input: ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]

 ```
 
 ### Hint:
 + The entire logic for reversing a string is based on using the opposite directional two-pointer approach!
 
 */

import UIKit

/**
* 478 / 478 test cases passed.
* Status: Accepted
* Runtime: 264 ms
* Memory Usage: 24.7 MB
*/

func reverseString(_ s: inout [Character]) {
    
    for i in 0..<s.count/2 {
        (s[i], s[s.count-1-i]) = (s[s.count-1-i], s[i])
        // s.swapAt(i, s.count-1-i)
    }
}

var str = Array("hello")
reverseString(&str)
print(str)
