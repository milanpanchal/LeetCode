/*:
# 404. Sum of Left Leaves [Easy]
  https://leetcode.com/problems/sum-of-left-leaves

 ---

### Problem Statement:

 Find the sum of all left leaves in a given binary tree.

### Example:

 ```
     3
    / \
   9  20
     /  \
    15   7

 There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.

 ```
 */


import UIKit


//  Definition for a binary tree node.
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
    private var sum = 0
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        dfs(node, false)
        return sum
    }
    
    private func dfs(_ node: TreeNode?, _ isLeft: Bool) {
        guard let node = node else { return }
        
        dfs(node.left, true)
        
        if node.left == nil, node.right == nil, isLeft {
            sum += node.val
        }
        dfs(node.right, false)
    }
}

class Solution2 {
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        return dfs(root, false)
    }
    
    private func dfs(_ node: TreeNode?, _ isLeft: Bool) -> Int {
        guard let node = node else { return 0 }
        
        if node.left == nil, node.right == nil, isLeft {
            return node.val
        }

        return dfs(node.left, true) + dfs(node.right, false)
    }
}

let node = TreeNode(3)
node.left = TreeNode(9)
node.right = TreeNode(20)
node.right?.left = TreeNode(15)
node.right?.right = TreeNode(7)

let sol = Solution2()
sol.sumOfLeftLeaves(node) // 24

