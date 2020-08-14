/*:
# Longest Palindrome
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3423/

 ---

### Problem Statement:
 Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.

 This is case sensitive, for example `"Aa" `is not considered a palindrome here.


### Example:

 ```
 Input:
 "abccccdd"

 Output:
 7

 Explanation:
 One longest palindrome that can be built is "dccaccd", whose length is 7.

 ```
 
 ### Notes:
 + Assume the length of given string will not exceed 1,010.
 
 */


import UIKit

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        
        var freq = [Character: Int]()
        var count = 0
        for ch in s {
            freq[ch, default: 0] += 1
        }
        
        for (_, val) in freq {
            count += val/2
        }
        count *= 2
        
        return count < s.count ? count + 1 : count
    }
    
    func longestPalindrome2(_ s: String) -> Int {
        let freq: [Character: Int] = s.reduce(into: [:], { $0[$1, default: 0] += 1 })
        var count = 0
        for (_, value) in freq {
            count += (value % 2 == 0) ? value : (value - 1)
        }
        
        return count < s.count ? count + 1 : count
    }
}

let sol = Solution()
sol.longestPalindrome("abccccddA") // 7
