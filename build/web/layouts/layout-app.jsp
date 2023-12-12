<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String content = (String) request.getAttribute("content"); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/lib/bootstrap/css/bootstrap.min.css">
    <title>Meuble Project</title>
  </head>
  <body>

    <main id="content">
        <% if (content.equalsIgnoreCase("insertion-matiere")) { %>
          <%@ include file="../pages/insertion-matiere.jsp" %>

        <% } else if(content.equalsIgnoreCase("insertion-style")) { %>
          <%@ include file="../pages/insertion-style.jsp" %>
          
        <% } else if(content.equalsIgnoreCase("matiere-style")) { %>
          <%@ include file="../pages/matiere-style.jsp" %>
        <% } %>
    </main>

    <script src="./assets/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/script.js"></script>
  </body>
</html>
