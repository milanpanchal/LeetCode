/*:
# Word Break II
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/548/week-5-july-29th-july-31st/3406/

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

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
 
        return [String]()
    }
}

let sol = Solution()
sol.wordBreak("catsanddog", ["cat", "cats", "and", "sand", "dog"])
sol.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
sol.wordBreak("pineapplepenapple", ["apple", "pen", "applepen", "pine", "pineapple"])

