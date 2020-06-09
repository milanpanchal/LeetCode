/*:
# Is Subsequence
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/540/week-2-june-8th-june-14th/3355/
 
 ---

### Problem Statement:

 Given a string `s` and a string `t`, check if s is subsequence of `t`.

 A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" while "aec" is not).

### Follow up:
 If there are lots of incoming S, say S1, S2, ... , Sk where k >= 1B, and you want to check one by one to see if T has its subsequence. In this scenario, how would you change your code?


### Example:

 ```
 Input: s = "abc", t = "ahbgdc"
 Output: true
 
 Input: s = "axc", t = "ahbgdc"
 Output: false
 ```
 
 ### Constraints:
 + 0 <= s.length <= 100
 + 0 <= t.length <= 10^4
 + Both strings consists only of lowercase characters.

 
 */

import UIKit

func isSubsequence(_ s: String, _ t: String) -> Bool {

    if t.count < s.count { return false }
    if s.count == t.count { return s == t }
    if s.count == 0 { return true }

    let sArray = Array(s)
    
    var count = 0
    for chT in t {
        if chT == sArray[count] {
            if count + 1 == sArray.count {
                return true
            }
            
            count += 1
        }
    }

    return false
}

isSubsequence("abc", "ahbgdc")  // true
isSubsequence("axc", "ahbgdc")  // false
isSubsequence("", "ahbgdc")     // true
isSubsequence("acb", "ahbgdc")  // false
