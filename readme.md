# Knights Travails
Given any two coordinates on a 8x8 chess board, returns shortest number of moves a knight can make to get from the given source to the destination.

## knight_moves
Treats the chessboard as an implicit graph, using the x-y coordinates of any given square as node. Uses breadth first traversal taking the first argument as source and second as target. Prints out the move sequence to terminal.

## bfs_dict
Helper to knight_moves. Uses bfs to find shortes path to destination. Returns hash containing record of all nodes visited, and its "parent" previously visited node.

## bfs_path
Takes travesal record hash and a target, returns an array representing the shortest path from source to target

## knight_neighbors
Given a node, returns all neighbors (possible knight moves from that square)