/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gtrashstack;


// #include <glib/gutils.h>
//
// G_BEGIN_DECLS
//
// typedef struct _GTrashStack GTrashStack;
// struct _GTrashStack
// {
//   GTrashStack *next;
// };
//
// G_INLINE_FUNC void      g_trash_stack_push   (GTrashStack **stack_p,
//                                               gpointer      data_p);
// G_INLINE_FUNC gpointer  g_trash_stack_pop    (GTrashStack **stack_p);
// G_INLINE_FUNC gpointer  g_trash_stack_peek   (GTrashStack **stack_p);
// G_INLINE_FUNC guint     g_trash_stack_height (GTrashStack **stack_p);
//
// #if defined (G_CAN_INLINE) || defined (__G_TRASH_STACK_C__)
//
// G_INLINE_FUNC void
// g_trash_stack_push (GTrashStack **stack_p,
//                     gpointer      data_p)
// {
//   GTrashStack *data = (GTrashStack *) data_p;
//
//   data->next = *stack_p;
//   *stack_p = data;
// }
// G_INLINE_FUNC gpointer
// g_trash_stack_pop (GTrashStack **stack_p)
// {
//   GTrashStack *data;
//
//   data = *stack_p;
//   if (data)
//     {
//       *stack_p = data->next;
//       /* NULLify private pointer here, most platforms store NULL as
//        * subsequent 0 bytes
//        */
//       data->next = NULL;
//     }
//
//   return data;
// }
// G_INLINE_FUNC gpointer
// g_trash_stack_peek (GTrashStack **stack_p)
// {
//   GTrashStack *data;
//
//   data = *stack_p;
//
//   return data;
// }
// G_INLINE_FUNC guint
// g_trash_stack_height (GTrashStack **stack_p)
// {
//   GTrashStack *data;
//   guint i = 0;
//
//   for (data = *stack_p; data; data = data->next)
//     i++;
//
//   return i;
// }
//
// #endif  /* G_CAN_INLINE || __G_TRASH_STACK_C__ */
//
// G_END_DECLS
//
