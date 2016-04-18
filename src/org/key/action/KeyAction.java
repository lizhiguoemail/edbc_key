package org.key.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.dbc.base.BaseAction;
import org.dbc.base.ServiceConstent;
import org.dbc.formBean.AlbumForm;
import org.dbc.interDao.IAlbumDao;
import org.dbc.interDao.ILogDao;
import org.dbc.pojo.Album;
import org.dbc.pojo.UserBean;
import org.dbc.util.CkUtils;
import org.key.util.DesUtils;

public class KeyAction extends BaseAction{
	
    private UserBean userinfo;

    private ILogDao logdao;

    private String ipaddress;

    public void setparam(HttpServletRequest request){
      userinfo=(UserBean) request.getSession().getAttribute("userinfo");
      logdao=(ILogDao)super.getInstence(ServiceConstent.LOGDAO);
      //获取IP地址
      ipaddress=request.getRemoteAddr();
      if(ipaddress==null||"".equals(ipaddress)){
        ipaddress=request.getHeader("X-Real-IP");
       }
      }
    
    /**
     * @Title getKeyEXT
     * @Description 添加
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return ActionForward
     */
     public ActionForward getKeyEXT(ActionMapping mapping, ActionForm form,
             HttpServletRequest request, HttpServletResponse response){
         this.setparam(request);
         try {
             String keyvalue=request.getParameter("keyvalue");
             DesUtils des=new DesUtils("chj");
             if(keyvalue!=null&&!"".endsWith(keyvalue)){
            	 if(keyvalue.indexOf(",")==-1){
            		 keyvalue=keyvalue+"chj";
            	 }
            	 else{
            		 keyvalue=keyvalue.replace(",", "chj");
            	 }
            	 String key=des.encrypt(keyvalue);
            	 response.getWriter().print("{success:true,msg:'"+key+"'}");
             }
             logdao.saveLog(userinfo,"添加","添加key", "key.do?methede=getKeyEXT", null, ipaddress, null, "添加",request.getSession().getServletContext().getRealPath("/"));
         }catch (Exception e) {
             logdao.saveLog(userinfo,"操作失败","添加key", "ey.do?methede=getKeyEXT", null, ipaddress, null, "添加失败，",request.getSession().getServletContext().getRealPath("/"));
             e.printStackTrace();
         }
         return null;
     }

}


