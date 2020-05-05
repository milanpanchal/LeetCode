/*:
# Number Complement
https://leetcode.com/explore/featured/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3319/
 ---

### Problem Statement:

 Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.

### Example-1:

```
 Input: 5
 Output: 2
 Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.

 ```

 ### Example-2:
 
 ```
 Input: 1
 Output: 0
 Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
```
 
 ### Note:
 + The given integer is guaranteed to fit within the range of a 32-bit signed integer.
 + You could assume no leading zero bit in the integer’s binary representation.
 + This question is the same as 1009: https://leetcode.com/problems/complement-of-base-10-integer/

 */

import Foundation
class Solution {
    func findComplement(_ num: Int) -> Int {
        let binary = String(num, radix: 2)
        let complement = String(binary.map { $0 == "0" ? "1" : "0" })
        let result = Int(complement, radix: 2)!
        return result
    }
    
    func findComplementRevised(_ num: Int) -> Int {
        let lengthOfNum = Int(log2(Double(num))) + 1
        let bitMask = (1 << lengthOfNum) - 1
        return num ^ bitMask
    }
    
    func findComplementRevised2(_ num: Int) -> Int {
        
        var i = 0
        var j = 0
        
        while i < num {
            i += Int(pow(2.0, Double(j)))
            j += 1
            print(i,j)
        }
        return i - num
    }
}

let obj = Solution()
obj.findComplement(5)
obj.findComplementRevised(5)
obj.findComplementRevised2(5)
