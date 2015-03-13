/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gnode;

import glib.gmem;
import glib.gtypes;


/* Tree traverse flags */
enum GTraverseFlags
{
  G_TRAVERSE_LEAVES     = 1 << 0,
  G_TRAVERSE_NON_LEAVES = 1 << 1,
  G_TRAVERSE_ALL        = G_TRAVERSE_LEAVES | G_TRAVERSE_NON_LEAVES,
  G_TRAVERSE_MASK       = 0x03,
  G_TRAVERSE_LEAFS      = G_TRAVERSE_LEAVES,
  G_TRAVERSE_NON_LEAFS  = G_TRAVERSE_NON_LEAVES
}

/* Tree traverse orders */
enum GTraverseType
{
  G_IN_ORDER,
  G_PRE_ORDER,
  G_POST_ORDER,
  G_LEVEL_ORDER
}


extern (C) {

    alias GNodeTraverseFunc = gboolean function (GNode *node, gpointer data);

    alias GNodeForeachFunc = void function (GNode *node, gpointer data);

    alias GCopyFunc = gpointer function (gconstpointer src, gpointer data);

}

struct GNode
{
  gpointer data;
  GNode	  *next;
  GNode	  *prev;
  GNode	  *parent;
  GNode	  *children;
}


bool G_NODE_IS_ROOT(const(GNode) *n) {
    return n.parent is null && n.prev is null && n.next is null;
}

bool G_NODE_IS_LEAF(const(GNode) *n) {
    return n.children is null;
}


extern (C) {

    GNode*	 g_node_new		(gpointer	   data);

    void	 g_node_destroy		(GNode		  *root);

    void	 g_node_unlink		(GNode		  *node);

    GNode*   g_node_copy_deep       (GNode            *node,
                     GCopyFunc         copy_func,
                     gpointer          data);

    GNode*   g_node_copy            (GNode            *node);

    GNode*	 g_node_insert		(GNode		  *parent,
                     gint		   position,
                     GNode		  *node);

    GNode*	 g_node_insert_before	(GNode		  *parent,
                     GNode		  *sibling,
                     GNode		  *node);

    GNode*   g_node_insert_after    (GNode            *parent,
                     GNode            *sibling,
                     GNode            *node);

    GNode*	 g_node_prepend		(GNode		  *parent,
                     GNode		  *node);

    guint	 g_node_n_nodes		(GNode		  *root,
                     GTraverseFlags	   flags);

    GNode*	 g_node_get_root	(GNode		  *node);

    gboolean g_node_is_ancestor	(GNode		  *node,
                     GNode		  *descendant);

    guint	 g_node_depth		(GNode		  *node);

    GNode*	 g_node_find		(GNode		  *root,
                     GTraverseType	   order,
                     GTraverseFlags	   flags,
                     gpointer	   data);

}


auto g_node_append(P, N)(P parent, N node) {
    return g_node_insert_before(parent, null, node);
}

auto g_node_insert_data(P, Pos, D)(P parent, Pos pos, D data) {
    return g_node_insert(parent, pos, g_node_new(data));
}

auto g_node_insert_data_after(P, S, D)(P parent, S sibling, D data) {
     return g_node_insert_after ((parent), (sibling), g_node_new (data));
}

auto g_node_insert_data_before(P, S, D)(P parent, S sibling, D data) {
     return g_node_insert_before (parent, sibling, g_node_new (data));
}

auto g_node_prepend_data(P, D)(P parent, D data) {
     return g_node_prepend (parent, g_node_new (data));
}

auto g_node_append_data(P, D)(P parent, D data) {
     return g_node_insert_before (parent, null, g_node_new (data));
}


extern (C) {

    void	 g_node_traverse	(GNode		  *root,
                     GTraverseType	   order,
                     GTraverseFlags	   flags,
                     gint		   max_depth,
                     GNodeTraverseFunc func,
                     gpointer	   data);

    guint	 g_node_max_height	 (GNode *root);


    void	 g_node_children_foreach (GNode		  *node,
                      GTraverseFlags   flags,
                      GNodeForeachFunc func,
                      gpointer	   data);

    void	 g_node_reverse_children (GNode		  *node);

    guint	 g_node_n_children	 (GNode		  *node);

    GNode*	 g_nodenth_child	 (GNode		  *node,
                      guint		   n);

    GNode*	 g_node_last_child	 (GNode		  *node);

    GNode*	 g_node_find_child	 (GNode		  *node,
                      GTraverseFlags   flags,
                      gpointer	   data);

    gint	 g_node_child_position	 (GNode		  *node,
                      GNode		  *child);

    gint	 g_node_child_index	 (GNode		  *node,
                      gpointer	   data);


    GNode*	 g_node_first_sibling	 (GNode		  *node);

    GNode*	 g_node_last_sibling	 (GNode		  *node);

}

auto g_node_prev_sibling(N)(N node) {
    return node ? node.prev : null;
}

auto g_node_next_sibling(N)(N node) {
    return node ? node.next : null;
}

auto g_node_first_child(N)(N node) {
    return node ? node.children : null;
}

