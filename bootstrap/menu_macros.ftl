<#ftl strip_whitespace="true">
<#macro menu menu id pullRight=false maxDepth=9><#lt>
<#if menu??><#lt>
<ul id="${id}" class="nav ${menu.name} <#if pullRight>pull-right</#if>"><#lt>
<#list menu.rootMenuItems as mi><#lt>
<@menuItem mi mi_index mi_has_next false false false/><#lt>
</#list><#lt>
</ul><#lt>
<#else><#lt>
<!-- Menu not found -->
</#if><#lt>
</#macro><#lt>

<#macro menuItem item mi_index mi_has_next isChild=false childrenOnly=false skipChildren=false><#lt>
<#assign mi = item /><#lt>

<#assign liCss = "" /><#lt>

<#assign aCss = "" /><#lt>

<#if mi_index=0><#lt>
<#assign liCss = "${liCss}zfirst" /><#lt>
<#assign aCss = "" /><#lt>
</#if><#lt>

<#if mi.activeTrail && !mi.activeItem><#lt>
<#assign liCss = "${liCss} active-trail" /><#lt>
<#assign aCss = "${aCss} active-trail" /><#lt>
</#if><#lt>

<#if mi.activeItem><#lt>
<#assign liCss = "${liCss} active" /><#lt>
<#assign aCss = "${aCss} active" /><#lt>
</#if><#lt>

<#if mi_has_next = false><#lt>
<#assign liCss = "${liCss} zlast" /><#lt>
<#assign aCss = "${aCss} " /><#lt>
</#if><#lt>

<#assign showWithSubNav = !skipChildren && mi.hasChildren() />
<#if showWithSubNav = true><#lt>
<#assign liCss = "${liCss} dropdown" /><#lt>
<#assign aCss = "${aCss} dropdown-toggle" /><#lt>
</#if><#lt>

<#if liCss?? && liCss?length != 0><#lt>
</#if><#lt>

<#if aCss?? && aCss?length != 0><#lt>
</#if><#lt>

<#assign target = "${ctx}${mi.permalink}" /><#lt>
<#if mi.permalink?starts_with('#') || mi.permalink?starts_with('http')><#lt>
<#assign target="${mi.permalink}" /><#lt>
</#if><#lt>
<#assign navHeader = false /><#lt>
<#if target = "/nav-header"><#lt>
<#assign navHeader = true /><#lt>
<#assign liCss = "${liCss} nav-header" /><#lt>
<#assign target = "#" /><#lt>
</#if><#lt>

<#assign divider = false /><#lt>
<#assign linkTitle = "${mi.linkTitle}" /><#lt>
<#if mi.linkTitle = "menu-divider"><#lt>
<#assign linkTitle = "" /><#lt>
<#assign liCss = "${liCss} divider" /><#lt>
<#assign divider = true /><#lt>
</#if><#lt>

<#if showWithSubNav = true><#lt>
<#assign target = "#" /><#lt>
<#assign linkTitle = "${linkTitle} <strong class=\"caret\"></strong>" /><#lt>
</#if><#lt>

<#if !mi.hidden><#lt>
<#-- show with subnav; for cascading menus -->
<#assign printSubNav = true />

<#-- print menu item -->
<li class="${liCss!''}"><#lt>
<#if divider = false>
<#if navHeader = false>
<a <#if showWithSubNav>data-toggle="dropdown"</#if> href="${target}" class="<#if aCss?? && aCss?length != 0>${aCss}</#if>" <#if mi.linkTarget??><#if showWithSubNav><#else>target="${mi.linkTarget}"</#if> </#if>>${linkTitle}</a>
<#else>
${linkTitle}
</#if>
</#if>
<#if showWithSubNav>
<#if !childrenOnly || isChild>
<#lt>
</#if>
<ul class="dropdown-menu"><#lt>
<#lt><#list mi.children as child><#lt>
<@menuItem child child_index child_has_next true childrenOnly /><#lt>
</#list><#lt><#lt>
</ul><#lt>
<#if !childrenOnly || isChild>
<#lt>
</#if>
</#if>
</li><#lt>
</#if><#lt>
</#macro><#lt>