/*:
# Non-overlapping Intervals
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3425/

 ---

### Problem Statement:
 Given a collection of intervals, find the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

### Example 1:

 ```
 Input: [[1,2],[2,3],[3,4],[1,3]]
 Output: 1
 Explanation: [1,3] can be removed and the rest of intervals are non-overlapping.

 ```

 ### Example 2:

 ```
 Input: [[1,2],[1,2],[1,2]]
 Output: 2
 Explanation: You need to remove two [1,2] to make the rest of intervals non-overlapping.

 ```

 ### Example 3:

 ```
 Input: [[1,2],[2,3]]
 Output: 0
 Explanation: You don't need to remove any of the intervals since they're already non-overlapping.

 ```

 ### Notes:
 + You may assume the interval's end point is always bigger than its start point.
 + Intervals like [1,2] and [2,3] have borders "touching" but they don't overlap each other.

 */


import UIKit

// 18 / 18 test cases passed.
// Status: Accepted
// Runtime: 112 ms
// Memory Usage: 21.2 MB

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 0 else {
            return 0
        }
        
        let intervals = intervals.sorted { $0[1] < $1[1] }
        
        var overlapIntervals = 0
        var prevInterval = intervals[0]
        
        for interval in intervals[1...] {
            if interval[0] < prevInterval[1] {
                overlapIntervals += 1
            } else {
                prevInterval = interval
            }
        }
        
        return overlapIntervals
        
    }
}

let sol = Solution()
sol.eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]]) // 1
sol.eraseOverlapIntervals([[1,2],[1,2],[1,2]]) // 2
sol.eraseOverlapIntervals([[1,2],[2,3]]) // 0
