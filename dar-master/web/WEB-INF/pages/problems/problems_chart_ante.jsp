<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='/WEB-INF/tlds/struts-tiles.tld' prefix='template' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fn" uri='/WEB-INF/fn.tld' %>

<c:choose>
<c:when test="${empty param.patientId}">
<logic:present name="zeprs_session" property="patient">
<c:set var="patientId" value="${zeprs_session.patient.id}"/>
</logic:present>
<logic:notPresent name="zeprs_session" property="patient">
<c:set var="patientId" value="0"/>
</logic:notPresent>
</c:when>
<c:otherwise>
<c:set var="patientId" value="${param.patientId}"/>
</c:otherwise>
</c:choose>
<c:url value="problem.do"  var="probUrl">
    <c:param name="patientId" value="${patientId}"/>
    <c:param name="problemType" value="problem"/>
    <c:param name="mode" value="create"/>
</c:url>
<div id="anteProbChart">
<h2>Problem List
<logic:present name="zeprs_session" property="pregnancy">
    <c:if test="${empty zeprs_session.pregnancy.datePregnancyEnd}"> | <a href='<c:out value="/${appName}/${probUrl}"/>'>Create Problem</a></h2></c:if>
</logic:present>
<div id="anteProbList">
   <table class="enhancedtable" width="100%">
        <tr>
            <th colspan="2">Active Problems</th>
        </tr>
    </table>
   <div id="anteProbListItems">
    <logic:empty name="activeProblems">
    <table class="enhancedtable" width="100%">
    <tr><td colspan="2"><span style="color:red">No active problems</span></td></tr></logic:empty>
    <logic:notEmpty name="activeProblems">
    <table class="enhancedtable" width="240px">
    <tr>
        <td class="enhancedtableheader">Problem</td>
        <td class="enhancedtableheader">Date Created</td>
    </tr>
<logic:iterate id="thisproblem" name="activeProblems">
<c:url value="problem.do"  var="myUrl">
    <c:choose>
        <c:when test="${thisproblem.class.name=='org.rti.zcore.Problem'}">
        <c:param name="problemId" value="${thisproblem.id}"/>
        <c:param name="patientId" value="${thisproblem.patient.id}"/>
        <c:param name="problemType" value="problem"/>
        </c:when>
        <c:otherwise>
        <c:param name="problemId" value="${thisproblem.id}"/>
        <c:param name="patientId" value="${thisproblem.patientId}"/>
        <c:param name="problemType" value="outcome"/>
        </c:otherwise>
    </c:choose>
    <c:param name="mode" value="create"/>
    <c:if test="${status=='false'}">
     <c:param name="status" value="false"/>
    </c:if>
</c:url>
<c:url value="problem.do"  var="editUrl">
    <c:choose>
        <c:when test="${thisproblem.class.name=='org.rti.zcore.Problem'}">
        <c:param name="problemId" value="${thisproblem.id}"/>
        <c:param name="patientId" value="${thisproblem.patient.id}"/>
        <c:param name="problemType" value="problem"/>
        </c:when>
        <c:otherwise>
        <c:param name="problemId" value="${thisproblem.id}"/>
        <c:param name="patientId" value="${thisproblem.patientId}"/>
        <c:param name="problemType" value="outcome"/>
        </c:otherwise>
    </c:choose>
    <c:param name="mode" value="edit"/>
    <c:if test="${status=='false'}">
     <c:param name="status" value="false"/>
    </c:if>
