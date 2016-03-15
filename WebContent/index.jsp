<%@ page import="store.DataManager" %>
<%--
  Created by IntelliJ IDEA.
  User: Peter
  Date: 04.10.13
  Time: 9:05
  To change this template use File | Settings | File Templates.
  This is important! 
  JSPs will be automatically compiled and placed into their own package. 
  This package is different from the “default” package. 
  Do not define any classes in the default package if you want to use them from within a JSP.
  There is no way to import from the “default” package to the JSP’s package.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students Store</title>
</head>
<body>
    <h1>Students Store</h1>
<p>Items available:</p>
    <%!
        public String liDecorator(String id, String name){
    		//encode id in the url
            return "<li><a href=\"show-product.jsp?id=" + id + "\">" + name + "</a></li>";
        }
    %>
<ul>
    <%
    	/*
    	*pre-defined variables: 
    	*application – gives access to the ServletContext object.
    	*out – gives access to a PrintWriter for the response.
    	*request – gives access to the HttpServletRequest object
    	*/
        DataManager dm = (DataManager) application.getAttribute(DataManager.ATTRIBUTE_NAME);
        for(DataManager.Product p: dm.getProductsList())
            out.print(liDecorator(p.id, p.name));
    %>

</ul>
</body>
</html>