using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaOnline
{
    public partial class Baja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonEliminar_Click(object sender, EventArgs e)
        {
            // Guarda el nombre para mostrarlo en el mensaje
            string producto = DropDownListProductos.SelectedItem.Text;

            // Le pasa al DELETE el código del producto elegido y lo ejecuta
            SqlDataSourceProductos.DeleteParameters["idProducto"].DefaultValue = DropDownListProductos.SelectedValue;
            SqlDataSourceProductos.Delete();

            // Avisa y recarga la lista para que ya no aparezca
            LabelMensaje.Text = "Se eliminó el producto: " + producto;
            DropDownListProductos.DataBind();
        }
    }
}
