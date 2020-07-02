/*:
# 107. Binary Tree Level Order Traversal II
  https://leetcode.com/problems/binary-tree-level-order-traversal-ii/

 ---

### Problem Statement:
 
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

 For example:
 Given binary tree `[3,9,20,null,null,15,7]`,

### Example:

 ```
   3
  / \
 9  20
   /  \
  15   7

 return its bottom-up level order traversal as:

 [
   [15,7],
   [9,20],
   [3]
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
    
//    34 / 34 test cases passed.
//    Status: Accepted
//    Runtime: 16 ms
//    Memory Usage: 21.2 MB

    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else {
            return []
        }

        var result = [[Int]]()

        var list = [TreeNode]()
        list.append(node)
        
        while !list.isEmpty {
            var subList = [Int]()
            let size = list.count
            for _ in 0..<size {
                let popElement = list.removeFirst()
                subList.append(popElement.val)
                if let left = popElement.left {list.append(left)}
                if let right = popElement.right {list.append(right)}
            }
            result.append(subList)
        }
        return result.reversed()
    }
}

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.left?.left = TreeNode(8)
root.left?.right = TreeNode(10)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

let sol = Solution()
sol.levelOrderBottom(root)


// Using Recursion
class Solution1 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var levels = [[Int]]()
        bfs(root, 0, &levels)
        return levels.reversed()
    }
    
    func bfs(_ root: TreeNode?, _ level: Int, _ levels: inout [[Int]]) {
        guard let root = root else {
            return
        }
        
        if levels.count == level {
            levels.append([root.val])
        } else {
            levels[level].append(root.val)
        }
        
        bfs(root.left, level + 1, &levels)
        bfs(root.right, level + 1, &levels)
    }
}

