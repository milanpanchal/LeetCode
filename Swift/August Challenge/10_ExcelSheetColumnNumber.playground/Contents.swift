/*:
# Excel Sheet Column Number
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3419/
 
 ---

### Problem Statement:

 Given a column title as appear in an Excel sheet, return its corresponding column number.

 For example:

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...

### Example:

 ```
 Input: "A"
 Output: 1

 Input: "AB"
 Output: 28

 Input: "ZY"
 Output: 701

 ```
 
 ### Constraints:
 + 1 <= s.length <= 7
 + s consists only of uppercase English letters.
 + s is between "A" and "FXSHRXW".

 
 */

class Solution {
    func titleToNumber(_ s: String) -> Int {
        var result = 0
        for ch in s {
            result = result * 26 + Int((ch.asciiValue! - 64))
        }
        
        return result
    }
    
//    1000 / 1000 test cases passed.
//    Status: Accepted
//    Runtime: 8 ms
//    Memory Usage: 21.1 MB

    func titleToNumber2(_ s: String) -> Int {
        return s.reduce(0) { $0 * 26 + Int(($1.asciiValue! - 64))}
    }
}

let sol = Solution()
sol.titleToNumber("A") // 1
sol.titleToNumber("AB") // 28
sol.titleToNumber("ZY") // 701


sol.titleToNumber2("A") // 1
sol.titleToNumber2("AB") // 28
sol.titleToNumber2("ZY") // 701
