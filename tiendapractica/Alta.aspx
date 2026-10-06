<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alta.aspx.cs" Inherits="TiendaOnline.Alta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Alta de productos</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Alta de productos</h2>

            <div class="contenido">
                Nombre:
                <asp:TextBox ID="TextBoxNombre" runat="server"></asp:TextBox>

                Precio:
                <asp:TextBox ID="TextBoxPrecio" runat="server"></asp:TextBox>

                Categoría:
                <asp:DropDownList ID="DropDownListCategoria" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="descripcion" DataValueField="idCategoria"></asp:DropDownList>

                <asp:Button ID="ButtonConfirmar" runat="server" Text="Confirmar" OnClick="ButtonConfirmar_Click" />
                <asp:Label ID="LabelMensaje" runat="server"></asp:Label>
                <asp:HyperLink ID="HyperLinkVolver" runat="server" NavigateUrl="~/Default.aspx">Volver al inicio</asp:HyperLink>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server"
                ConnectionString="<%$ ConnectionStrings:conexion %>"
                SelectCommand="SELECT idCategoria, descripcion FROM categorias">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:conexion %>"
                InsertCommand="INSERT INTO productos (nombre, precio, categoria) VALUES (@nombre, @precio, @idCategoria)">
                <InsertParameters>
                    <asp:Parameter Name="nombre" />
                    <asp:Parameter Name="precio" />
                    <asp:Parameter Name="idCategoria" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>