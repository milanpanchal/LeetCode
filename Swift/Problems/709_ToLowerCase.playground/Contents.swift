/*:
# 709. To Lower Case
  https://leetcode.com/problems/to-lower-case/

 ---

### Problem Statement:
 
 Implement function ToLowerCase() that has a string parameter str, and returns the same string in lowercase.

### Example:

 ```
 Input: "Hello"
 Output: "hello"

 Input: "here"
 Output: "here"

 Input: "LOVELY"
 Output: "lovely"

 ```
 
 */


import UIKit

class Solution {
    
    //    8 / 8 test cases passed.
    //    Status: Accepted
    //    Runtime: 12 ms
    //    Memory Usage: 20.6 MB
    
    func toLowerCase(_ str: String) -> String {
        let map:[Character: Character] = ["A":"a", "B":"b", "C":"c", "D":"d", "E":"e", "F":"f", "G":"g", "H":"h", "I":"i", "J":"j", "K":"k", "L":"l", "M":"m", "N":"n", "O":"o", "P":"p", "Q":"q", "R":"r", "S":"s", "T":"t", "U":"u", "V":"v", "W":"w", "X":"x", "Y":"y", "Z":"z"]
        var lowerString = ""
        for char in str {
            lowerString.append(map[char] ?? char)
        }
        return lowerString
    }
    
    
    //    8 / 8 test cases passed.
    //    Status: Accepted
    //    Runtime: 8 ms
    //    Memory Usage: 20.6 MB
    
    func toLowerCase2(_ str: String) -> String {
        var lowerString = ""
        
        for ch in str {
            if let asciiValue = ch.asciiValue, 65...90 ~= asciiValue {
                lowerString.append(Character(UnicodeScalar(asciiValue+32)))
            } else {
                lowerString.append(ch)
            }
        }
        
        return lowerString
    }
}

let sol = Solution()
sol.toLowerCase("Hello")
sol.toLowerCase("here")
sol.toLowerCase("LOVELY")
