/*:
# Interval List Intersections
  https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/537/week-4-may-22nd-may-28th/3338/

 ---

### Problem Statement:

 Given two lists of closed intervals, each list of intervals is pairwise disjoint and in sorted order.

 Return the intersection of these two interval lists.

 (Formally, a closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.  The intersection of two closed intervals is a set of real numbers that is either empty, or can be represented as a closed interval.  For example, the intersection of [1, 3] and [2, 4] is [2, 3].)

### Example:

 ```
 Input: A = [[0,2],[5,10],[13,23],[24,25]], B = [[1,5],[8,12],[15,24],[25,26]]
 Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
 Reminder: The inputs and the desired output are lists of Interval objects, and not arrays or lists.

 ```
 
 ### Constraints:
 + 0 <= A.length < 1000
 + 0 <= B.length < 1000
 + 0 <= A[i].start, A[i].end, B[i].start, B[i].end < 10^9

 ### Notes:
 + input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 
 */

import UIKit

func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    
    var aPointer = 0
    var bPointer = 0
    
    while aPointer < A.count, bPointer < B.count {
        let startInterval = max(A[aPointer].first!, B[bPointer].first!)
        let endInterval = min(A[aPointer].last!, B[bPointer].last!)

        // Validate result
        if startInterval <= endInterval {
            result.append([startInterval, endInterval])
        }
        
        // Increment pointer
        if A[aPointer].last! < B[bPointer].last! {
            aPointer += 1
        } else {
            bPointer += 1
        }
    }

    return result
}

intervalIntersection([[1, 3]], [[2,4]]) // [[2, 3]]

intervalIntersection([[0,2],[5,10],[13,23],[24,25]],
                     [[1,5],[8,12],[15,24],[25,26]]) //[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
