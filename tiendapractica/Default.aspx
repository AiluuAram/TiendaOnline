<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TiendaOnline.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tienda Online</title>
    <link href="estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Tienda Online</h2>

            <div class="menu">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Alta.aspx">Alta de productos</asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Baja.aspx">Baja de productos</asp:HyperLink>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Modificacion.aspx">Modificación de productos</asp:HyperLink>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Consulta.aspx">Consulta de productos</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
