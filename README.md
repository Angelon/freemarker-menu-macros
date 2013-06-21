freemarker-menu-macros
======================

A library of menu macro modifications for freemarker templates


The following covers information for using all menu macros.
_______________________________

Assigning a variable:

    <#assign varname = value /><#lt>

Syntax for adding to a variable

    <#assign varname = "${varname} additional text" /><#lt>


Documentation for default menu_macros implementation.

* liCss - Text for the "class" field of the list item element.
* aCss - Text in the "class" field the link element.
* mi_index - Index of current item in the menu.
* mi.activeTrail - Is true if item is in the hierarchy of the current active item.
* mi.activeItem - Is true if item is the current active page.
* mi.hasChildren() - Is true if the current menu item has children.
* skipChildren - Populated at the start of the macro. Allows you to skip all children and generate only a single level menu.
* showWithSubNav - Determined by the status of mi.hasChildren() and skipChildren - used to determine if the submenus should be generated.


    <#if menu_primary_links??>
    	<@m.menu menu_primary_links "mainmenu" />
    </#if>

if menu_[name of your xml menu]

    <#macro menu menu id maxDepth=9><#lt>
    	[some code goes here]
    </#macro><#lt>

Macros can be defined by using the following syntax
    <#macro [macroname] [parameter] [parameter]><#lt>

Parameters are then used later on.

In this example:
* menu is "menu_primary_links"faq-top-of-form
* id is "mainmenu"
* maxDepth is auto assigned to 9, but can be overridden

    <#list xmlNodeToParse as variablename><#lt>