using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaOnline
{
    public partial class Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonConfirmar_Click(object sender, EventArgs e)
        {
            // Si falta el nombre o el precio, avisa y no guarda
            if (TextBoxNombre.Text == "" || TextBoxPrecio.Text == "")
            {
                LabelMensaje.Text = "Completá nombre y precio.";
                return;
            }

            // Llena los parámetros del INSERT con lo que escribió el usuario
            SqlDataSourceProductos.InsertParameters["nombre"].DefaultValue = TextBoxNombre.Text;
            SqlDataSourceProductos.InsertParameters["precio"].DefaultValue = TextBoxPrecio.Text;
            SqlDataSourceProductos.InsertParameters["idCategoria"].DefaultValue = DropDownListCategoria.SelectedValue;

            // Ejecuta el INSERT en la base
            SqlDataSourceProductos.Insert();

            // Avisa y limpia las cajas
            LabelMensaje.Text = "Se cargó el producto.";
            TextBoxNombre.Text = "";
            TextBoxPrecio.Text = "";
        }
    }
}