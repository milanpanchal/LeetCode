/*:
# Count Square Submatrices with All Ones
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/536/week-3-may-15th-may-21st/3336/

 ---

### Problem Statement:

 Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.

### Example 1:

 ```
 Input: matrix =
 [
   [0,1,1,1],
   [1,1,1,1],
   [0,1,1,1]
 ]
 Output: 15
 Explanation:
 There are 10 squares of side 1.
 There are 4 squares of side 2.
 There is  1 square of side 3.
 Total number of squares = 10 + 4 + 1 = 15.
 ```

 ### Example 2:

 ```
 Input: matrix =
 [
   [1,0,1],
   [1,1,0],
   [1,1,0]
 ]
 Output: 7
 Explanation:
 There are 6 squares of side 1.
 There is 1 square of side 2.
 Total number of squares = 6 + 1 = 7.
 ```

 ### Constraints:
 + 1 <= arr.length <= 300
 + 1 <= arr[0].length <= 300
 + 0 <= arr[i][j] <= 1

 ### Hint:
 + Create an additive table that counts the sum of elements of submatrix with the superior corner at (0,0).
 
 + Loop over all subsquares in O(n^3) and check if the sum make the whole array to be ones, if it checks then add 1 to the answer.
 
 */

// Ref: https://leetcode.com/problems/count-square-submatrices-with-all-ones/discuss/643429/Python-DP-Solution-%2B-Thinking-Process-Diagrams-(O(mn)-runtime-O(1)-space)

func countSquares(_ matrix: [[Int]]) -> Int {
    
    
    
    guard matrix.count > 0, matrix.first!.count > 0 else {
        return 0
    }
    
    var count = 0
    var tempMatrix = matrix
    
    for i in 0..<tempMatrix.count {
        for j in 0..<tempMatrix[0].count {
            if tempMatrix[i][j] == 1 {
                if (i == 0 || j == 0) {
                    count += 1
                } else {
                    let cellVal = min(tempMatrix[i-1][j-1], min(tempMatrix[i-1][j], tempMatrix[i][j-1])) + tempMatrix[i][j]
                    count += cellVal
                    tempMatrix[i][j] = cellVal
                }
            }
        }
    }
    return count
}

countSquares([[1,0,1], [1,1,0], [1,1,0]])
countSquares([[],[],[]])
countSquares([
  [0,1,1,1],
  [1,1,1,1],
  [0,1,1,1]
])
