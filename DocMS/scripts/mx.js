
//以下变量为JS公共变量
var MxDrawXCtrl_Obj; //控件对象


function line() {

    MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");

	var app ;
	app = MxDrawXCtrl_Obj.NewComObject("IMxDrawApplication");

	// curSpace 得到当前控件的模形空间 MxDrawX.MxDrawBlockTableRecord
    var curSpace = app.WorkingDatabase().CurrentSpace();
    var point1;
	var point2;


	MxDrawXCtrl_Obj.focus();
	var point1 = MxDrawXCtrl_Obj.GetPoint(false,0,0,"\n 点取第一点:");
	if(point1 == null)
	{
	    alert("用户取消..");
	    return;
	}
	var point2 = MxDrawXCtrl_Obj.GetPoint(false,0,0,"\n 点取第二点:");
	if(point2 == null)
	{
	    alert("用户取消..");
	    return;
	}
	
        // 向当前空间增加直线 newline 是增加的新直线。
	var newline = curSpace.AddLine(point1.x,point1.y,point2.x,point2.y);

	var color = MxDrawXCtrl_Obj.NewComObject("IMxDrawMcCmColor");
	color.SetRGB(255,77,0);
	newline.TrueColor = color;
	
	// 把所以图形内容放到当前显示视区中.
	//app.ZoomAll();
	//alert ("绘制直线成功");
}

function MxDrawX_ImplementCommandEvent(iCmd)
{

}

function getcurpath()
{
	var   url=window.location.href; 
	var   pos=url.lastIndexOf("\\");         
  	if   (pos==-1)
  		pos=url.lastIndexOf("/");
  	var   path=url.substring(0,pos);

        var sHttp = "http://";
        var pos2 = path.indexOf(sHttp);
        var path2;
        if(pos2 == -1)
        {
		path2 = path;
        }
	else
	{
		path2 = path.substring(pos2 + sHttp.length);
	}

	//var pos2 = path2.lastIndexOf(":");
	//if (pos2 != -1)
	// ''   path2 = path2.substring(0, pos2);

  	return path2;
}


function savejpgurl() {
    MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
    MxDrawXCtrl_Obj.focus();

    var veiwCoord = MxDrawXCtrl_Obj.Cal("Mx_GetViewCoord");

 
    
    var param = MxDrawXCtrl_Obj.Call("Mx_NewResbuf", "");
    
    param.AddString("http://localhost");               //  0,服务器网址地址，如：www.mxdraw.com
    param.AddString("/Save.aspx");                     //  1,服务器的文件上传处理程序,如:upload.asp
  
    param.AddString("testsave.jpg");                   //  2,HTML组件名称
    
    param.AddString("6046");                           //  3,服务处理端口. 如：_T("80")
    param.AddString("testsave.jpg");                   //  4,文件标志名称值,表单提交事件中filename值

    param.AddLong(100);                                //  5,jpg文件宽度
    param.AddLong(100);                                //  6,jpg文件高度
    param.AddLong(16777215);                           //  7,jpg背景色，16777215 = 0xffffff,为白色
    if (veiwCoord.AtString(0) == "Ok") {
        param.AddLong(1);                                  //  8, 是否指定输入出范围
        param.AddDouble(veiwCoord.AtDouble(1));            //  9,输入范围的左下角坐标X，文档坐标系统
        param.AddDouble(veiwCoord.AtDouble(2));            //  10,输入范围的左下角坐标Y，文档坐标系统
        param.AddDouble(veiwCoord.AtDouble(3));            //  11,输入范围的右上角坐标X，文档坐标系统
        param.AddDouble(veiwCoord.AtDouble(4));            //  12,输入范围的右上角坐标Y，文档坐标系统
    }
    




    var ret = MxDrawXCtrl_Obj.CallEx("Mx_WriteJpgToURL", param);

    if (ret.AtString(0) == "Ok") {

        alert("成功");
    }
    else {
        alert(ret.AtString(1));
    }
}

