/*:
# Reverse Words in a String
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/546/week-3-july-15th-july-21st/3391/

 ---

### Problem Statement:

 Given an input string, reverse the string word by word. Your reversed string should not contain leading or trailing spaces.

### Example:

 ```
 Input: "the sky is blue"
 Output: "blue is sky the"
 
 Input: "  hello world!  "
 Output: "world! hello"
 
 Input: "a good   example"
 Output: "example good a"
 
 ```
 
 ### Notes:
 + A word is defined as a sequence of non-space characters.
 + Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
 + You need to reduce multiple spaces between two words to a single space in the reversed string.

 ### Follow up:
 + For C programmers, try to solve it in-place in O(1) extra space.

 */

import UIKit

class Solution {
    
//    25 / 25 test cases passed.
//    Status: Accepted
//    Runtime: 52 ms
//    Memory Usage: 22 MB

    func reverseWords(_ s: String) -> String {
        return s.components(separatedBy: " ")
            .filter { $0.count > 0 }
            .reversed()
            .joined(separator: " ")
    }
    
    func reverseWords2(_ s: String) -> String {
        return s.split(separator: " ", omittingEmptySubsequences: true)
            .reversed()
            .joined(separator: " ")
    }
}

let sol = Solution()
sol.reverseWords("the sky is blue")
sol.reverseWords("  hello world!  ")
sol.reverseWords("a good   example")
