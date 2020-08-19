/*:
# Goat Latin
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3350/

 ---

### Problem Statement:

 A sentence `S` is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.

 We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)

 The rules of Goat Latin are as follows:

 + If a word begins with a vowel (a, e, i, o, or u), append `"ma"` to the end of the word. For example, the word 'apple' becomes 'applema'.
  
 + If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add `"ma"`. For example, the word` "goat"` becomes `"oatgma"`.
  
 + Add one letter `'a'` to the end of each word per its word index in the sentence, starting with 1. For example, the first word gets `"a"` added to the end, the second word gets `"aa"` added to the end and so on.
 
 Return the final sentence representing the conversion from `S` to Goat Latin.


### Example:

 ```
 Input: "I speak Goat Latin"
 Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"

 Input: "The quick brown fox jumped over the lazy dog"
 Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
  
 ```
 
 ### Constraints:
 + S contains only uppercase, lowercase and spaces. Exactly one space between each word.
 + 1 <= S.length <= 150.
 
 */

import UIKit

class Solution {
    func toGoatLatin(_ S: String) -> String {
        return ""
    }
}

let sol = Solution()
sol.toGoatLatin("I speak Goat Latin") // Imaa peaksmaaa oatGmaaaa atinLmaaaaa

// Output:
// heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa
sol.toGoatLatin("The quick brown fox jumped over the lazy dog")
