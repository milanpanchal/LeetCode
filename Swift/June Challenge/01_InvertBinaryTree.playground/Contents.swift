/*:
# Invert Binary Tree
  https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3347/

 ---

### Problem Statement:

 Invert a binary tree.


### Example:

 ```
 Input:

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 
 Output:

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 ```

 
 */


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



func invertTree(_ root: TreeNode?) -> TreeNode? {
     guard let root = root else { return nil }
     (root.left, root.right) = (invertTree(root.right), invertTree(root.left))
     return root
}

let node = TreeNode(4)
node.left = TreeNode(2)
node.right = TreeNode(7)
node.left?.left = TreeNode(1)
node.left?.right = TreeNode(3)
node.right?.left = TreeNode(6)
node.right?.right = TreeNode(9)

invertTree(node)
