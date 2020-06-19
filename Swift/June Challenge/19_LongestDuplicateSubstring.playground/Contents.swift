/*:
# Longest Duplicate Substring
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/541/week-3-june-15th-june-21st/3365/

 ---

### Problem Statement:

 Given a string `S`, consider all duplicated substrings: (contiguous) substrings of S that occur 2 or more times.  (The occurrences may overlap.)

 Return any duplicated substring that has the longest possible length.  (If `S` does not have a duplicated substring, the answer is `""`.)

### Example:

 ```
 Input: "banana"
 Output: "ana"

 Input: "abcd"
 Output: ""
 ```
 
 ### Notes:
 + `2 <= S.length <= 10^5`
 + `S` consists of lowercase English letters.

 ### Hint:
 + Binary search for the length of the answer. (If there's an answer of length 10, then there are answers of length 9, 8, 7, ...)
 + To check whether an answer of length K exists, we can use Rabin-Karp 's algorithm. (https://en.wikipedia.org/wiki/Rabin%E2%80%93Karp_algorithm)

 */

// Facing TLE(Time Limit Exceed) error
import UIKit

extension String {
    subscript(_ i: Int) -> String {
      let idx1 = index(startIndex, offsetBy: i)
      let idx2 = index(idx1, offsetBy: 1)
      return String(self[idx1..<idx2])
    }

    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    func getValue(_ index:Int) -> Int {
        return Int(Character(self[index]).asciiValue ?? 0) - 97
    }
}

class Solution {
    func longestDupSubstring(_ S: String) -> String {
        var leftPointer = 1, rightPointer = S.count
        
        while leftPointer < rightPointer {
            let middle = (leftPointer + rightPointer) / 2
            
            if rabinKarpAlgo(S, middle) != -1 {
                leftPointer = middle + 1
            } else {
                rightPointer = middle
            }
        }
        
        let startingPos = rabinKarpAlgo(S, leftPointer - 1)
        return startingPos == -1 ? "" : S[startingPos..<startingPos+leftPointer-1]
    }
    
    private func rabinKarpAlgo(_ str: String, _ length: Int) -> Int {
        let n = str.count

        var hash = 0
        var global = 1
        let alphabets = 26
//        let mode = NSDecimalNumber(decimal: pow(2, 32)).intValue
        let mode = Int(pow(Double(2), Double(32)))
        
        for i in 0..<length {
            hash = (hash * alphabets + str.getValue(i)) % mode
            global = (global * alphabets) % mode
        }
        var intSet = Set<Int>()
        intSet.insert(hash)
        
        for start in 1..<n-length + 1 {

            hash = (hash * alphabets - str.getValue(start-1) * global % mode + mode) % mode
            hash = (hash + str.getValue(start+length-1)) % mode

            if intSet.contains(hash) {
                return start
            }
            intSet.insert(hash)

        }
        return -1
    }
    
}

let obj = Solution()
obj.longestDupSubstring("banana")   // "ana"
obj.longestDupSubstring("abcd")     // ""
obj.longestDupSubstring("abcdaf")   // "a"
obj.longestDupSubstring("leetcode") // "e"
