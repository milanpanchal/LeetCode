/*:
# Path Sum III
  https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3417/

 ---

### Problem Statement:
 You are given a binary tree in which each node contains an integer value.

 Find the number of paths that sum to a given value.

 The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).

 The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.

### Example:

 ```
 root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8

       10
      /  \
     5   -3
    / \    \
   3   2   11
  / \   \
 3  -2   1

 Return 3. The paths that sum to 8 are:

 1.  5 -> 3
 2.  5 -> 2 -> 1
 3. -3 -> 11

 ```
 
 */

import UIKit

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// 126 / 126 test cases passed.
// Status: Accepted
// Runtime: 276 ms
// Memory Usage: 21.2 MB

class Solution1 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        return pathSum(root.left, sum) + pathSum(root.right, sum) + pathSumFromWithoutRoot(root, sum)
    }
    
    private func pathSumFromWithoutRoot(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        return (root.val == sum ? 1 : 0) +
            pathSumFromWithoutRoot(root.left, sum-root.val) +
            pathSumFromWithoutRoot(root.right, sum-root.val)
        
    }
}

// 126 / 126 test cases passed.
// Status: Accepted
// Runtime: 44 ms
// Memory Usage: 21.5 MB

class Solution {
    func pathSumHelper(_ root: TreeNode?, _ partialSum : Int, _ map : inout [Int : Int], _ sum: Int, _ result : inout Int)  {
        if let root = root {
            let sumSoFar = partialSum + root.val
            if let stored = map[sumSoFar - sum] {
                result += stored
            }
            map[sumSoFar, default: 0] += 1
            pathSumHelper(root.left, sumSoFar, &map, sum, &result)
            pathSumHelper(root.right, sumSoFar, &map, sum, &result)
            map[sumSoFar, default: 0] -= 1
        }
    }
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        var map = [Int : Int]()
        var result = 0
        map[0] = 1
        pathSumHelper(root, 0, &map, sum, &result)
        return result
    }
}

let root = TreeNode(10)

root.left = TreeNode(5)
root.right = TreeNode(-3)

root.left?.left = TreeNode(3)
root.left?.right = TreeNode(2)
root.right?.right = TreeNode(11)

root.left?.left?.left = TreeNode(3)
root.left?.left?.right = TreeNode(-2)
root.left?.right?.right = TreeNode(1)

let sol = Solution()
sol.pathSum(root, 8)
