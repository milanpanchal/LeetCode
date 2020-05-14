/*:
#   First Unique Character in a String
 https://leetcode.com/explore/featured/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3320/
 
 ---

### Problem Statement:

 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

### Example-1:

```
 s = "leetcode"
 return 0.

 s = "loveleetcode",
 return 2.

 ```
 
 ### Note:
 + You may assume the string contain only lowercase letters.

 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()
        
        var index = 0
        for char in s {
            if dict[char] == nil {
               dict[char] = index
            } else {
               dict[char] = -1
            }
            index += 1
        }
        
        var firstIndex = Int.max
        
        for (_, value) in dict {
            if value != -1 && value < firstIndex {
                firstIndex = value
            }
        }
        
        return firstIndex == Int.max ? -1 : firstIndex
    }
}

let obj = Solution()
obj.firstUniqChar("leetcode")
obj.firstUniqChar("loveleetcode")
obj.firstUniqChar("abcdabcd")

