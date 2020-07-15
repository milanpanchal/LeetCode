/*:
# 917. Reverse Only Letters
  https://leetcode.com/problems/reverse-only-letters/

 ---

### Problem Statement:

 Given a string `S`, return the "reversed" string where all characters that are not a letter stay in the same place, and all letters reverse their positions.


### Example:

 ```
 Input: "ab-cd"
 Output: "dc-ba"

 Input: "a-bC-dEf-ghIj"
 Output: "j-Ih-gfE-dCba"

 Input: "Test1ng-Leet=code-Q!"
 Output: "Qedo1ct-eeLg=ntse-T!"

 ```
 
 ### Notes:
 + S.length <= 100
 + 33 <= S[i].ASCIIcode <= 122
 + S doesn't contain \ or "

 
 */

import UIKit

class Solution {
    
    //    116 / 116 test cases passed.
    //    Status: Accepted
    //    Runtime: 8 ms
    //    Memory Usage: 20.3 MB
    
    func reverseOnlyLetters2(_ S: String) -> String {
        
        var sArray = Array(S)
        var left = 0
        var right = sArray.count - 1
        
        while left < right {
            var needsToSwap = true
            
            if let asciiValue = sArray[left].asciiValue {
                if asciiValue < 65 || asciiValue > 122 || ( asciiValue > 90 && asciiValue < 97) {
                    left += 1
                    needsToSwap = false
                }
            }
            
            if let asciiValue = sArray[right].asciiValue {
                if asciiValue < 65 || asciiValue > 122 || ( asciiValue > 90 && asciiValue < 97) {
                    right -= 1
                    needsToSwap = false
                }
                
            }
            
            if needsToSwap {
                sArray.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        
        return String(sArray)
    }
    
    
    //    116 / 116 test cases passed.
    //    Status: Accepted
    //    Runtime: 8 ms
    //    Memory Usage: 21.1 MB

    func reverseOnlyLetters(_ S: String) -> String {
        
        var sArray = Array(S)
        var left = 0
        var right = sArray.count - 1
        
        while left < right {
                    
            if sArray[left].isLetter, sArray[right].isLetter {
                sArray.swapAt(left, right)
                left += 1
                right -= 1
            } else {
                
                if !sArray[left].isLetter {
                    left += 1
                }

                if !sArray[right].isLetter {
                    right -= 1
                }

            }
        }
        
        return String(sArray)
    }
    
}

let sol = Solution()
sol.reverseOnlyLetters("ab-cd") // dc-ba
sol.reverseOnlyLetters("a-bC-dEf-ghIj") // j-Ih-gfE-dCba
sol.reverseOnlyLetters("Test1ng-Leet=code-Q!") // Qedo1ct-eeLg=ntse-T!
