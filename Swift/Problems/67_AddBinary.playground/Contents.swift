/*:
# Add Binary
  https://leetcode.com/problems/add-binary/

 ---

### Problem Statement:
 
 Given two binary strings, return their sum (also a binary string).

 The input strings are both non-empty and contains only characters `1` or `0`.

### Example:

 ```
 Input: a = "11", b = "1"
 Output: "100"

 Input: a = "1010", b = "1011"
 Output: "10101"

 ```
 
 ### Constraints:
 + Each string consists only of '0' or '1' characters.
 + 1 <= a.length, b.length <= 10^4
 + Each string is either "0" or doesn't contain any leading zero.

 */


import UIKit

class Solution {
    // Not workig for numner > Int.max
    func addBinary1(_ a: String, _ b: String) -> String {
        if let aNumber = Int(a, radix: 2),
            let bNumber = Int(b, radix: 2) {
            return String(aNumber + bNumber, radix: 2)
        }
        
        return "0"
    }
    
    func addBinary2(_ a: String, _ b: String) -> String {
        
        let aArray = Array(a)
        let bArray = Array(b)

        var i = aArray.count - 1
        var j = bArray.count - 1
        var sum = 0
        var res = ""
        
        while i >= 0 || j >= 0 || sum == 1 {
            sum += (i >= 0) ? Int(String(aArray[i]))! : 0
            sum += (j >= 0) ? Int(String(bArray[j]))! : 0
            res = String((sum % 2)) + res
            sum /= 2
            i -= 1
            j -= 1
        }
        
        return res
    }
    
    func addBinary(_ a: String, _ b: String) -> String {
        let aArray = Array(a.reversed())
        let bArray = Array(b.reversed())
        
        let maxLength = max(aArray.count, bArray.count)
        var result = ""
        var carry = false
        
        for i in 0..<maxLength {
            
            let bit1 = i < aArray.count ? aArray[i] : "0"
            let bit2 = i < bArray.count ? bArray[i] : "0"

            if bit1 == "0", bit2 == "0" {
                if carry {
                    result.append("1")
                    carry = false
                } else {
                    result.append("0")
                }
            } else if bit1 == "1", bit2 == "1" {
                if carry {
                    result.append("1")
                } else {
                    result.append("0")
                }
                carry = true
            } else {
                if carry {
                    result.append("0")
                } else {
                    result.append("1")
                }
            }
            
        }
        
        if carry {
            result.append("1")
        }

        return String(result.reversed())
        
    }
}

let sol = Solution()
sol.addBinary("11", "1") // 101
sol.addBinary("1010", "1011") // 10101
sol.addBinary("10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101",
"110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011")