function savedwgurl() 
{
    MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
    MxDrawXCtrl_Obj.focus();

    // MxDrawXCtrl_Obj.SaveDwgToURL("http://www.192.168.1.102", "/Save.aspx", "test.dwg", "80");
   // MxDrawXCtrl_Obj.SaveDwgToURL("", "/Save.aspx", "test.dwg", "80");
   // return;
    /*
    if (!MxDrawXCtrl_Obj.SaveDwgToURL(getcurpath(), "/Save.aspx", "test.dwg", "")) {

        var ret = MxDrawXCtrl_Obj.Call("Mx_GetLastError","");
        
        alert(ret.AtString(1));
    }
    else {

        alert("成功");
    }  
    */
    
    var param = MxDrawXCtrl_Obj.Call("Mx_NewResbuf", "");
    // param.AddString(getcurpath();             //  服务器网址地址，如：www.mxdraw.com
    // param.AddString("http://localhost");             //  服务器网址地址，如：www.mxdraw.com
    param.AddString("");             //  服务器网址地址，如：www.mxdraw.com
    param.AddString("/Save.aspx");             //  服务器的文件上传处理程序,如:upload.asp
   // param.AddString("FileComponentName");      //  HTML组件名称
    param.AddString("testsave.dwg");      //  HTML组件名称
    //param.AddString("80");                     //  服务处理端口. 如：_T("80")
    param.AddString("6046");                     //  服务处理端口. 如：_T("80")
    param.AddString("testsave.dwg");               //  文件标志名称值,表单提交事件中filename值

    var ret = MxDrawXCtrl_Obj.CallEx("Mx_SaveDwgToURLEx", param);

    if (ret.AtString(0) == "Ok") {

        alert("成功");
    }
    else {
        alert(ret.AtString(1));
    }  
}

function CreateLayer()
{
    MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
    var layerTable = MxDrawXCtrl_Obj.GetDatabase().GetLayerTable();
    
    // 新创建的层名.        
    var sNewLayerName = "NewLayer";
     
    // 向当前控件增加该层。
    var layerTableRec = layerTable.Add(sNewLayerName);
    
    // 设置层的颜色.
    var color = MxDrawXCtrl_Obj.NewComObject("IMxDrawMcCmColor");
	color.SetRGB(0,255,0);
	layerTableRec.Color = color;
    
    // 把新建的层设置成当前层,设置成当前层后，后面向数据库增加的实体的图层就默认该层。
    MxDrawXCtrl_Obj.GetDatabase().CurrentlyLayerName = sNewLayerName;

}

function HideLayer()
{
     MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
     var ent = MxDrawXCtrl_Obj.GetEntity("\n 选择要关闭图层的实体:");
     if (ent == null)
     {
         return;
     }
     
     var sLayerName = ent.Layer;
     var layerTable = MxDrawXCtrl_Obj.GetDatabase().GetLayerTable();
     var layerTableRec = layerTable.GetAt(sLayerName, false);
     if(layerTableRec != null)
        layerTableRec.IsOff = true;
}

function OpenAllLayer()
{
    MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
    var layerTable = MxDrawXCtrl_Obj.GetDatabase().GetLayerTable();
    var iter = layerTable.NewIterator();
    if (iter == null)
            return;

    for(;!iter.Done();iter.Step(true,false) )
    {
         var layerTableRec = iter.GetRecord();
         layerTableRec.IsOff = false;
    }
}

function OpenDwgFile()
{
     MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
   
     var openDlg = new ActiveXObject('MSComDlg.CommonDialog');
     var isOpen  = false;
     try
     {
        openDlg.Filter="dwg 文件(*.dwg)|*.dwg";
        openDlg.FilterIndex = 1;
        openDlg.MaxFileSize = 255;
        openDlg.ShowOpen();
      }
      catch(e)
      {
        alert(e.message);
        return;
      }
     if(openDlg.filename != "")
        MxDrawXCtrl_Obj.OpenDwgFile(openDlg.filename);    
}

function OpenBmpJpgFile()
{
     MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
   
     var openDlg = new ActiveXObject('MSComDlg.CommonDialog');
     var isOpen  = false;
     try
     {
        openDlg.Filter="jpg 文件(*.jpg)|*.jpg";
        openDlg.FilterIndex = 1;
        openDlg.MaxFileSize = 255;
        openDlg.ShowOpen();
      }
      catch(e)
      {
        alert(e.message);
        return;
      }
     if(openDlg.filename != "")
        MxDrawXCtrl_Obj.OpenDwgFile(openDlg.filename);     
     
}

