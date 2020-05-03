/*:
#     Ransom Note
https://leetcode.com/explore/featured/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3318/
 
 ---

### Problem Statement:

 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

 Each letter in the magazine string can only be used once in your ransom note.


### Example:

```
 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 ```

 ### Note:
 + You may assume that both strings contain only lowercase letters.

 */
import UIKit
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        var magazineArray = Array(magazine)
        
        for eachChar in ransomNote {
            if !magazineArray.contains(eachChar) {
                return false
            }
            if let firstIndex = magazineArray.firstIndex(of: eachChar) {
                magazineArray.remove(at: firstIndex)
            }
        }
        return true
    }
}

let obj = Solution()
obj.canConstruct("a", "b") // false
obj.canConstruct("aa", "ab") // false
obj.canConstruct("aa", "aab") // true
