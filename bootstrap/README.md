freemarker-menu-macros for Twitter Bootstrap
======================

Documentation specific to the Twitter Bootstrap implementation.
______________________

### Building a menu

The following code is the structure required to invoke a nav bar menu on any page.  Note the html elements containing the call to the menu macro.   The element with the class "navbar", and everything it contains are required by Bootstrap for creating a horizontal nav bar menu.

    <div class="row">
      <div class="span12">
        <div id="top-nav" class="navbar">
          <div id="mainmenu-container" class="navbar-inner">
            <#if menu_primary_links??>
              <@m.menu menu_primary_links "mainmenu" />
            </#if>
          </div>
        </div>
      </div>
    </div>



In the following code you can see the menu macro we most often invoke for the menu and the options available.


    <#macro menu menu id navType="nav" pullRight=false maxDepth=9><#lt>
        <#if menu??><#lt>
            <ul id="${id}" class="${navType} ${menu.name} <#if pullRight>pull-right</#if>"><#lt>
                <#list menu.rootMenuItems as mi><#lt>
                    <@menuItem mi mi_index mi_has_next false false false/><#lt>
                </#list><#lt>
            </ul><#lt>
        <#else><#lt>
        </#if><#lt>
    </#macro><#lt>
    
    
    
Remember, macros are defined by 

    <#macro [macroname] [parameter] [parameter]><#lt>

* The first "menu" is the name of the macro.
* The second "menu" represents the XML menu object that is used to build the menu.
* id - The value for the ID attribute in the HTML
* navType - The value for the "class" attribute in the HTML.  Automatically set to "nav" if you don't specify anything.
* pullRight - Specific to Bootstrap.  Setting this to "true" will force this menu to align to the right side of the container.  Automatically set to "false" if you don't specify anything.

The following code checks for the existence of the XML menu, and then builds a right aligned menu with an id of "side-menu" and a class of "nav nav-list".  These class definitions help Bootstrap know to create a vertical list out of the menu.

    <#if menu_primary_links??>
      <@m.menu menu_primary_links "side-menu" "nav nav-list" true />
    </#if>

### Variables

navHeader - Is true if the "linkPath" field in the XML is "nav-header".
If navHeader is true, the value of the "linkTitle" field is used as the list item content instead of a link

divider - Is true if the "linkTitle" field in the XML is "menu-divider".
