FCKCommands.RegisterCommand('InsertCode', new FCKDialogCommand('InsertCode', FCKLang.InsertCode, FCKPlugins.Items['insertcode'].Path + 'insertcode.aspx', 700, 600)) ;
var insertcodeItem = new FCKToolbarButton('InsertCode', FCKLang['InsertCode']) ;
insertcodeItem.IconPath = FCKPlugins.Items['insertcode'].Path + 'images/insertcode.gif';
FCKToolbarItems.RegisterItem('InsertCode', insertcodeItem);
