/*:
# 949. Largest Time for Given Digits [Easy]
https://leetcode.com/problems/largest-time-for-given-digits

 ---

### Problem Statement:

 Given an array of 4 digits, return the largest 24 hour time that can be made.

 The smallest 24 hour time is 00:00, and the largest is 23:59.  Starting from 00:00, a time is larger if more time has elapsed since midnight.

 Return the answer as a string of length 5.  If no valid time can be made, return an empty string.


### Example:

 ```
 Input: [1,2,3,4]
 Output: "23:41"

 Input: [5,5,5,5]
 Output: ""

 ```
 
 ### Constraints:
 + A.length == 4
 + 0 <= A[i] <= 9

 
 */


import UIKit

// 172 / 172 test cases passed.
// Status: Accepted
// Runtime: 12 ms
// Memory Usage: 21.1 MB

class Solution {
    func largestTimeFromDigits(_ A: [Int]) -> String {
        let sum = A.reduce(0, +)
        if sum == 0 { return "00:00" }
        
        var maxHour = 0
        var maxMin = 0
        
        for i in 0..<4 {
            if A[i] > 2 { continue }
            
            for j in 0..<4 {
                if i == j { continue }
                
                for k in 0..<4 {
                    if k == i || k == j || A[k] > 6 { continue }
                    
                    for l in 0..<4 {
                        if l == i || l == j || l == k { continue }
                        
                        let hours = A[i] * 10 + A[j]
                        let minutes = A[k] * 10 + A[l]
                        if hours < 24 && minutes < 60 {

                            if hours == maxHour {
                                maxMin = max(maxMin, minutes)
                            } else if hours > maxHour {
                                maxHour = hours
                                maxMin = minutes
                            }
                        }
                    }
                }
            }
        }
        
        if maxHour == 0, maxMin == 0 { return "" }
        
        let h = String(format: "%02d", maxHour)
        let m = String(format: "%02d", maxMin)
        
        return "\(h):\(m)"
    }
}

class Solution1 {
    func largestTimeFromDigits(_ A: [Int]) -> String {
        var maxTime = Int.min
        for i in 0..<A.count {
            for j in 0..<A.count {
                for k in 0..<A.count {
                    let l = 6 - i - j - k
                    if i != j, j != k, i != k, l >= 0 {
                        let hour = A[i] * 10 + A[j]
                        let minute = A[k] * 10 + A[l]
                        if hour > 23 || minute > 59 {
                            continue
                        }
                        maxTime = max(maxTime, hour * 60 + minute)
                    }
                }
            }
        }
        
        if maxTime > Int.min {
            let hour = maxTime / 60
            let minute = maxTime % 60
            return "\(hour/10)\(hour%10):\(minute/10)\(minute%10)"
        }
        return ""
    }
}

let sol = Solution()
sol.largestTimeFromDigits([1,2,3,4]) // "23:41"
sol.largestTimeFromDigits([5,5,5,5]) // ""
sol.largestTimeFromDigits([1,0,3,4]) // "14:30"


