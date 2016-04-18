<%@ Page Language="C#" ValidateRequest="false" %>

<%@ Register TagPrefix="CH" Namespace="ActiproSoftware.CodeHighlighter" Assembly="ActiproSoftware.CodeHighlighter.Net20" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    static string code = string.Empty;

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        code = txtCode.Text;
        Highlighter.LanguageKey = ddlLangType.SelectedItem.Text;
        Highlighter.OutliningEnabled = chkOutLining.Checked;
        Highlighter.LineNumberMarginVisible = chkLineNum.Checked;
        Highlighter.Text = code;
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CodeHighlighterConfiguration config = (CodeHighlighterConfiguration)ConfigurationManager.GetSection("codeHighlighter");
            string[] keys = new string[config.LanguageConfigs.Keys.Count];
            config.LanguageConfigs.Keys.CopyTo(keys, 0);
            Array.Sort(keys);
            foreach (string key in keys)
            {
                ddlLangType.Items.Add(key);
            }
            ddlLangType.SelectedIndex = ddlLangType.Items.IndexOf(ddlLangType.Items.FindByText("C#"));
        }
    }

    protected void CodeHighlighter_PostRender(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Highlighter.Output))
        {
            lblCode.Text = Highlighter.Output.Replace("  ", "&nbsp;&nbsp;&nbsp;&nbsp;").Replace("\n", "<br />");
            Response.Write("<scr" + "ipt>window.parent.SetOkButton( true );</scr" + "ipt>");
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>InsertCode By Moozi.Net</title>

    <script src="../../dialog/common/fck_dialog_common.js" type="text/javascript"></script>

    <script type="text/javascript">

        var oEditor = window.parent.InnerDialogLoaded() ;

        // Gets the document DOM
        var oDOM = oEditor.FCK.EditorDocument ;

        var oActiveEl = oEditor.FCKSelection.GetSelectedElement() ;

        window.onload = function()
        {
            //window.parent.SetOkButton( false );
        }

        function Ok()
        {
            if(GetE('txtCode').value == '')
            {
                alert("代码内容不能为空！");
                return false;
            }
            oEditor.FCK.InsertHtml(document.getElementById("lblCode").innerHTML) ;
            return true ;
        }

    </script>

    <style type="text/css">
        .langType
        {
            padding-bottom: 5px;
        }
        .btnRun
        {
            padding-top: 5px;
            text-align: right;
        }
        pre
        {
            background-color: #f4f4f4;
            border-style: solid;
            border-width: 1px;
            border-color: #C0C0C0;
            font-family: Courier New, monospace;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="langType">语言类型：
            <asp:DropDownList ID="ddlLangType" runat="server"></asp:DropDownList>
            <asp:CheckBox ID="chkOutLining" Text="折叠代码" runat="server" Checked="true" />
            <asp:CheckBox ID="chkLineNum" Text="允许行号" runat="server" Checked="false" />
        </div>
        <div>
            <asp:TextBox ID="txtCode" runat="server" TextMode="multiline" Width="640px" Height="390px"></asp:TextBox>
        </div>
        <div class="btnRun">
            <asp:Button ID="btnSubmit" runat="server" Text="  转  换  " 
                onclick="btnSubmit_Click"  />
            <pre id="pre1" style="display: none;">
                <CH:CodeHighlighter runat="server" ID="Highlighter" OnPostRender="CodeHighlighter_PostRender" />    
            </pre>
            <asp:Label ID="lblCode" Style="display: none;" runat="server"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
