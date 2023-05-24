<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Productos"%>
<%
    Productos productos = (Productos) request.getAttribute("productos");
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
                 <c:if test="${productos.id==0}">
                     Nuevo Registro
                 </c:if>  
                  <c:if test="${productos.id !=0}">
                     Editar Registro
                 </c:if>  
             </h1>
        <form action="Inicio" method="post">
            <input type="hidden" name="id" value="${productos.id}" />
            <table>
                <tr>
                    <td>Descripcion</td>
                    <td><input type="text" name="descripcion" value="${productos.descripcion}" /></td>
                </tr>
                <tr>
                    <td>Cantidad</td>
                    <td><input type="text" name="cantidad" value="${productos.cantidad}" /></td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="text" name="precio" value="${productos.precio}" /></td>
                </tr>
                
                <tr>
                    <td>Categoria</td>
                    <td><input type="text" name="categoria" value="${productos.categoria}" /></td>
                </tr>
                
                
                <tr>
                    <td></td>
                    <td><input type="submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
