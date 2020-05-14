/*:
#   Jewels and Stones
 https://leetcode.com/explore/challenge/card/May-Leetcoding-challenge/534/week-1-may-1st-may-7th/3317/
 
---

### Problem Statement:

 You're given strings `J` representing the types of stones that are jewels, and `S` representing the stones you have.  Each character in `S` is a type of stone you have.  You want to know how many of the stones you have are also jewels.

 The letters in `J` are guaranteed distinct, and all characters in `J` and `S` are letters. Letters are case sensitive, so `"a"` is considered a different type of stone from `"A"`.

### Example:

```
 Input: J = "aA", S = "aAAbbbb"
 Output: 3

 Input: J = "z", S = "ZZ"
 Output: 0

 ```

 ### Note:
 + `S` and `J` will consist of letters and have length at most 50.
 + The characters in `J` are distinct.

 */

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        return S.filter({ return J.contains($0) }).count
    }
}

let obj = Solution()
obj.numJewelsInStones("aA", "aAAbbbb") // 3
obj.numJewelsInStones("z", "ZZ") // 0
