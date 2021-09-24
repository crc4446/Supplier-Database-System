using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MIS316_mp3Bcrc4446 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLoadOrders_Click(object sender, EventArgs e)
    {
        pnlLoadOrders.Visible = false;
        pnlCustomersPrevOrders.Visible = true;
    }




    protected void cbCustomerDetails_CheckedChanged(object sender, EventArgs e)
    {
        if (cbCustomerDetails.Checked == true)
        {
            dvCustomerDetails.Visible = true;
            dvCustomerDetails.DataBind();
        }
        else
        {
            dvCustomerDetails.Visible = false;
        }
    }

    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        pnlCustomersPrevOrders.Visible = false;
        pnlLoadOrders.Visible = true;
        cbCustomerDetails.Checked = false;
        dvCustomerDetails.Visible = false;
        ddlChooseACustomer.ClearSelection();
    }






    protected void gvCustomersPrevOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlCustomersPrevOrders.Visible = false;
        pnlViewProducts.Visible = true;

        cbCustomerDetails.Checked = false;
        dvCustomerDetails.Visible = false;
        btnGoBackTwo.Visible = true;
        

        DataBind();
    }

    protected void btnGoBackTwo_Click(object sender, EventArgs e)
    {
        pnlViewProducts.Visible = false;
        pnlCustomersPrevOrders.Visible = true;
        cbCustomerDetails.Checked = false;
        dvCustomerDetails.Visible = false;
        fvSupplier.Visible = false;
        
    }

    protected void gvProductInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        fvSupplier.Visible = true;
        
    }
}



