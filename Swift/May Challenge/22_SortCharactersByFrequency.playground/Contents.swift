/*:
# Sort Characters By Frequency
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/537/week-4-may-22nd-may-28th/3337/

 ---

### Problem Statement:

 Given a string, sort it in decreasing order based on the frequency of characters.



### Example 1:

 ```
 Input:
 "tree"

 Output:
 "eert"

 Explanation:
 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

 ```
 
 ### Example 2:

 ```
 Input:
 "cccaaa"

 Output:
 "cccaaa"

 Explanation:
 Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
 Note that "cacaca" is incorrect, as the same characters must be together.

 ```
 
 ### Example 3:
 
 ```
 Input:
 "Aabb"

 Output:
 "bbAa"

 Explanation:
 "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.
 ```
 */

import UIKit

func frequencySort(_ s: String) -> String {
    
    var frequency = [Character: Int]()
    
    for ch in s {
        frequency[ch] = (frequency[ch] ?? 0) + 1
    }

    let sortedByValueDictionary = frequency.sorted { $0.1 > $1.1 }
    return sortedByValueDictionary.compactMap{String(repeating: $0.key, count: $0.value)}.joined()
}

frequencySort("tree")