function InsertImage()
{
     MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
   
     var openDlg = new ActiveXObject('MSComDlg.CommonDialog');
     try
     {
        openDlg.Filter="jpg 文件(*.jpg)|*.jpg";
        openDlg.FilterIndex = 1;
        openDlg.MaxFileSize = 255;
        openDlg.ShowOpen();
     }
     catch(e)
     {
        alert(e.message);
        return;
     }
     if(openDlg.filename == "")
        return;
        
     var filename = openDlg.filename;
     // 图片文件的插入点。
     var point = MxDrawXCtrl_Obj.GetPoint(false,0,0, "\n 指定插入点:");
     if (point == null)
        return;
     
     var    database = MxDrawXCtrl_Obj.GetDatabase();
     var    dict     = database.GetNamedObjectsDictionary();
     if (dict == null)
        return;
     
     var imageDict = dict.GetAt("ACAD_IMAGE_DICT", false) ;
     if(imageDict == null)
     {
          // 增加一个字典对象。
          imageDict =dict.AddObject("ACAD_IMAGE_DICT", "McDbDictionary");
     }

     if (imageDict == null)
          return;
     
     var imgedef = imageDict.GetAt(filename , false);
     if(imgedef == null)
     {
          imgedef = imageDict.AddObject(filename , "McDbRasterImageDef");
          if (imgedef == null)
              return; 
          
          imgedef.SourceFileName = filename;
     }
     
     
     var curSpace = database.CurrentSpace();
     var scale = 1.0;
     curSpace.AddImage2(point.x,point.y,scale, imgedef.ObjectID);

     var app ;
     app = MxDrawXCtrl_Obj.NewComObject("IMxDrawApplication");
     app.ZoomAll();
}

function ZoomWindow()
{
        MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
        var point1 = MxDrawXCtrl_Obj.GetPoint(false,0,0,"\n 点取缩放区域的第一点:");
	    if(point1 == null)
	    {
	        alert("用户取消..");
	        return;
	    }

	    var point2 = MxDrawXCtrl_Obj.GetPoint(false, 0, 0, "\n 点取缩放区域的第二点:");
	    if(point2 == null)
	    {
	        alert("用户取消..");
	        return;
	    }
        var app ;
        app = MxDrawXCtrl_Obj.NewComObject("IMxDrawApplication");
        app.ZoomWindow(point1.x, point1.y, point2.x, point2.y);
}


function MSComDlg_CommonDialog(cmd)
{
    if(!ActiveXObject)return;
    var obj=new ActiveXObject('MSComDlg.CommonDialog');
    var filename=false;
    try{
        switch(cmd){
        case 2:
            obj.ShowColor();
            break;
        case 3:
            obj.ShowFont();
            break;
        case 4:
            obj.ShowHelp();
            break;
        default:
            obj.Filter='所有文件(*.jpg)';
            obj.FilterIndex = 1;
            obj.MaxFileSize = 255;
            if(cmd==0)
            {
                obj.ShowSave();
            }
            else
            {
                obj.ShowOpen();
            }
        }
        filename = obj.filename;
    }catch(e){alert(e.message);}
    return filename;
} 


// 创建一个图层，并把该图层设置成当前图层的例程。
function CreateLayer() {
    MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
     var sNewLayerName = "TestNewLayer";
     var app;
     app = MxDrawXCtrl_Obj.NewComObject("IMxDrawApplication");
     var layerTable = app.WorkingDatabase().GetLayerTable();

     // 
     var layerTableRec = layerTable.Add(sNewLayerName);

     // 设置图层的颜色。
     var color = MxDrawXCtrl_Obj.NewComObject("IMxDrawMcCmColor");
	 color.SetRGB(255,0,0);
     layerTableRec.Color = color;

     // 把新建的层设置成当前层
     app.WorkingDatabase().CurrentlyLayerName = sNewLayerName;
}

// 插入一个注释
function InsertNote()
{
     CreateLayer();
     
     var sNoteText = "这是一个注释";
     var sNote = "NoteBlockName";

     // 让用点取一个注释插入点。
     MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");

     var point = MxDrawXCtrl_Obj.GetPoint(false, 0, 0, "\n 点取插入点 :");
     if (point == null)
     {
         alert("用户取消..");
         return;
     }
     MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
     // 插入注释。
     var app;
     app = MxDrawXCtrl_Obj.NewComObject("IMxDrawApplication");
     
     var curDatabase = app.WorkingDatabase();
     var blkTable = curDatabase.GetBlockTable();
     var curSpace = curDatabase.CurrentSpace();

     var blkRec = blkTable.GetAt(sNote,true);

     
     if(blkRec == null)
     {
         // blkRec == null 指名的块记录没有找到.

         // 插入一个新的块。
         var sBlkFilePath = MxDrawXCtrl_Obj.GetOcxAppPath() + "\\Blk\\TsgNote.dwg";
        

         // 把dwg文件导入到当前数据库。
         MxDrawXCtrl_Obj.InsertBlock(sBlkFilePath, sNote);

         blkRec = blkTable.GetAt(sNote,true);
     }

     if(blkRec != null)
     {
         // 在当前空间中插入一个块引用。
         curSpace.InsertBlock(point.x, point.y, sNote, 4.0, 0.0);
     }

     // 插入注释文本。
     point.y = point.y - 10.0;
     curSpace.AddText(point.x, point.y, sNoteText, 8, 0.0, 1,
         3);

    //curSpace.AddText(point, sNoteText, 16, 0.0, MCAD_McHorizontalAlignment.mcHorizontalAlignmentCenter,
    //            MCAD_McVerticalAlignment.mcVerticalAlignmentTop);
            
}