</c:url>
    <c:choose>
        <c:when test="${thisproblem.class.name=='org.rti.zcore.Problem'}">
            <c:choose>
            <c:when test="${problemId==thisproblem.id && outcome!=1}">
                <c:set var="currproblemName" value="${thisproblem.problemName}" scope="request"/>
                <c:forTokens items="${thisproblem.onsetDate}" delims="-" var="onset" varStatus="i">
                    <c:choose>
                        <c:when test="${i.index==0}">
                        <c:set var="onsetYear" value="${onset}" scope="request"/>
                        </c:when>
                        <c:when test="${i.index==1}">
                        <c:set var="onsetMonth" value="${onset}" scope="request"/>
                        </c:when>
                        <c:when test="${i.index==2}">
                        <c:set var="onsetDate" value="${onset}" scope="request"/>
                        </c:when>
                    </c:choose>
                </c:forTokens>
                <c:set var="curronsetDate" value="${thisproblem.onsetDate}" scope="request"/>
                <c:set var="curractive" value="${thisproblem.active}" scope="request"/>
                <tr class="currentProblem">
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.problemName}</a></td>
                    <td><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}"/></td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.problemName}</a></td>
                    <td width="50px" ><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}"/></td>
                </tr>
            </c:otherwise>
         </c:choose>
    </c:when>
        <c:when test="${thisproblem.class.name=='org.zeprs.rules.impl.EncounterOutcome'}">
            <c:choose>
                <c:when test="${problemId==thisproblem.id && outcome==1}">
                <c:set var="currproblemName" value="${thisproblem.form.label}" scope="request"/>
                <c:set var="curractive" value="${thisproblem.active}" scope="request"/>
                <c:set var="currform" value="${thisproblem.formId}" scope="request"/>
                <c:set var="currencounterId" value="${thisproblem.encounterId}" scope="request"/>
                <c:set var="currclass" value="${thisproblem.class.name}" scope="request"/>
                <tr class="currentProblem">
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>Form Request: ${thisproblem.form.label}</a></td>
                    <td width="50px" ><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                </tr>
                </c:when>
                <c:otherwise>
                <tr>
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>Form Request: ${thisproblem.form.label}</a></td>
                    <td width="50px" ><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                </tr>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:when test="${thisproblem.class.name=='org.cidrz.webapp.dynasite.rules.impl.ReferralOutcome'}">
            <c:choose>
                <c:when test="${problemId==thisproblem.id && outcome==1}">
                <c:set var="currproblemName" value="${thisproblem.reason}" scope="request"/>
                <c:set var="curractive" value="${thisproblem.active}" scope="request"/>
                <c:set var="currencounterId" value="${thisproblem.encounterId}" scope="request"/>
                <c:set var="currclass" value="${thisproblem.class.name}" scope="request"/>
                <tr class="currentProblem">
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.reason}</a> <a href='<c:out value="/${appName}/${editUrl}"/>'>(e)</a></td>
                    <td width="50px"><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                </tr>
                </c:when>
                <c:otherwise>
                <tr>
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.reason}</a></td>
                    <td width="50px"><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                </tr>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:when test="${thisproblem.class.name=='org.cidrz.webapp.dynasite.rules.impl.InfoOutcome'}">
            <c:choose>
                <c:when test="${problemId==thisproblem.id && outcome==1}">
                    <c:set var="currproblemName" value="${thisproblem.message}" scope="request"/>
                    <c:set var="curractive" value="${thisproblem.active}" scope="request"/>
                    <c:set var="currencounterId" value="${thisproblem.encounterId}" scope="request"/>
                    <c:set var="currclass" value="${thisproblem.class.name}" scope="request"/>
                    <tr class="currentProblem">
                        <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.message}</a></td>
                    <td width="50px"><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.message}</a></td>
                        <td width="50px"><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:when test="${thisproblem.class.name=='org.rti.zcore.Task'}">
        <tr>
        <td colspan="2"><html:link action="form${thisproblem.formId}/new.do">Missing Form: ${thisproblem.label}</html:link></td>
        </tr>
        </c:when>
</c:choose>
</logic:iterate>

</logic:notEmpty>
</table>
        </div>
    </div>


<%--Now list Inactive Problems--%>
<logic:notEmpty name="inactiveProblems">
<div id="anteInactiveProbList">
    <table class="enhancedtable" width="100%">
        <tr>
            <th colspan="2">Inactive Problems</th>
        </tr>
    </table>
   <div id="anteInactiveProbListItems">
    <logic:empty name="inactiveProblems">
    <table class="enhancedtable" width="100%">
    <tr><td colspan="2"><span style="color:red">No inactive problems</span></td></tr>
    </logic:empty>
    <logic:notEmpty name="inactiveProblems">
    <table class="enhancedtable" width="240px">
    <tr>
        <td class="enhancedtableheader">Problem</td>
        <td class="enhancedtableheader">Date Created</td>
    </tr>
<logic:iterate id="thisproblem" name="inactiveProblems">
<c:url value="problem.do"  var="myUrl">
    <c:choose>
        <c:when test="${thisproblem.class.name=='org.rti.zcore.Problem'}">
        <c:param name="problemId" value="${thisproblem.id}"/>
        <c:param name="patientId" value="${thisproblem.patient.id}"/>
        <c:param name="problemType" value="problem"/>
        </c:when>
        <c:otherwise>
        <c:param name="problemId" value="${thisproblem.id}"/>
        <c:param name="patientId" value="${thisproblem.patientId}"/>
        <c:param name="problemType" value="outcome"/>
        </c:otherwise>
    </c:choose>
    <c:param name="mode" value="create"/>
    <c:if test="${status=='false'}">
     <c:param name="status" value="false"/>
    </c:if>
