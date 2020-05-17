/*:
# Find All Anagrams in a String
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/536/week-3-may-15th-may-21st/3332/

 ---

### Problem Statement:

 Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

 Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.

 The order of output does not matter.

### Example 1:

 ```
 Input:
 s: "cbaebabacd" p: "abc"

 Output:
 [0, 6]

 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 ```
 ### Example 2:

 ```
 Input:
 s: "abab" p: "ab"

 Output:
 [0, 1, 2]

 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 ```

 */

import UIKit

class Solution {
    

    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard p.count <= s.count else { return [] }
        
        let count = p.count
        let array = Array(s)
        
        var res:[Int] = []
        var dict:[Character:Int] = [:]
        var dictP:[Character:Int] = [:]
        
        for i in p {
            dictP[i] = (dictP[i] ?? 0) + 1
        }
        
        for i in array[0..<p.count]{
            dict[i] = (dict[i] ?? 0) + 1
        }
        
        if dict == dictP {
            res.append(0)
        }
        
        for i in 1..<s.count-count+1 {
            if array[i-1] == array[i+count-1] && dict == dictP {
                res.append(i)
            }else{
                dict[array[i-1]]! -= 1
                if dict[array[i-1]] == 0{
                    dict.removeValue(forKey: array[i-1])
                }
                dict[array[i+count-1]] = (dict[array[i+count-1]] ?? 0 ) + 1
                if dict == dictP{
                    res.append(i)
                }
            }
            
        }
        return res

    }
    
    // Exception: Time Limit Exceeded
    
    
    /*
     1.) Build map from P with frequency of characters, P = 'abc' map = ['a' = 1, 'b' = 1,'c' = 1]
     2.) Initially, window Start = 0, window End = 0
     3.) Traverse over string S,
        + if character at windowEnd exists in map decrement that character in map and increment the windowEnd. ( increase the window for valid anagram)
        + if character does not exists, add the character at window start back in map from , and increment windowStart (reduce the window)
        + if windowStart and windowEnd are at same index, increment both since size of window is 0.

     */

    func findAnagrams2(_ s: String, _ p: String) -> [Int] {
        
        if s.count < p.count { return [] }
        
        var result:[Int] = []
        
        // Create hashMap
        var hash = [Character: Int]()
        for c in p {
            hash[c] = (hash[c] ?? 0) + 1
        }
        
        var start = 0, end = 0
        let array = Array(s)
        
        while end < s.count {
         
            // if found, increament window size and decrement value from hashMap
            if let val = hash[array[end]] {
                if val == 1 {
                    hash.removeValue(forKey: array[end])
                } else {
                    hash[array[end]] = val - 1
                }

                end += 1
                if end - start == p.count {
                    result.append(start)
                }
            } else if start == end {
                start += 1
                end += 1
            } else {
                hash[array[start]] = (hash[array[start]] ?? 0) + 1
                start += 1
            }
        }
        
        return result
    }

        
}

let obj = Solution()

obj.findAnagrams("cbaebabacd", "abc") // [0, 6]
obj.findAnagrams("abab", "ab") // [0, 1, 2]
obj.findAnagrams("", "a") // []
obj.findAnagrams("aaaaaaaaaa", "aaaaaaaaaaaaa") // []
obj.findAnagrams("bbbbbbbbbb", "bbbbbbbbbb") // [0]
obj.findAnagrams("aa", "bb") // []
obj.findAnagrams("aaaaaaaaaaaaa", "aaaaaaaaaa") // [0, 1, 2, 3]
