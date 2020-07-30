/*:
# 140. Word Break II [Hard]
  https://leetcode.com/problems/word-break-ii/

 ---

### Problem Statement:

 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences.

### Example 1:

 ```
 s = "catsanddog"
 wordDict = ["cat", "cats", "and", "sand", "dog"]
 Output:
 [
   "cats and dog",
   "cat sand dog"
 ]

 ```

 ### Example 2:

 ```
 s = "pineapplepenapple"
 wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
 Output:
 [
   "pine apple pen apple",
   "pineapple pen apple",
   "pine applepen apple"
 ]
 Explanation: Note that you are allowed to reuse a dictionary word.

 ```

 ### Example 3:

 ```
 s = "catsandog"
 wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output:
 []

 ```

 ### Notes:
 + The same word in the dictionary may be reused multiple times in the segmentation.
 + You may assume the dictionary does not contain duplicate words.

 */


import UIKit

// 36 / 36 test cases passed.
// Status: Accepted
// Runtime: 48 ms
// Memory Usage: 21.3 MB

class Solution {
    
    var result = [String: [String]]()
    
    func wordBreak(_ str: String, _ wordDict: [String]) -> [String] {
        
        if let ans = result[str] {
            return ans
        }
        
        var ans = [String]()
        
        for word in wordDict where str.hasPrefix(word) {
            if str.count == word.count {
                ans.append(word)
            } else {
                let substr = String(str[word.endIndex...])
                let subwords = wordBreak(substr, wordDict)
                for substr in subwords {
                    ans.append("\(word) \(substr)")
                }
            }
        }

        result[str] = ans
        return ans
    }
}

let sol = Solution()
sol.wordBreak("catsanddog", ["cat", "cats", "and", "sand", "dog"])
sol.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
sol.wordBreak("pineapplepenapple", ["apple", "pen", "applepen", "pine", "pineapple"])

