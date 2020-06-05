/*:
# 345. Reverse Vowels of a String

 https://leetcode.com/problems/reverse-vowels-of-a-string/
 
 ---

### Problem Statement:

 Write a function that takes a string as input and reverse only the vowels of a string.

### Example:

 ```
 Input: "hello"
 Output: "holle"

 Input: "leetcode"
 Output: "leotcede"

 ```
 
 ### Notes:
 + The vowels does not include the letter "y".
 
 */

import UIKit

//Runtime: 64 ms, faster than 92.31% of Swift online submissions for Reverse Vowels of a String.
//Memory Usage: 21.7 MB, less than 84.48% of Swift online submissions for Reverse Vowels of a String.

func reverseVowels(_ s: String) -> String {

    guard s.count > 1 else {
        return s
    }
    
    var reverseVowelsStr = Array(s)
    let vowels = Set("aeiouAEIOU")
    var startIndex = 0
    var endIndex = s.count - 1
    
    while startIndex < endIndex {
        
        let isVowelAtStart = vowels.contains(reverseVowelsStr[startIndex])
        let isVowelAtEnd = vowels.contains(reverseVowelsStr[endIndex])
        
        if isVowelAtStart, isVowelAtEnd {
            reverseVowelsStr.swapAt(startIndex, endIndex)
            startIndex += 1
            endIndex -= 1
        } else if !isVowelAtStart {
            startIndex += 1
        } else if !isVowelAtEnd {
            endIndex -= 1
        }
        
    }
    
    return String(reverseVowelsStr)
}

reverseVowels("hello") // holle
reverseVowels("leetcode") // leotcede
