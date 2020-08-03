/*:
# 125. Valid Palindrome [Easy]
  https://leetcode.com/problems/valid-palindrome

 ---

### Problem Statement:
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

### Example:

 ```
 Input: "A man, a plan, a canal: Panama"
 Output: true

 Input: "race a car"
 Output: false

 ```
 
 ### Constraints:
 + s consists only of printable ASCII characters.

 ### Notes:
 + For the purpose of this problem, we define empty string as valid palindrome.
 
 */


import UIKit

// 481 / 481 test cases passed.
// Status: Accepted
// Runtime: 64 ms
// Memory Usage: 26.3 MB

class Solution {
    func isPalindrome(_ s: String) -> Bool {

        if( s.isEmpty || s.count == 1 ) {
            return true
        }
        
        let result = s.lowercased().replacingOccurrences( of:"[^0-9a-z]", with: "", options: .regularExpression)
        

        let sArray = Array(result)
        var left = 0, right = sArray.count - 1
        
        
        while left < right {
            if sArray[left] != sArray[right] {
                return false
            }
            left += 1
            right -= 1
        }
        
        return true
    }
    
    func isPalindrome3(_ s: String) -> Bool {
        
        if( s.isEmpty || s.count == 1 ) {
            return true
        }
                
        let s = Array(s)
        var left = 0
        var right = s.count - 1
        
        while left < right {
            
            while !(s[left].isNumber || s[left].isLetter), left < right {
                left += 1
            }

            while !(s[right].isNumber || s[right].isLetter), left < right {
                right -= 1
            }
            
            if s[left].lowercased() != s[right].lowercased() {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }

}

let sol = Solution()
sol.isPalindrome("") // true
sol.isPalindrome("A man, a plan, a canal: Panama") // true
sol.isPalindrome("race a car") // false
sol.isPalindrome("0P") // false
sol.isPalindrome("a") // true

