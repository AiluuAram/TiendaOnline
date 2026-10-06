<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modificacion.aspx.cs" Inherits="TiendaOnline.Modificacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Modificación de productos</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Modificación de productos</h2>

            <div class="contenido">
                Código del producto:
                <asp:TextBox ID="TextBoxCodigo" runat="server"></asp:TextBox>
                <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" OnClick="ButtonBuscar_Click" />

                Nombre:
                <asp:TextBox ID="TextBoxNombre" runat="server"></asp:TextBox>

                Precio:
                <asp:TextBox ID="TextBoxPrecio" runat="server"></asp:TextBox>

                Categoría:
                <asp:DropDownList ID="DropDownListCategoria" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="descripcion" DataValueField="idCategoria"></asp:DropDownList>

                <asp:Button ID="ButtonGuardar" runat="server" Text="Guardar cambios" OnClick="ButtonGuardar_Click" />
                <asp:Label ID="LabelMensaje" runat="server"></asp:Label>
                <asp:HyperLink ID="HyperLinkVolver" runat="server" NavigateUrl="~/Default.aspx">Volver al inicio</asp:HyperLink>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:conexion %>"
                SelectCommand="SELECT nombre, precio, categoria FROM productos WHERE idProducto = @idProducto"
                UpdateCommand="UPDATE productos SET nombre = @nombre, precio = @precio, categoria = @idCategoria WHERE idProducto = @idProducto">
                <SelectParameters>
                    <asp:Parameter Name="idProducto" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" />
                    <asp:Parameter Name="precio" />
                    <asp:Parameter Name="idCategoria" />
                    <asp:Parameter Name="idProducto" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server"
                ConnectionString="<%$ ConnectionStrings:conexion %>"
                SelectCommand="SELECT idCategoria, descripcion FROM categorias">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>