/*:
# 06. Image Overlap
  https://leetcode.com/explore/challenge/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3450/

 ---

### Problem Statement:
 Two images `A` and `B` are given, represented as binary, square matrices of the same size.  (A binary matrix has only 0s and 1s as values.)

 We translate one image however we choose (sliding it left, right, up, or down any number of units), and place it on top of the other image.  After, the overlap of this translation is the number of positions that have a 1 in both images.

 (Note also that a translation does not include any kind of rotation.)

 What is the largest possible overlap?


### Example:

 ```
 Input: A = [[1,1,0],
             [0,1,0],
             [0,1,0]]
        B = [[0,0,0],
             [0,1,1],
             [0,0,1]]
 Output: 3
 Explanation: We slide A to right by 1 unit and down by 1 unit.

 ```
 
 ### Constraints:
 + 1 <= A.length = A[0].length = B.length = B[0].length <= 30
 + 0 <= A[i][j], B[i][j] <= 1
 
 */


import UIKit

// 49 / 49 test cases passed.
// Status: Accepted
// Runtime: 172 ms
// Memory Usage: 20.9 MB

class Solution {
    
    func largestOverlap(_ A: [[Int]], _ B: [[Int]]) -> Int {
        return max(findMax(A, B), findMax(B, A))
    }
    
    private func findMax(_ a: [[Int]], _ b: [[Int]]) -> Int {
        var result = 0
        let aCount = a.count
        for i1 in 0..<aCount {
            for j1 in 0..<aCount {
                var temp = 0
                for i2 in i1..<aCount {
                    for j2 in j1..<aCount where a[i2 - i1][j2 - j1] == 1 && b[i2][j2] == 1 {
                        temp += 1
                    }
                }
                result = max(result, temp)
            }
        }
        return result
    }
}

let sol = Solution()
sol.largestOverlap([[1,1,0],[0,1,0],[0,1,0]], [[0,0,0],[0,1,1],[0,0,1]]) // 3
