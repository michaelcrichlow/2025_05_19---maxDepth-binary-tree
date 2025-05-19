package test

import "core:fmt"
print :: fmt.println

main :: proc() {
    root := new(TreeNode, context.temp_allocator)
    root.value = 1
    root.left = new(TreeNode, context.temp_allocator)
    root.right = new(TreeNode, context.temp_allocator)
    root.left.value = 2
    root.right.value = 3
    root.left.left = new(TreeNode, context.temp_allocator)
    root.left.right = new(TreeNode, context.temp_allocator)
    root.left.left.value = 4
    root.left.right.value = 5

    print(maxDepth(root))

    free_all(context.temp_allocator)
    // OUTPUT:
    // 3
}

TreeNode :: struct {
    value: int,
    left: ^TreeNode,
    right: ^TreeNode,
}

maxDepth :: proc(root: ^TreeNode) -> int {
    if root == nil {
        return 0  // Base case: empty tree has depth 0
    }

    left_depth := maxDepth(root.left)  // Recursively get left subtree depth
    right_depth := maxDepth(root.right)  // Recursively get right subtree depth

    return max(left_depth, right_depth) + 1  // Add 1 for the current node
}
