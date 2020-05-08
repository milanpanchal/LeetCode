/*:
# Check If It Is a Straight Line
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3323/

 ---

### Problem Statement:

 You are given an array `coordinates`, `coordinates[i] = [x, y]`, where `[x, y]` represents the coordinate of a point. Check if these points make a straight line in the XY plane.

### Example:

 ```
 Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
 Output: true
 
 ```
 
 ### Constraints:
 + 2 <= coordinates.length <= 1000
 + coordinates[i].length == 2
 + -10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4
 + coordinates contains no duplicate point.
 
 */

class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        
        if coordinates.count == 2 {
            return true
        }
        
        let x0 = coordinates[0][0], y0 = coordinates[0][1]
        let x1 = coordinates[1][0], y1 = coordinates[1][1]
        
        let dX = x1 - x0
        let dY = y1 - y0
        
        for eachCoordinate in coordinates[2...] {
            if dX * (eachCoordinate.last! - y1) != dY * (eachCoordinate.first! - x1) {
                return false
            }
        }
        
        return true
    }
}

let obj = Solution()
obj.checkStraightLine([[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]])
obj.checkStraightLine([[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]])
