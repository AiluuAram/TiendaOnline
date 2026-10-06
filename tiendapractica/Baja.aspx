<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baja.aspx.cs" Inherits="TiendaOnline.Baja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Baja de productos</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Baja de productos</h2>

            <div class="contenido">
                Producto a eliminar:
                <asp:DropDownList ID="DropDownListProductos" runat="server" DataSourceID="SqlDataSourceProductos" DataTextField="nombre" DataValueField="idProducto"></asp:DropDownList>

                <asp:Button ID="ButtonEliminar" runat="server" Text="Eliminar" OnClick="ButtonEliminar_Click"
                    OnClientClick="return confirm('¿Seguro que querés eliminar este producto?');" />
                <asp:Label ID="LabelMensaje" runat="server"></asp:Label>
                <asp:HyperLink ID="HyperLinkVolver" runat="server" NavigateUrl="~/Default.aspx">Volver al inicio</asp:HyperLink>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:conexion %>"
                SelectCommand="SELECT idProducto, nombre FROM productos"
                DeleteCommand="DELETE FROM productos WHERE idProducto = @idProducto">
                <DeleteParameters>
                    <asp:Parameter Name="idProducto" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>