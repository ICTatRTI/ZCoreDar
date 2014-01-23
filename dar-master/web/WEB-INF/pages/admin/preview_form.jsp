<%--
  ~    Copyright 2003, 2004, 2005, 2006 Research Triangle Institute
  ~
  ~    Licensed under the Apache License, Version 2.0 (the "License");
  ~    you may not use this file except in compliance with the License.
  ~    You may obtain a copy of the License at
  ~
  ~        http://www.apache.org/licenses/LICENSE-2.0
  --%>

<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tlds/zeprs.tld" prefix="zeprs" %>
<%@ taglib uri='/WEB-INF/tlds/struts-tiles.tld' prefix='template' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/struts-layout.tld" prefix="layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:useBean id="encounterForm" scope="request" type="org.rti.zcore.Form" />

<logic:present name="drugs" scope="request">
    <jsp:useBean id="drugs" scope="request" type="java.util.List" />
</logic:present>

<template:insert template='/WEB-INF/templates/${appTemplateDir}/template-admin.jsp'>
<template:put name='title' content='${encounterForm.label}' direct='true'/>
<template:put name='header' content='' direct='true'/>
<template:put name='content' direct='true'>

<c:choose>
<c:when test="${encounterForm.id == 80}">
    <div id="fullpageForm">
    <table>
        <tr>
            <td>
                <jsp:include page="../encounters/encounter_form_layout_long.jsp"/>
            </td>
        </tr>
    </table>
    </div>
    </c:when>
<c:otherwise>
<div id="forms">
    <jsp:include page="../encounters/encounter_form_layout_long.jsp"/>
</div>
</c:otherwise>
</c:choose>

</template:put>
</template:insert>