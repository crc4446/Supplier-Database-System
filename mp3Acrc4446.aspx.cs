using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MIS316_mp3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void ddlSupplier_SelectedIndexChanged(object sender, EventArgs e)
    {
        //clear the items in the product dropdownlist when a new supplier is selected
        ddlProduct.Items.Clear();

        //add a blank item to product dropdownlist when a new supplier is selected
        ddlProduct.Items.Add("");

        //hide the link buttons and designview initially
        lbContactDetails.Visible = false;
        lbHideContact.Visible = false;
        dvContactDetails.Visible = false;
    }

    protected void lbContactDetails_Click(object sender, EventArgs e)
    {
        /*hide the show contact details link button upon clicking it 
        and display the hide contacts link button and the design view
        for the contact info */
        lbContactDetails.Visible = false;
        lbHideContact.Visible = true;
        dvContactDetails.Visible = true;
        
        //bind the data every time the show contact link button is clicked
        dvContactDetails.DataBind();

    }

    protected void lbHideContact_Click(object sender, EventArgs e)
    {
        // hide the hide contact link button and design view and display the show contacts link button 
        lbHideContact.Visible = false;
        lbContactDetails.Visible = true;
        dvContactDetails.Visible = false;

    }

    protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        // hide the hide contacts link button and design view, and show the show contacts link button
        lbContactDetails.Visible = true;
        lbHideContact.Visible = false;
        dvContactDetails.Visible = false;
    }
}