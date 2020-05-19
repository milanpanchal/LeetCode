/*:
# Permutation in String

 https://leetcode.com/explore/featured/card/may-leetcoding-challenge/536/week-3-may-15th-may-21st/3333/
 
 ---

### Problem Statement:

 Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.


### Example:

 ```
 Input: s1 = "ab" s2 = "eidbaooo"
 Output: True
 Explanation: s2 contains one permutation of s1 ("ba").

 
 Input:s1= "ab" s2 = "eidboaoo"
 Output: False
 ```
 
 ### Notes:
 + The input strings only contain lower case letters.
 + The length of both given strings is in range [1, 10,000].
 
 */

extension Array where Element == Int {
    
    func isAllZeros() -> Bool {
        for val in self {
            if val != 0 { return false}
        }
        return true
    }
}

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        guard s1.count <= s2.count else { return false }
        
        let count = s1.count
        let array = Array(s2)
        
        var dict:[Character:Int] = [:]
        var dictP:[Character:Int] = [:]
        
        for i in s1 {
            dictP[i] = (dictP[i] ?? 0) + 1
        }
        
        for i in array[0..<s1.count]{
            dict[i] = (dict[i] ?? 0) + 1
        }
        
        if dict == dictP {
            return true
        }
        
        for i in 1..<s2.count-count+1 {
            if array[i-1] == array[i+count-1] && dict == dictP {
                return true
            }else{
                dict[array[i-1]]! -= 1
                if dict[array[i-1]] == 0{
                    dict.removeValue(forKey: array[i-1])
                }
                dict[array[i+count-1]] = (dict[array[i+count-1]] ?? 0 ) + 1
                if dict == dictP{
                    return true
                }
            }
            
        }
        return false
        
    }
    
    func checkInclusion2(_ s1: String, _ s2: String) -> Bool {
        
        guard s1.count <= s2.count else { return false }
        
        let array1 = Array(s1.unicodeScalars)
        let array2 = Array(s2.unicodeScalars)
        var frequince = Array(repeating: 0, count: 26)
        
        for i in 0..<s1.count {
            frequince[Int(array1[i].value - 97)] += 1
            frequince[Int(array2[i].value - 97)] -= 1
        }
        
        if frequince.isAllZeros() {
            return true
        }

        for i in s1.count ..< s2.count {
            frequince[Int(array2[i].value - 97)] -= 1
            frequince[Int(array2[i - s1.count].value - 97)] += 1

            if frequince.isAllZeros() {
                return true
            }

        }
        
        return false

        
    }
}

let obj = Solution()

obj.checkInclusion("ab", "eidbaooo")
obj.checkInclusion("ab", "eidboaoo")

obj.checkInclusion2("ab", "eidbaooo")
obj.checkInclusion2("ab", "eidboaoo")
