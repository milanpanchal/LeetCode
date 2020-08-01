/*:
# Detect Capital
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3409/

 ---

### Problem Statement:

 Given a word, you need to judge whether the usage of capitals in it is right or not.

 We define the usage of capitals in a word to be right when one of the following cases holds:

 + All letters in this word are capitals, like "USA".
 + All letters in this word are not capitals, like "leetcode".
 + Only the first letter in this word is capital, like "Google".
 
 Otherwise, we define that this word doesn't use capitals in a right way.

### Example:

 ```
 Input: "USA"
 Output: True

 Input: "FlaG"
 Output: False

 ```
 

 ### Notes:
 + The input will be a non-empty word consisting of uppercase and lowercase latin letters.
 
 */


import UIKit

class Solution {
    
//    550 / 550 test cases passed.
//    Status: Accepted
//    Runtime: 16 ms
//    Memory Usage: 21.6 MB

    func detectCapitalUse(_ word: String) -> Bool {
        
        return word.lowercased() == word || word.uppercased() == word || word.capitalized == word
    }
    
//    550 / 550 test cases passed.
//    Status: Accepted
//    Runtime: 12 ms
//    Memory Usage: 20.8 MB

    func detectCapitalUse2(_ word: String) -> Bool {

        var upperCaseCount = 0
        
        for w in word where 65...90 ~= Int(w.asciiValue!) {
            upperCaseCount += 1
        }
        
        return upperCaseCount == word.count || upperCaseCount == 0 || upperCaseCount == 1 && word[word.startIndex].isUppercase
        
    }
}

let sol = Solution()
sol.detectCapitalUse("USA") // true
sol.detectCapitalUse("FlaG") // false
sol.detectCapitalUse("Flag") // true

sol.detectCapitalUse2("USA") // true
sol.detectCapitalUse2("FlaG") // false
sol.detectCapitalUse2("Flag") // true
