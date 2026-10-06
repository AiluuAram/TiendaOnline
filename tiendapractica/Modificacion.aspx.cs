using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaOnline
{
    public partial class Modificacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonBuscar_Click(object sender, EventArgs e)
        {
            // Verifica que el código sea un número
            int codigo;
            if (!int.TryParse(TextBoxCodigo.Text, out codigo))
            {
                LabelMensaje.Text = "Ingresá un código numérico.";
                return;
            }

            // Busca el producto en la base
            SqlDataSourceProductos.SelectParameters["idProducto"].DefaultValue = TextBoxCodigo.Text;
            SqlDataSourceProductos.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)SqlDataSourceProductos.Select(DataSourceSelectArguments.Empty);

            if (registros.Read())
            {
                // Muestra los datos en los campos para editarlos
                TextBoxNombre.Text = registros["nombre"].ToString();
                TextBoxPrecio.Text = Convert.ToDecimal(registros["precio"]).ToString("0");
                DropDownListCategoria.DataBind();
                DropDownListCategoria.SelectedValue = registros["categoria"].ToString();

                // Guarda los valores originales para comparar después
                ViewState["id"] = TextBoxCodigo.Text;
                ViewState["nombre"] = TextBoxNombre.Text;
                ViewState["precio"] = TextBoxPrecio.Text;
                ViewState["categoria"] = DropDownListCategoria.SelectedValue;

                LabelMensaje.Text = "";
            }
            else
            {
                LabelMensaje.Text = "No existe un producto con ese código.";
            }

            registros.Close();
        }

        protected void ButtonGuardar_Click(object sender, EventArgs e)
        {
            // Si todavía no buscó ningún producto
            if (ViewState["id"] == null)
            {
                LabelMensaje.Text = "Primero buscá un producto.";
                return;
            }

            // Validación: al menos un campo tiene que haber cambiado
            if (TextBoxNombre.Text == ViewState["nombre"].ToString() &&
                TextBoxPrecio.Text == ViewState["precio"].ToString() &&
                DropDownListCategoria.SelectedValue == ViewState["categoria"].ToString())
            {
                LabelMensaje.Text = "No modificaste ningún campo.";
                return;
            }

            // Llena los parámetros del UPDATE y lo ejecuta
            SqlDataSourceProductos.UpdateParameters["nombre"].DefaultValue = TextBoxNombre.Text;
            SqlDataSourceProductos.UpdateParameters["precio"].DefaultValue = TextBoxPrecio.Text;
            SqlDataSourceProductos.UpdateParameters["idCategoria"].DefaultValue = DropDownListCategoria.SelectedValue;
            SqlDataSourceProductos.UpdateParameters["idProducto"].DefaultValue = ViewState["id"].ToString();
            SqlDataSourceProductos.Update();

            // Los valores nuevos pasan a ser los "originales"
            ViewState["nombre"] = TextBoxNombre.Text;
            ViewState["precio"] = TextBoxPrecio.Text;
            ViewState["categoria"] = DropDownListCategoria.SelectedValue;

            LabelMensaje.Text = "Se modificó el producto.";
        }
    }
}