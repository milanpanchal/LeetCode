/*:
# 459. Repeated Substring Pattern [Easy]
  https://leetcode.com/problems/repeated-substring-pattern/

 ---

### Problem Statement:

 Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.

### Example:

 ```
 Input: "abab"
 Output: True
 Explanation: It's the substring "ab" twice.

 Input: "aba"
 Output: False

 Input: "abcabcabcabc"
 Output: True
 Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)

 ```
 
 */


import UIKit

class Solution {
    func repeatedSubstringPattern1(_ s: String) -> Bool {
        var chars = Array(s+s)
        chars.removeFirst()
        chars.removeLast()
        return String(chars).contains(s)
    }
    
    func repeatedSubstringPattern2(_ s: String) -> Bool {
        let str = s+s
        return String(
            str[str.index(after: str.startIndex) ..< str.index(before: str.endIndex)]
        ).contains(s)
    }
    
    // Leetcode optimised sol:
    func repeatedSubstringPattern(_ s: String) -> Bool {
        
        let l = s.count
        
        for i in stride(from: l/2, through: 1, by: -1) {
            
            if l % i == 0 {
                let subStr = String(s[s.startIndex..<s.index(s.startIndex, offsetBy: i)])
                if String(repeating: subStr, count: l/subStr.count) == s {
                    return true
                }
            }

        }
        return false
        
    }
}

let sol = Solution()
sol.repeatedSubstringPattern("abab") // true
sol.repeatedSubstringPattern("aba") // false
sol.repeatedSubstringPattern("abcabcabcabc") // true

