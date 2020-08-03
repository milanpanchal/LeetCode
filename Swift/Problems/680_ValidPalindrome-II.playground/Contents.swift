/*:
# 680. Valid Palindrome - II [Easy]
  https://leetcode.com/problems/valid-palindrome-ii/

 ---

### Problem Statement:
 Given a non-empty string `s`, you may delete at most one character. Judge whether you can make it a palindrome.

### Example:

 ```
 Input: "aba"
 Output: True

 Input: "abca"
 Output: True
 Explanation: You could delete the character 'c'.

 ```

 ### Notes:
 + The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
 
 */


import UIKit

// 460 / 460 test cases passed.
// Status: Accepted
// Runtime: 172 ms
// Memory Usage: 22 MB

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        
        let s       = Array(s)
        var left    = 0
        var right   = s.count - 1
        
        while left < right {
            if s[left] != s[right] {
                return isPalindrome(s, left + 1, right) || isPalindrome(s, left, right - 1)
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
    
    func isPalindrome(_ s: [Character], _ left: Int, _ right: Int) -> Bool {
        var left = left
        var right = right
        
        while left < right {
            if s[left] != s[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
    
}

// 460 / 460 test cases passed.
// Status: Accepted
// Runtime: 724 ms
// Memory Usage: 22.3 MB

class Solution1 {
    
    var charCountToDelete = 1
    
    func validPalindrome(_ s: String) -> Bool {
        
        if s.count < 2 {
            return true
        }
        
        let s = Array(s)
        
        var i = 0
        var j = s.count - 1
        
        while i < j {
            if s[i] != s[j] {
                if charCountToDelete == 0 {
                    return false
                }
                let s1 = String(s[i+1...j])
                let s2 = String(s[i...j-1])
                charCountToDelete -= 1
                return validPalindrome(s1) || validPalindrome(s2)
            }
            i += 1
            j -= 1
        }
        return true
    }
}


let sol = Solution()
sol.validPalindrome("aba")
sol.validPalindrome("abca")
sol.validPalindrome("abcda")
