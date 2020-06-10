/*:
# 9. Palindrome Number
  https://leetcode.com/problems/palindrome-number/

 ---

### Problem Statement:

 Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

### Example:

 ```
 Input: 121
 Output: true

 Input: -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
  
 Input: 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

 ```
 
 */


import UIKit

func reverse(_ x: Int) -> Int {
    if x == 0 { return 0 }

    var value = x
    var reverseValue = 0
    while value > 0 {
        reverseValue = (reverseValue * 10) + value%10
        value /= 10
    }
    
    return reverseValue
}

func isPalindrome(_ x: Int) -> Bool {
    if x == 0 { return true }
    if x < 0 || x % 10 == 0 { return false }
    return x == reverse(x)
}

func isPalindrome1(_ x: Int) -> Bool {
    return String(x) == String(String(x).reversed())
}

func isPalindrome2(_ x: Int) -> Bool {
    if (x < 0 || (x % 10 == 0 && x != 0)) { return false }

    var xMutable = x
    var reversed = 0

    while xMutable > reversed {
        let remainder = xMutable % 10
        reversed = (reversed * 10) + remainder
        xMutable = xMutable / 10
    }
    return xMutable == reversed ||  xMutable == reversed / 10
}

isPalindrome(121)   // true
isPalindrome(1201)  // false
isPalindrome(-121)  // false
isPalindrome(10)    // false
