# Generates an array of neighboring nodes for the given node. Follows the movement rules of a chess night on an 8x8 board
def knight_neighbors(node)
  out = []
  x = node[0]
  y = node[0]

out.append(x - 1, y + 2) if (x - 1) >= 0 and (y + 2) <= 7
out.append(x + 1, y + 2) if (x + 1) <= 7 and (y + 2) <= 7
out.append(x - 1, y - 2) if (x - 1) >= 0 and (y - 2) >= 0
out.append(x + 1, y - 2) if (x + 1) <= 7  and (y - 2) >= 0
out.append(x + 2, y + 1) if (x + 2) <= 7 and (y + 1) <= 7
out.append(x - 2, y + 1) if (x - 2) >= 0 and (y + 1) <= 7
out.append(x + 2, y - 1) if (x + 2) <= 7 and (y - 1) >= 0
out.append(x - 2, y - 1) if (x - 2) >= 0 and (y - 1) >= 0

return out
end
# Breadth first traversal of the graph, returning dictionary of node - origin pairs for each node visited
def bfs_dict(s, t)
  dict = HashMap.new()
  q = []

  if s == t
    dict[s] = nil
    return dict
  else
    q.append([s, nil])
  end

  while not q.empty?
    current = q.shift()
    node = current[0]
    origin = current[1]

    if node == t
      dict[node] = origin
      return dict
    else
      dict[node] = origin
      neighbors = knight_neighbors(node)

      neighbors.each {|neighbor| q.append([neighbor, node])}
    end
  end
end

# Generates an array of nodes representing the path to a target given a breadth first traversal dict and a target
def bfs_path(dict, t)
  path = []

  if dict[t].nil?
    path += t
    return path
  else
    path += t
    path += bfs_path(dict, dict[t])
  end
end

# Generates the quickest path for a knight to move from given source coord to target coord
def knight_moves(s, t)
  d = bfs_dict(s, t)
  path = bfs_path(d, t)
  path.reverse!
  
  # You made it in 3 moves!  Here's your path:
  puts("You made it in #{path.length} moves! Here's your path:")
  path.each {|element| puts("#{element}")}
end