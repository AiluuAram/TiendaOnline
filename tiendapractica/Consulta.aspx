<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="TiendaOnline.Consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Consulta de productos</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Listado de productos</h2>

            <div class="contenido">
                <asp:GridView ID="GridViewProductos" runat="server" DataSourceID="SqlDataSourceListado"></asp:GridView>
                <asp:HyperLink ID="HyperLinkVolver" runat="server" NavigateUrl="~/Default.aspx">Volver al inicio</asp:HyperLink>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceListado" runat="server"
                ConnectionString="<%$ ConnectionStrings:conexion %>"
                SelectCommand="SELECT p.idProducto AS Codigo, p.nombre AS Producto, p.precio AS Precio, c.descripcion AS Categoria
                               FROM productos AS p
                               JOIN categorias AS c ON c.idCategoria = p.categoria">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>