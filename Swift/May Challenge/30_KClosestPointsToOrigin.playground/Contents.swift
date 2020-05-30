/*:
# K Closest Points to Origin
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/538/week-5-may-29th-may-31st/3345/
 
 ---

### Problem Statement:
 
 We have a list of `points` on the plane.  Find the `K` closest points to the origin (0, 0).

 (Here, the distance between two points on a plane is the Euclidean distance.)

 You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in.)

### Example 1:

 ```
 Input: points = [[1,3],[-2,2]], K = 1

 Output: [[-2,2]]

 Explanation:
 The distance between (1, 3) and the origin is sqrt(10).
 The distance between (-2, 2) and the origin is sqrt(8).
 Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
 We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
 ```
 
 ### Example 2:
 ```
 Input: points = [[3,3],[5,-1],[-2,4]], K = 2

 Output: [[3,3],[-2,4]]
 (The answer [[-2,4],[3,3]] would also be accepted.)

 ```
 
 ### Notes:
 + 1 <= K <= points.length <= 10000
 + -10000 < points[i][0] < 10000
 + -10000 < points[i][1] < 10000

 
 */

import Foundation

func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
    
    // Check for invalid input
    guard points.count >= K, K > 0 else {
        return [[]]
    }

    // Return all points If K == points.count
    if points.count == K {
        return points
    }

    // Sort by distance
    let distanceArray = points.sorted(by: { (p1, p2) -> Bool in
        return (p1[0] * p1[0]) + (p1[1] * p1[1]) < (p2[0] * p2[0]) + (p2[1] * p2[1])
        })
    
    return Array(distanceArray.prefix(K))
}

kClosest([[1,3],[-2,2]], 1) // [[-2,2]]
kClosest([[3,3],[5,-1],[-2,4]], 2) // [[3,3],[-2,4]]