function WriteXData()
{
    MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
    var ent = MxDrawXCtrl_Obj.GetEntity("\n 选择写扩展数据的实体:");
    if (ent == null)
    {
         return;
    }
    
    var xData;
    xData = MxDrawXCtrl_Obj.NewResbuf();
    xData.AddStringEx("TestApp",1001);
    xData.AddLong(77677);

    ent.SetXData(xData);
}

function ReadXData()
{
        MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
        var ent = MxDrawXCtrl_Obj.GetEntity("\n 选择读取扩展数据的实体:");
        if (ent == null)
        {
            return;
        }
        var xData = ent.GetXData("");
        if(xData.Count == 0)
        {
            alert("没有扩展数据");
        }
        else
        {
            // 向命令行窗口打印扩展数据。
            xData.PrintData();
        }
    }


function DetectActiveX()
{
    try
    {
       var comActiveX = new ActiveXObject("MXDRAWX.MxDrawXCtrl.1");   
    }
    catch(e)
    {
       return false;   
    }
    return true;
}

function LoadMxDrawX() 
{
    if (DetectActiveX()) {
        // 如果电脑上安装的有控件，就直接加载显示
        PrintOFrameForShow();

    }
    else {

        // 显示下载连接.
//
        var str = '<div class="no_title"> ';
        document.write(str);
        
        var install = "http://www.mxdraw.com/?p=10&a=view&r=21";
        str = '<a href="' + install + '">立即下载安装</a>' + '</div>';
        //</div>';
        document.write(str);



        var str = '<div id="_oFrameContainer"  style="width:1px; height:1px; overflow:hidden;">'
        + '<object classid="clsid:74A777F8-7A8F-4e7c-AF47-7074828086E2" id="MxDrawXCtrl" '
        + 'codebase="http://www.mxdraw.com/MxDrawX52.CAB#version=1.0.0.1" width=100% height=90%> <param name="_Version" value="65536"> <param name="_ExtentX" value="24262"> <param name="_ExtentY" value="16219"> <param name="_StockProps" value="0">'
        + '<param name="DwgFilePath" value="">'
		+ '<param name="IsRuningAtIE" value="1">'
		+ '<param name="EnablePrintCmd" value="1">'
        + '<param name="FirstRunPan" value="0">'
		+ '</object></div>';

        document.write(str);
    }
    

}


function PrintOFrameForShow() {
    var str =  '<object classid="clsid:74A777F8-7A8F-4e7c-AF47-7074828086E2" id="MxDrawXCtrl" '
        + 'codebase="http://www.mxdraw.com/MxDrawX52.CAB#version=1.0.0.1" width=100% height=90%> <param name="_Version" value="65536"> <param name="_ExtentX" value="24262"> <param name="_ExtentY" value="16219"> <param name="_StockProps" value="0">'
    // + '<param name="DwgFilePath" value="<2E2F33343234332E647767>">'
        + '<param name="DwgFilePath" value="./test.dwg">'
		+ '<param name="IsRuningAtIE" value="1">'
		+ '<param name="EnablePrintCmd" value="1">'
        + '<param name="ShowMenuBar" value="1">'
        + '<param name="FirstRunPan" value="0">'
        + '<param name="Iniset" value="LoadMrx=ExApp,MenuFile=./mxcad.mnu">'
      + '<param name="ToolBarFiles" value="~/My-MxDraw-ToolBar.txt,MxDraw-ToolBar-DrawParam.mxt,MxDraw-ToolBar-Draw.mxt,MxDraw-ToolBar-Edit.mxt">'
   // + '<param name="ToolBarFiles" value="Empty.mxt">'
   
   
		+ '</object>';
	
    document.write(str);

}



function GetAllEntity() {
    MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
    var ss;
    ss = MxDrawXCtrl_Obj.NewSelectionSet();
    ss.Select2(5,null,null,null,null);
    
    var i = 0;
    for (; i < ss.Count; i++) 
    {
        var ent = ss.Item(i);
        if (ent.ObjectName == "McDbLine") {
            alert("直线");
        }
        else {
            alert(ent.ObjectName);
        }
        
        
        
    }
    
}
