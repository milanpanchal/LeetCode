/*:
# Find Right Interval
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3438/

 ---

### Problem Statement:

 Given a set of intervals, for each of the interval i, check if there exists an interval j whose start point is bigger than or equal to the end point of the interval i, which can be called that j is on the "right" of i.

 For any interval i, you need to store the minimum interval j's index, which means that the interval j has the minimum start point to build the "right" relationship for interval i. If the interval j doesn't exist, store -1 for the interval i. Finally, you need output the stored value of each interval as an array.


### Example 1:

 ```
 Input: [ [1,2] ]
 Output: [-1]
 
 Explanation: There is only one interval in the collection, so it outputs -1.
 
 ```
 
 ### Example 2:

 ```
 Input: [ [3,4], [2,3], [1,2] ]
 Output: [-1, 0, 1]

 Explanation: There is no satisfied "right" interval for [3,4].
 For [2,3], the interval [3,4] has minimum-"right" start point;
 For [1,2], the interval [2,3] has minimum-"right" start point.

 ```

 ### Example 3:

 ```
 Input: [ [1,4], [2,3], [3,4] ]

 Output: [-1, 2, -1]

 Explanation: There is no satisfied "right" interval for [1,4] and [3,4].
 For [2,3], the interval [3,4] has minimum-"right" start point.

 ```

 ### Notes:
 + You may assume the interval's end point is always bigger than its start point.
 + You may assume none of these intervals have the same start point.

 */


import UIKit

class Solution {
//    17 / 17 test cases passed.
//    Status: Accepted
//    Runtime: 3736 ms
//    Memory Usage: 23.2 MB

    func findRightInterval1(_ intervals: [[Int]]) -> [Int] {
        
        guard intervals.count > 1 else {
            return [-1]
        }
        
        let idx = intervals.enumerated().reduce(into: [Int: Int](), { $0[$1.1[0]] = $1.0 })
        
        // Sort the interval by start point
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        
        var result = [Int](repeating: -1, count: intervals.count)
        
        for i in 0..<(intervals.count - 1) {
            for j in (i + 1)..<intervals.count {
                if intervals[j][0] >= intervals[i][1] {
                    result[idx[intervals[i][0]]!] = idx[intervals[j][0]]!
                    break
                }
            }
        }
        
        return result
    }
    
//    17 / 17 test cases passed.
//    Status: Accepted
//    Runtime: 384 ms
//    Memory Usage: 23.3 MB

    // Leetcode Solution using Binary Search
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        // 1. Create Output Array
        var result = Array(repeating: -1, count: intervals.count)

        // 2. Sort based on start time
        var intervals = intervals.enumerated().map { (idx, element) in
            return (element, idx)
        }
        intervals.sort { $0.0[0] < $1.0[0] }

        // 3. Perform Binary Search for Each interval
        for idx in 0..<intervals.count {
            let intervalIdx = intervals[idx].1
            let interval = intervals[idx].0
            let target = interval[1]

            var start = idx+1
            var end = intervals.count - 1
            while start <= end {
                let mid = start + (end - start) / 2
                if intervals[mid].0[0] >= target {
                    if mid == idx + 1 || intervals[mid-1].0[0] < target {
                        result[intervalIdx] = intervals[mid].1
                        break
                    } else {
                        end = mid - 1
                    }
                } else {
                    start = mid + 1
                }
            }
        }

        return result
    }

}

let sol = Solution()
sol.findRightInterval([[1,2]]) // [-1]
//sol.findRightInterval([[3,4], [2,3], [1,2]]) // [-1,0,1]
//sol.findRightInterval([[1,4], [2,3], [3,4]]) // [-1,2,-1]
sol.findRightInterval([[4,5], [2,3], [1,2]]) // [-1,0,1]