</c:url>
<c:url value="problem.do"  var="editUrl">
    <c:choose>
        <c:when test="${thisproblem.class.name=='org.rti.zcore.Problem'}">
        <c:param name="problemId" value="${thisproblem.id}"/>
        <c:param name="patientId" value="${thisproblem.patient.id}"/>
        <c:param name="problemType" value="problem"/>
        </c:when>
        <c:otherwise>
        <c:param name="problemId" value="${thisproblem.id}"/>
        <c:param name="patientId" value="${thisproblem.patientId}"/>
        <c:param name="problemType" value="outcome"/>
        </c:otherwise>
    </c:choose>
    <c:param name="mode" value="edit"/>
    <c:if test="${status=='false'}">
     <c:param name="status" value="false"/>
    </c:if>
</c:url>
    <c:choose>
        <c:when test="${thisproblem.class.name=='org.rti.zcore.Problem'}">
            <c:choose>
            <c:when test="${problemId==thisproblem.id && outcome!=1}">
                <c:set var="currproblemName" value="${thisproblem.problemName}" scope="request"/>
                <c:forTokens items="${thisproblem.onsetDate}" delims="-" var="onset" varStatus="i">
                    <c:choose>
                        <c:when test="${i.index==0}">
                        <c:set var="onsetYear" value="${onset}" scope="request"/>
                        </c:when>
                        <c:when test="${i.index==1}">
                        <c:set var="onsetMonth" value="${onset}" scope="request"/>
                        </c:when>
                        <c:when test="${i.index==2}">
                        <c:set var="onsetDate" value="${onset}" scope="request"/>
                        </c:when>
                    </c:choose>
                </c:forTokens>
                <c:set var="curronsetDate" value="${thisproblem.onsetDate}" scope="request"/>
                <c:set var="curractive" value="${thisproblem.active}" scope="request"/>
                <tr class="currentProblem">
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.problemName}</a></td>
                    <td><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}"/></td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.problemName}</a></td>
                    <td width="50px" ><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}"/></td>
                </tr>
            </c:otherwise>
         </c:choose>
    </c:when>
        <c:when test="${thisproblem.class.name=='org.cidrz.webapp.dynasite.rules.impl.EncounterOutcome'}">
            <c:choose>
                <c:when test="${problemId==thisproblem.id && outcome==1}">
                <c:set var="currproblemName" value="${thisproblem.form.label}" scope="request"/>
                <c:set var="curractive" value="${thisproblem.active}" scope="request"/>
                <c:set var="currform" value="${thisproblem.formId}" scope="request"/>
                <c:set var="currencounterId" value="${thisproblem.encounterId}" scope="request"/>
                <c:set var="currclass" value="${thisproblem.class.name}" scope="request"/>
                <tr class="currentProblem">
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>Form Request: ${thisproblem.form.label}</a></td>
                    <td width="50px" ><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                </tr>
                </c:when>
                <c:otherwise>
                <tr>
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>Form Request: ${thisproblem.form.label}</a></td>
                    <td width="50px" ><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                </tr>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:when test="${thisproblem.class.name=='org.cidrz.webapp.dynasite.rules.impl.ReferralOutcome'}">
            <c:choose>
                <c:when test="${problemId==thisproblem.id && outcome==1}">
                <c:set var="currproblemName" value="${thisproblem.reason}" scope="request"/>
                <c:set var="curractive" value="${thisproblem.active}" scope="request"/>
                <c:set var="currencounterId" value="${thisproblem.encounterId}" scope="request"/>
                <c:set var="currclass" value="${thisproblem.class.name}" scope="request"/>
                <tr class="currentProblem">
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.reason}</a> <a href='<c:out value="/${appName}/${editUrl}"/>'>(e)</a></td>
                    <td width="50px"><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                </tr>
                </c:when>
                <c:otherwise>
                <tr>
                    <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.reason}</a></td>
                    <td width="50px"><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                </tr>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:when test="${thisproblem.class.name=='org.cidrz.webapp.dynasite.rules.impl.InfoOutcome'}">
            <c:choose>
                <c:when test="${problemId==thisproblem.id && outcome==1}">
                    <c:set var="currproblemName" value="${thisproblem.message}" scope="request"/>
                    <c:set var="curractive" value="${thisproblem.active}" scope="request"/>
                    <c:set var="currencounterId" value="${thisproblem.encounterId}" scope="request"/>
                    <c:set var="currclass" value="${thisproblem.class.name}" scope="request"/>
                    <tr class="currentProblem">
                        <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.message}</a></td>
                    <td width="50px"><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td><a href='<c:out value="/${appName}/${editUrl}"/>'>${thisproblem.message}</a></td>
                        <td width="50px"><fmt:formatDate type="both" pattern="dd MMM yy" value="${thisproblem.auditInfo.created}" /></td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:when>
</c:choose>
</logic:iterate>
</logic:notEmpty>
            </table>
        </div>
    </div>
</logic:notEmpty>
<c:import url="comments.jsp" />
</div>