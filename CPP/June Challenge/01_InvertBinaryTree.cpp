/*
https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/539/week-1-june-1st-june-7th/3347/
Day-1: Invert a binary tree.

Example:

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
*/


//Definition for a binary tree node.
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

class Solution {
    void swap(TreeNode * &Left, TreeNode * &Right)
    {
        TreeNode * Temp = Left;
        Left = Right;
        Right = Temp;
    }
    void process(TreeNode * root)
    {
        if(root == nullptr)
            return;
        swap(root->left, root->right);
        if(root != nullptr)
            process(root->left);
        if(root != nullptr)
            process(root->right);
    }
public:
    TreeNode* invertTree(TreeNode* root) {        
        process(root);
        return root;
    }
};