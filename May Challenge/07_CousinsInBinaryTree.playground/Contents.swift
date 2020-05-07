/*:
# Cousins in Binary Tree
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3322/
 
 ---

### Problem Statement:

 In a binary tree, the root node is at depth `0`, and children of each depth `k` node are at depth `k+1`.

 Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

 We are given the `root` of a binary tree with unique values, and the values `x` and `y` of two different nodes in the tree.

 Return `true` if and only if the nodes corresponding to the values `x` and `y` are cousins.


### Example-1:

 ```
 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 
 ```

 ### Example-2:
 
 ```
 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 
 ```
 
 ### Example-3:
 
 ```
 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false
 
 ```
 
 ### Note:
 + The number of nodes in the tree will be between 2 and 100.
 + Each node has a unique integer value from 1 to 100.

 */

/**
 Definition for a binary tree node.
 */
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
    
    func isSibling(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        if root == nil {
            return false
        }
        
        return (root?.left?.val == x && root?.right?.val == y) ||
            (root?.left?.val == y && root?.right?.val == x) ||
            isSibling(root?.left, x, y) ||
            isSibling(root?.right, x, y)
    }

    
    func findLevel(_ root: TreeNode?, _ val: Int, _ level: Int) -> Int {
    
        guard let node = root else {
            return 0
        }
        
        if node.val == val {
            return level
        }
        
        let l = findLevel(node.left, val, level + 1)
        if l != 0 {
            return l
        }
        return findLevel(node.right, val, level + 1)
    }
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
    
        let level1 = findLevel(root, x, 1)
        let level2 = findLevel(root, y, 1)
        return level1 == level2 && !isSibling(root, x, y)
    }
        
}

let node = TreeNode(1)
node.left = TreeNode(2)
node.right = TreeNode(3)
node.left?.left = TreeNode(4)
node.right?.left = TreeNode(5)

let obj = Solution()
obj.isCousins(node, 4, 5)




