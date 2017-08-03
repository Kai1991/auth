<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      </div>

    </div> <!-- END #container -->
    
    <script src="${ctx}/bootstrap/js/jquery-1.11.0.min.js"></script>

    <spring:theme code="cas.javascript.file" var="casJavascriptFile" text="" />
    <script type="text/javascript" src="<c:url value="${casJavascriptFile}" />"></script>
  </body>
</html>