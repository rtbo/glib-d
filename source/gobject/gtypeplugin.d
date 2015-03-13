/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module gobject.gtypeplugin;

import gobject.gtype;

// #define G_TYPE_TYPE_PLUGIN		(g_type_plugin_get_type ())
// #define G_TYPE_PLUGIN(inst)		(G_TYPE_CHECK_INSTANCE_CAST ((inst), G_TYPE_TYPE_PLUGIN, GTypePlugin))
// #define G_TYPE_PLUGIN_CLASS(vtable)	(G_TYPE_CHECK_CLASS_CAST ((vtable), G_TYPE_TYPE_PLUGIN, GTypePluginClass))
// #define G_IS_TYPE_PLUGIN(inst)		(G_TYPE_CHECK_INSTANCE_TYPE ((inst), G_TYPE_TYPE_PLUGIN))
// #define G_IS_TYPE_PLUGIN_CLASS(vtable)	(G_TYPE_CHECK_CLASS_TYPE ((vtable), G_TYPE_TYPE_PLUGIN))
// #define G_TYPE_PLUGIN_GET_CLASS(inst)	(G_TYPE_INSTANCE_GET_INTERFACE ((inst), G_TYPE_TYPE_PLUGIN, GTypePluginClass))


alias GTypePluginUse = void function (GTypePlugin     *plugin);
alias GTypePluginUnuse = void function (GTypePlugin     *plugin);
alias GTypePluginCompleteTypeInfo = void function (GTypePlugin     *plugin,
						   GType            g_type,
						   GTypeInfo       *info,
						   GTypeValueTable *value_table);
alias GTypePluginCompleteInterfaceInfo = void function (GTypePlugin     *plugin,
						   GType            instance_type,
						   GType            interface_type,
						   GInterfaceInfo  *info);

struct GTypePluginClass
{
  /*< private >*/
  GTypeInterface		   base_iface;

  /*< public >*/
  GTypePluginUse		   use_plugin;
  GTypePluginUnuse		   unuse_plugin;
  GTypePluginCompleteTypeInfo	   complete_type_info;
  GTypePluginCompleteInterfaceInfo complete_interface_info;
}


/* --- prototypes --- */

pure GType	g_type_plugin_get_type			();

void	g_type_plugin_use			(GTypePlugin	 *plugin);

void	g_type_plugin_unuse			(GTypePlugin	 *plugin);

void	g_type_plugin_complete_type_info	(GTypePlugin     *plugin,
						 GType            g_type,
						 GTypeInfo       *info,
						 GTypeValueTable *value_table);

void	g_type_plugin_complete_interface_info	(GTypePlugin     *plugin,
						 GType            instance_type,
						 GType            interface_type,
						 GInterfaceInfo  *info);

