/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.garray;

import glib.gtypes;



struct GBytes;

struct GArray
{
    gchar* data;
    guint len;
}

struct GByteArray
{
    guint8 *data;
    guint len;
}

struct GPtrArray
{
  gpointer *pdata;
  guint	    len;
}

auto g_array_append_val(A, V)(A a, V v)
{
    return g_array_append_vals(a, &v, 1);
}

auto g_array_prepend_val(A, V)(A a, V v)
{
    return g_array_prepend_vals(a, &v, 1);
}

auto g_array_insert_val(A, I, V)(A a, I i, V v)
{
    return g_array_insert_vals(a, i, &v, 1);
}

auto g_array_index(A, I, T)(A a, I i)
{
    // TODO: check this
    return cast(T*)(a.data[i*T.sizeof]);
}
// #define g_array_index(a,t,i)      (((t*) (void *) (a)->data) [(i)])


extern(C) {

    GArray* g_array_new (gboolean zero_terminated,
                       gboolean clear_,
                       guint element_size);
    GArray* g_array_sized_new (gboolean zero_terminated,
                       gboolean clear_,
                       guint element_size,
                       guint reserved_size);

    gchar* g_array_free (GArray *array,
                       gboolean free_segment);

    GArray *g_array_ref (GArray *array);

    void g_array_unref (GArray *array);

    guint g_array_get_element_size (GArray *array);

    GArray* g_array_append_vals (GArray *array,
                       gconstpointer data,
                       guint len);

    GArray* g_array_prepend_vals (GArray *array,
                       gconstpointer data,
                       guint len);

    GArray* g_array_insert_vals (GArray *array,
                       guint index_,
                       gconstpointer data,
                       guint len);

    GArray* g_array_set_size (GArray *array,
                       guint length);

    GArray* g_array_remove_index (GArray *array,
                       guint             index_);

    GArray* g_array_remove_index_fast (GArray *array,
                       guint index_);

    GArray* g_array_remove_range (GArray *array,
                       guint index_,
                       guint length);

    void g_array_sort (GArray *array,
                       GCompareFunc compare_func);

    void g_array_sort_with_data (GArray *array,
                       GCompareDataFunc compare_func,
                       gpointer user_data);

    void g_array_set_clear_func (GArray *array,
                                 GDestroyNotify clear_func);

    extern(D) {
        auto g_ptr_array_index(A, I)(A a, I i)
        { return a.pdata[i]; }
    }

    GPtrArray* g_ptr_array_new ();

    GPtrArray* g_ptr_array_new_with_free_func (GDestroyNotify element_free_func);

    GPtrArray* g_ptr_array_sized_new (guint reserved_size);

    GPtrArray* g_ptr_array_new_full (guint reserved_size,
                                     GDestroyNotify element_free_func);

    gpointer*  g_ptr_array_free (GPtrArray *array,
                                 gboolean free_seg);

    GPtrArray* g_ptr_array_ref (GPtrArray *array);

    void g_ptr_array_unref (GPtrArray *array);

    void g_ptr_array_set_free_func (GPtrArray *array,
                                    GDestroyNotify element_free_func);

    void g_ptr_array_set_size (GPtrArray *array,
                               gint length);

    gpointer g_ptr_array_remove_index (GPtrArray *array,
                                       guint index_);

    gpointer g_ptr_array_remove_index_fast (GPtrArray *array,
                                            guint index_);

    gboolean g_ptr_array_remove (GPtrArray *array,
                                 gpointer data);

    gboolean g_ptr_array_remove_fast (GPtrArray *array,
                                      gpointer data);

    GPtrArray *g_ptr_array_remove_range (GPtrArray *array,
                                         guint index_,
                                         guint length);

    void g_ptr_array_add (GPtrArray *array,
                           gpointer data);

    void g_ptr_array_insert (GPtrArray *array,
                             gint index_,
                             gpointer data);

    void g_ptr_array_sort (GPtrArray *array,
                           GCompareFunc compare_func);

    void g_ptr_array_sort_with_data (GPtrArray *array,
                                     GCompareDataFunc  compare_func,
                                     gpointer user_data);

    void g_ptr_array_foreach (GPtrArray *array,
                              GFunc func,
                              gpointer user_data);



    GByteArray* g_byte_array_new ();

    GByteArray* g_byte_array_new_take (guint8 *data,
                                       gsize len);

    GByteArray* g_byte_array_sized_new (guint reserved_size);

    guint8* g_byte_array_free (GByteArray *array,
                               gboolean free_segment);

    GBytes* g_byte_array_free_to_bytes (GByteArray *array);

    GByteArray *g_byte_array_ref (GByteArray *array);

    void g_byte_array_unref (GByteArray *array);

    GByteArray* g_byte_array_append (GByteArray *array,
                                     const(guint8) *data,
                                     guint len);

    GByteArray* g_byte_array_prepend (GByteArray *array,
                                      const(guint8) *data,
                                      guint len);

    GByteArray* g_byte_array_set_size (GByteArray *array,
                                       guint length);

    GByteArray* g_byte_array_remove_index (GByteArray *array,
                                           guint index_);

    GByteArray* g_byte_array_remove_index_fast (GByteArray *array,
                                                guint index_);

    GByteArray* g_byte_array_remove_range (GByteArray *array,
                                           guint index_,
                                           guint length);

    void g_byte_array_sort (GByteArray *array,
                            GCompareFunc compare_func);

    void g_byte_array_sort_with_data (GByteArray *array,
                                      GCompareDataFunc compare_func,
                                      gpointer user_data);

} // extern (C)
