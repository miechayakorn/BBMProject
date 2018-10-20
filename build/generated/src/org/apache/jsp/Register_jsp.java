package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_choose;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_when_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_choose = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_when_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_choose.release();
    _jspx_tagPool_c_when_test.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"generator\" content=\"Mobirise v4.8.6, mobirise.com\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1\">\r\n");
      out.write("    <link rel=\"shortcut icon\" href=\"assets/images/logo2.png\" type=\"image/x-icon\">\r\n");
      out.write("    <meta name=\"description\" content=\"Web Site Creator Description\">\r\n");
      out.write("    <title>Register Page</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/web/assets/mobirise-icons/mobirise-icons.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/tether/tether.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/bootstrap/css/bootstrap.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/bootstrap/css/bootstrap-grid.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/bootstrap/css/bootstrap-reboot.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/dropdown/css/style.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/socicon/css/styles.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/theme/css/style.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/mobirise/css/mbr-additional.css\" type=\"text/css\">\r\n");
      out.write("    <style>\r\n");
      out.write("        .overlay {\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            display: none;\r\n");
      out.write("            position: fixed;\r\n");
      out.write("            z-index: 1;\r\n");
      out.write("            top: 0;\r\n");
      out.write("            left: 0;\r\n");
      out.write("            background-color: rgb(0,0,0);\r\n");
      out.write("            background-color: rgba(0,0,0, 0.9);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        .loader {\r\n");
      out.write("            border: 16px solid #f3f3f3;\r\n");
      out.write("            border-radius: 50%;\r\n");
      out.write("            border-top: 16px solid #3498db;\r\n");
      out.write("            width: 120px;\r\n");
      out.write("            height: 120px;\r\n");
      out.write("            -webkit-animation: spin 2s linear infinite; /* Safari */\r\n");
      out.write("            animation: spin 2s linear infinite;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Safari */\r\n");
      out.write("        @-webkit-keyframes spin {\r\n");
      out.write("            0% { -webkit-transform: rotate(0deg); }\r\n");
      out.write("            100% { -webkit-transform: rotate(360deg); }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        @keyframes spin {\r\n");
      out.write("            0% { transform: rotate(0deg); }\r\n");
      out.write("            100% { transform: rotate(360deg); }\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      if (_jspx_meth_c_choose_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("        <div id=\"myOverlay\" class=\"overlay\">\r\n");
      out.write("            <center><div class=\"loader\"></div></center>\r\n");
      out.write("        </div>\r\n");
      out.write("        <section class=\"menu cid-r6ZFttHx66\" id=\"menu2-n\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <nav class=\"navbar navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm bg-color transparent\">\r\n");
      out.write("                <button class=\"navbar-toggler navbar-toggler-right\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("                    <div class=\"hamburger\">\r\n");
      out.write("                        <span></span>\r\n");
      out.write("                        <span></span>\r\n");
      out.write("                        <span></span>\r\n");
      out.write("                        <span></span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </button>\r\n");
      out.write("                <div class=\"menu-logo\">\r\n");
      out.write("                    <div class=\"navbar-brand\">\r\n");
      out.write("                        <span class=\"navbar-logo\">\r\n");
      out.write("                            <a href=\"index.html\">\r\n");
      out.write("                                <img src=\"assets/images/logo2.png\" alt=\"Mobirise\" title=\"\">\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <span class=\"navbar-caption-wrap\"><a class=\"navbar-caption display-4 text-white\" href=\"index.html\">\r\n");
      out.write("                                BBM</a></span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("                    <ul class=\"navbar-nav nav-dropdown display-4\" data-app-modern-menu=\"true\"><li class=\"nav-item\"><a class=\"nav-link link text-white\" href=\"index.html#features18-5\" aria-expanded=\"false\">ประเภทห้อง</a></li><li class=\"nav-item\"><a class=\"nav-link link text-white\" href=\"index.html#form4-k\" aria-expanded=\"false\">ข้อมูลโครงการ</a></li><li class=\"nav-item\"><a class=\"nav-link link text-white\" href=\"RemainingRoom.html\" aria-expanded=\"false\">จำนวนห้องที่เหลืออยู่</a></li></ul>\r\n");
      out.write("                    <div class=\"navbar-buttons mbr-section-btn\"><a class=\"btn btn-sm btn-primary\" href=\"https://mobirise.com/mobirise-free-win.zip\">Sign up</a> <a class=\"btn btn-sm btn-primary\" href=\"https://mobirise.com/mobirise-free-mac.zip\">\r\n");
      out.write("                            Login</a> <a class=\"btn btn-sm btn-primary\" href=\"https://mobirise.com/mobirise-free-mac.zip\"><span class=\"mbri-user mbr-iconfont mbr-iconfont-btn\"></span>\r\n");
      out.write("                            My Account</a> <a class=\"btn btn-sm btn-secondary\" href=\"https://mobirise.com/mobirise-free-mac.zip\"><span class=\"mbri-search mbr-iconfont mbr-iconfont-btn\"></span></a></div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </nav>\r\n");
      out.write("        </section>\r\n");
      out.write("\r\n");
      out.write("        <section class=\"engine\"><a href=\"https://mobirise.info/j\">website templates</a></section><section class=\"header11 cid-r706ZXr5MO\" id=\"header11-o\">\r\n");
      out.write("\r\n");
      out.write("            <!-- Block parameters controls (Blue \"Gear\" panel) -->     \r\n");
      out.write("\r\n");
      out.write("            <!-- End block parameters -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"container align-left\">\r\n");
      out.write("                <div class=\"media-container-column mbr-white col-md-12\">\r\n");
      out.write("\r\n");
      out.write("                    <h1 class=\"mbr-section-title py-3 mbr-fonts-style display-1\"><strong>Register - สมัครสมาชิก</strong></h1>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </section>\r\n");
      out.write("\r\n");
      out.write("        <section class=\"mbr-section form1 cid-r7074fmFzA\" id=\"form1-p\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row justify-content-center\">\r\n");
      out.write("                    <div class=\"title col-12 col-lg-8\">\r\n");
      out.write("                        <h2 class=\"mbr-section-title align-center pb-3 mbr-fonts-style display-2\">\r\n");
      out.write("                            CONTACT FORM\r\n");
      out.write("                        </h2>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row justify-content-center\">\r\n");
      out.write("                    <div class=\"media-container-column col-lg-8\" data-form-type=\"formoid\">\r\n");
      out.write("                        <div data-form-alert=\"\" hidden=\"\">Thanks for filling out the form!</div>\r\n");
      out.write("\r\n");
      out.write("                        <form class=\"mbr-form\" action=\"https://mobirise.com/\" method=\"post\" data-form-title=\"Mobirise Form\"><input type=\"hidden\" name=\"email\" data-form-email=\"true\" value=\"iWMoFlJWkDjeRQGImRlum3I8W0MRuO6V1swi8RqNYONRafX6HS9D4H0OQ/XwjK04j/E+54mvIV6MuvRk/sPIJWAEtwoCA3GTthS/cgaLaGzVbceZATods6QIezm6OTZv\">\r\n");
      out.write("                            <div class=\"row row-sm-offset\">\r\n");
      out.write("                                <div class=\"col-md-4 multi-horizontal\" data-for=\"name\">\r\n");
      out.write("                                    <div class=\"form-group\">\r\n");
      out.write("                                        <label class=\"form-control-label mbr-fonts-style display-7\" for=\"name-form1-p\">Name</label>\r\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" name=\"name\" data-form-field=\"Name\" required=\"\" id=\"name-form1-p\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"col-md-4 multi-horizontal\" data-for=\"email\">\r\n");
      out.write("                                    <div class=\"form-group\">\r\n");
      out.write("                                        <label class=\"form-control-label mbr-fonts-style display-7\" for=\"email-form1-p\">Email</label>\r\n");
      out.write("                                        <input type=\"email\" class=\"form-control\" name=\"email\" data-form-field=\"Email\" required=\"\" id=\"email-form1-p\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"col-md-4 multi-horizontal\" data-for=\"phone\">\r\n");
      out.write("                                    <div class=\"form-group\">\r\n");
      out.write("                                        <label class=\"form-control-label mbr-fonts-style display-7\" for=\"phone-form1-p\">Phone</label>\r\n");
      out.write("                                        <input type=\"tel\" class=\"form-control\" name=\"phone\" data-form-field=\"Phone\" id=\"phone-form1-p\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"form-group\" data-for=\"message\">\r\n");
      out.write("                                <label class=\"form-control-label mbr-fonts-style display-7\" for=\"message-form1-p\">Message</label>\r\n");
      out.write("                                <textarea type=\"text\" class=\"form-control\" name=\"message\" rows=\"7\" data-form-field=\"Message\" id=\"message-form1-p\"></textarea>\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <span class=\"input-group-btn\"><button href=\"\" type=\"submit\" class=\"btn btn-primary btn-form display-4\">SEND FORM</button></span>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </section>\r\n");
      out.write("\r\n");
      out.write("        <section class=\"footer4 cid-r70cW4J9tT\" id=\"footer4-v\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"media-container-row content mbr-white\">\r\n");
      out.write("                    <div class=\"col-md-3 col-sm-4\">\r\n");
      out.write("                        <div class=\"mb-3 img-logo\">\r\n");
      out.write("                            <a href=\"https://mobirise.co/\">\r\n");
      out.write("                                <img src=\"assets/images/logo2.png\" alt=\"Mobirise\">\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <p class=\"mb-3 mbr-fonts-style foot-title display-7\">\r\n");
      out.write("                            HOME</p>\r\n");
      out.write("                        <p class=\"mbr-text mbr-fonts-style mbr-links-column display-7\"><strong><a href=\"index.html#form4-k\" class=\"text-white\">ข้อมูลโครงการ</a></strong><br><a href=\"room.html\" class=\"text-white\">ประเภทห้อง</a>\r\n");
      out.write("                            <br><a href=\"RemainingRoom.html\" target=\"_blank\" class=\"text-white\">จำนวนห้องที่เหลืออยู่</a></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-4 col-sm-8\">\r\n");
      out.write("                        <p class=\"mb-4 foot-title mbr-fonts-style display-7\"><strong>BBM -&nbsp;Condominium</strong></p>\r\n");
      out.write("                        <p class=\"mbr-text mbr-fonts-style foot-text display-7\">เติมเต็มทุกจินตนาการ สนุกสนานทุกการใช้ชีวิต</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-4 offset-md-1 col-sm-12\">\r\n");
      out.write("                        <p class=\"mb-4 foot-title mbr-fonts-style display-7\">\r\n");
      out.write("                            SUBSCRIBE\r\n");
      out.write("                        </p>\r\n");
      out.write("                        <p class=\"mbr-text mbr-fonts-style form-text display-7\">\r\n");
      out.write("                            Get monthly updates and free resources.\r\n");
      out.write("                        </p>\r\n");
      out.write("                        <div class=\"media-container-column\" data-form-type=\"formoid\">\r\n");
      out.write("                            <div data-form-alert=\"\" hidden=\"\" class=\"align-center\">Thanks for filling out the form!</div>\r\n");
      out.write("\r\n");
      out.write("                            <form class=\"form-inline\" action=\"https://mobirise.com/\" method=\"post\" data-form-title=\"Mobirise Form\">\r\n");
      out.write("                                <input type=\"hidden\" value=\"BSSD5OA88jmeNwqgyltuc8zrMxO5+Oh/VsfGlwjo8PK8onMzv8Bs393WIINWC2ZpdMFUunAdZUZEHdy1Aocqx0dWo4nWl+rVa3u8DXr2ME7P4+8dKAQFXJyWz3yUNOfw\" data-form-email=\"true\">\r\n");
      out.write("                                <div class=\"form-group\">\r\n");
      out.write("                                    <input type=\"email\" class=\"form-control input-sm input-inverse my-2\" name=\"email\" required=\"\" data-form-field=\"Email\" placeholder=\"Email\" id=\"email-footer4-v\">\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"input-group-btn m-2\"><button href=\"\" class=\"btn btn-primary display-4\" type=\"submit\" role=\"button\">Subscribe</button></div>\r\n");
      out.write("                            </form>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <p class=\"mb-4 mbr-fonts-style foot-title display-7\">\r\n");
      out.write("                            CONNECT WITH US\r\n");
      out.write("                        </p>\r\n");
      out.write("                        <div class=\"social-list pl-0 mb-0\">\r\n");
      out.write("                            <div class=\"soc-item\">\r\n");
      out.write("\r\n");
      out.write("                                <span class=\"mbr-iconfont mbr-iconfont-social socicon-twitter socicon\" style=\"color: rgb(118, 118, 118); fill: rgb(118, 118, 118);\"></span>\r\n");
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"soc-item\">\r\n");
      out.write("\r\n");
      out.write("                                <span class=\"mbr-iconfont mbr-iconfont-social socicon-facebook socicon\" style=\"color: rgb(118, 118, 118); fill: rgb(118, 118, 118);\"></span>\r\n");
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"soc-item\">\r\n");
      out.write("\r\n");
      out.write("                                <span class=\"mbr-iconfont mbr-iconfont-social socicon-youtube socicon\" style=\"color: rgb(118, 118, 118); fill: rgb(118, 118, 118);\"></span>\r\n");
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"soc-item\">\r\n");
      out.write("\r\n");
      out.write("                                <span class=\"mbr-iconfont mbr-iconfont-social socicon-instagram socicon\" style=\"color: rgb(118, 118, 118); fill: rgb(118, 118, 118);\"></span>\r\n");
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"soc-item\">\r\n");
      out.write("\r\n");
      out.write("                                <span class=\"mbr-iconfont mbr-iconfont-social socicon-googleplus socicon\" style=\"color: rgb(118, 118, 118); fill: rgb(118, 118, 118);\"></span>\r\n");
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"soc-item\">\r\n");
      out.write("\r\n");
      out.write("                                <span class=\"mbr-iconfont mbr-iconfont-social socicon-behance socicon\" style=\"color: rgb(118, 118, 118); fill: rgb(118, 118, 118);\"></span>\r\n");
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"footer-lower\">\r\n");
      out.write("                    <div class=\"media-container-row\">\r\n");
      out.write("                        <div class=\"col-sm-12\">\r\n");
      out.write("                            <hr>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"media-container-row mbr-white\">\r\n");
      out.write("                        <div class=\"col-sm-12 copyright\">\r\n");
      out.write("                            <p class=\"mbr-text mbr-fonts-style display-7\">\r\n");
      out.write("                                © Copyright 2018 (BBM)Condominium- All Rights Reserved\r\n");
      out.write("                            </p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </section>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <script src=\"assets/web/assets/jquery/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/popper/popper.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/tether/tether.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/bootstrap/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/smoothscroll/smooth-scroll.js\"></script>\r\n");
      out.write("        <script src=\"assets/dropdown/js/script.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/touchswipe/jquery.touch-swipe.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/theme/js/script.js\"></script>\r\n");
      out.write("        <script src=\"assets/formoid/formoid.min.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("    <script>\r\n");
      out.write("        function openSearch() {\r\n");
      out.write("            document.getElementById(\"myOverlay\").style.display = \"block\";\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function closeSearch() {\r\n");
      out.write("            document.getElementById(\"myOverlay\").style.display = \"none\";\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_choose_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:choose
    org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_choose_0 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _jspx_tagPool_c_choose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
    _jspx_th_c_choose_0.setPageContext(_jspx_page_context);
    _jspx_th_c_choose_0.setParent(null);
    int _jspx_eval_c_choose_0 = _jspx_th_c_choose_0.doStartTag();
    if (_jspx_eval_c_choose_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("            ");
        if (_jspx_meth_c_when_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_0, _jspx_page_context))
          return true;
        out.write("\r\n");
        out.write("            ");
        if (_jspx_meth_c_when_1((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_0, _jspx_page_context))
          return true;
        out.write("\r\n");
        out.write("            ");
        if (_jspx_meth_c_when_2((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_0, _jspx_page_context))
          return true;
        out.write("\r\n");
        out.write("        ");
        int evalDoAfterBody = _jspx_th_c_choose_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_choose_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_0);
      return true;
    }
    _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_0);
    return false;
  }

  private boolean _jspx_meth_c_when_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_when_0 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _jspx_tagPool_c_when_test.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_when_0.setPageContext(_jspx_page_context);
    _jspx_th_c_when_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_0);
    _jspx_th_c_when_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${status == 'statusTrue'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_when_0 = _jspx_th_c_when_0.doStartTag();
    if (_jspx_eval_c_when_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                <div class=\"alert alert-success\">\r\n");
        out.write("                    <strong>Success!!</strong> กรุณา.. เช็คที่อีเมล์เพื่อ Activate | อีเมล์ของท่านที่ใช้ในการสมัคร คือ ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${getEmailInDB}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("\r\n");
        out.write("                </div>\r\n");
        out.write("            ");
        int evalDoAfterBody = _jspx_th_c_when_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_when_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_0);
      return true;
    }
    _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_0);
    return false;
  }

  private boolean _jspx_meth_c_when_1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_when_1 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _jspx_tagPool_c_when_test.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_when_1.setPageContext(_jspx_page_context);
    _jspx_th_c_when_1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_0);
    _jspx_th_c_when_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${status == 'UserHaveInDB'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_when_1 = _jspx_th_c_when_1.doStartTag();
    if (_jspx_eval_c_when_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                <div class=\"alert alert-warning\">\r\n");
        out.write("                    <strong>Warning!</strong> มี ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write(" นี้ ในระบบของเราแล้ว\r\n");
        out.write("                </div>\r\n");
        out.write("            ");
        int evalDoAfterBody = _jspx_th_c_when_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_when_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_1);
      return true;
    }
    _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_1);
    return false;
  }

  private boolean _jspx_meth_c_when_2(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_when_2 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _jspx_tagPool_c_when_test.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_when_2.setPageContext(_jspx_page_context);
    _jspx_th_c_when_2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_0);
    _jspx_th_c_when_2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${status == 'errorException'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_when_2 = _jspx_th_c_when_2.doStartTag();
    if (_jspx_eval_c_when_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                <div class=\"alert alert-danger\">\r\n");
        out.write("                    <strong>Something went wrong!</strong> มีบางอย่างผิดปกติ กรุณาลองใหม่อีกครั้ง\r\n");
        out.write("                </div>\r\n");
        out.write("            ");
        int evalDoAfterBody = _jspx_th_c_when_2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_when_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_2);
      return true;
    }
    _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_2);
    return false;
  }
}
