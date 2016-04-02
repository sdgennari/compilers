# Image from slides
# graph = {
# 	0: [1, 2],
# 	1: [0],
# 	2: [0, 3, 6],
# 	3: [2, 4, 6],
# 	4: [3, 6],
# 	6: [2, 3, 4],
# }

# graph = {
# 	"A": ["C", "E"],
# 	"B": ["C", "D", "E"],
# 	"C": ["A", "B", "D"],
# 	"D": ["B", "C", "E"],
# 	"E": ["A", "B", "D"],
# }

# Hexogonal crown
# graph = {
# 	0: [5, 1],
# 	1: [0, 2],
# 	2: [1, 3],
# 	3: [2, 4],
# 	4: [3, 5],
# 	5: [4, 0],
# }

# Octogonal crown
# graph = {
# 	0: [7, 1, 5],
# 	1: [0, 2, 4],
# 	2: [1, 3, 7],
# 	3: [2, 4, 6],
# 	4: [3, 5, 1],
# 	5: [4, 6, 0],
# 	6: [5, 7, 3],
# 	7: [6, 0, 2],
# }

# 10 vertex crown
# graph = {
# 	1: [6, 7, 8],
# 	2: [5, 7, 8],
# 	3: [5, 6, 8],
# 	4: [5, 6, 7],
# 	5: [2, 3, 4],
# 	6: [1, 3, 4],
# 	7: [1, 2, 4],
# 	8: [1, 2, 3],
# }

graph = {
	't$9' : ['t$7'],
	't$8' : ['t$7'],
	't$3' : [],
	't$2' : ['t$1', 't$5'],
	't$1' : ['t$2'],
	't$0' : [],
	't$7' : ['t$9', 't$8'],
	't$6' : ['t$5'],
	't$5' : ['t$2', 't$6'],
}

# Create empty dictionary to map nodes to colors
node_colors = {}

# Get list of all nodes in the graphs
nodes = graph.keys()
nodes.sort(key=lambda node : len(graph[node]))
nodes.reverse()
print nodes

# Note: Items at beginning of color list are preferred colors
colors = [0]

# Set the color of the first node to 0
cur_node = nodes.pop(0)
node_colors[cur_node] = colors[0]

# Color every node in the graph
while nodes:
	cur_node = nodes.pop(0)

	# Check each color to see if it is valid
	best_color = -1
	for color in colors:
		is_color_valid = True
		adj_list = graph[cur_node]
		for adj_node in adj_list:
			if node_colors.has_key(adj_node):
				if node_colors[adj_node] == color:
					is_color_valid = False

		# If the color is valid, set best color and break
		if is_color_valid:
			best_color = color
			break
	# -- end for loop

	# If no valid color was found, add a new one to the list of colors
	if best_color == -1:
		colors.append(len(colors))
		best_color = colors[-1]

	# Set the color for the current node
	node_colors[cur_node] = best_color

# Output the resulting graph
for node in node_colors:
	print node, ":", node_colors[node]