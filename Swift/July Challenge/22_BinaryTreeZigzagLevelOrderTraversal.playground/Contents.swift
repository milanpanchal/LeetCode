/*:
# Binary Tree Zigzag Level Order Traversal
  https://leetcode.com/explore/challenge/card/july-leetcoding-challenge/547/week-4-july-22nd-july-28th/3398/

 ---

### Problem Statement:
 
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

### Example:

 ```
 Given binary tree [3,9,20,null,null,15,7],

   3
  / \
 9  20
   /  \
  15   7

 return its zigzag level order traversal as:

 [
   [3],
   [20,9],
   [15,7]
 ]

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


class Solution {
    
//    33 / 33 test cases passed.
//    Status: Accepted
//    Runtime: 20 ms
//    Memory Usage: 20.6 MB

    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var result = [[Int]]()
        
        BFS(root, &result, 0)
        
        return result
    }
    
    func BFS(_ node: TreeNode?, _ result: inout [[Int]], _ level: Int) {
        guard let node = node else {
            return
        }
        
        if result.count < level + 1 {
            result.append([Int]())
        }
        
        if level % 2 == 0 {
            result[level].append(node.val)
        } else {
            result[level].insert(node.val, at: 0)
        }
        
        BFS(node.left, &result, level + 1)
        BFS(node.right, &result, level + 1)
    }
}

class Solution1 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var results: [[Int]] = []
        
        var queue = [root]
        var shouldReverse = false
        while !queue.isEmpty {
            let length = queue.count
            var line: [Int] = []
            for _ in 0..<length {
                let current = queue.removeFirst()
                line.append(current.val)
                if let left = current.left {
                    queue.append(left)
                }
                if let right = current.right {
                    queue.append(right)
                }
            }
            results.append(shouldReverse ? line.reversed() : line)
            shouldReverse = !shouldReverse
        }
        return results
    }
}

let node = TreeNode(3)
node.left = TreeNode(9)
node.right = TreeNode(20)
node.right?.left = TreeNode(15)
node.right?.right = TreeNode(7)

let sol = Solution()
sol.zigzagLevelOrder(node) // [[3],[20,9],[15,7]]

