
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Productos"%>
<%
    List<Productos> productos = (List<Productos>)request.getAttribute("productos");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><center>
         <table border="8">
            <TH>
                <h1>SEGUNDO PARCIAL TEM-742</h1>
                <h2>NOMBRE: JOSE LUIS CHALCO</h2>
                <h2>CARNET: 8264286 L.P.</h2>
            </TH>
        </table>

        
        <h1>Productos Almacen</h1></center>
        <p><a href="Inicio?action=add">Nuevo</a></p>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Descripcion</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Categoria</th>
                
            </tr>
            <c:forEach var="item" items="${Productos}">
              <tr>
                <td>${item.id}</td>
                <td>${item.descripcion}</td>
                <td>${item.cantidad}</td>
                <td>${item.precio}</td>
                <td>${item.categoria}</td>
                <td><a href="Inicio?action=edit&id=${item.id}">Editar</a></td>
                <td><a href="Inicio?action=delete&id=${item.id}">Eliminar</a></td>
            </tr>              
            </c:forEach>
        </table>
    </body>
</html>
