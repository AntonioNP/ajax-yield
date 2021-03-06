<%@page import="net.daw.bean.UsuarioBean"%>
<%UsuarioBean user = (UsuarioBean) request.getSession().getAttribute("usuarioBean");%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Ajax Yield</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
        <script src="./js/vendor/jquery.validate.min.js"></script>

    </head>
    <body>
        <!--[if lt IE 7]>
        <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->


        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
                        <span class="icon-bar"></span> 
                        <span class="icon-bar"></span> 
                        <span class="icon-bar"></span>
                    </a> 
                    <a class="brand" href="jsp">Ajax Stock</a>                   
                    <div class="nav-collapse collapse">
                        <%if (user != null) {%>
                        <jsp:include page="jsp/menuSuperior.jsp" />   
                        <% }%>
                        <jsp:include page="jsp/usuario/infologin.jsp" />                        
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                <%
                    if (user != null) {
                        out.print("<div class=\"span2\">");
                %>
                <jsp:include page="jsp/menuLateral.jsp" />
                <%
                        out.print("</div>");
                    }
                %>
                <%
                    if (user != null) {
                        out.print("<div class=\"span10\">");
                        out.print("<div id=\"indexContenido\"></div>");
                    } else {
                        out.print("<div class=\"span12\">");
                    }
                %>
                <div id="indexContenidoJsp">
                    <jsp:include page='<%=(String) request.getAttribute("contenido")%>' />                
                </div>
                <%
                    out.print("</div>");
                %>    
                <div class="row-fluid">
                    <div class="span12"><hr><footer><p>&copy; Rafael Aznar (2013)</p></footer></div>   
                </div>
            </div>
        </div>                    

        <!-- carga de javascript -->

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/vendor/bootstrap-transition.js"></script>
        <script src="js/vendor/bootstrap-alert.js"></script>
        <script src="js/vendor/bootstrap-modal.js"></script>
        <script src="js/vendor/bootstrap-dropdown.js"></script>
        <script src="js/vendor/bootstrap-scrollspy.js"></script>
        <script src="js/vendor/bootstrap-tab.js"></script>
        <script src="js/vendor/bootstrap-tooltip.js"></script>
        <script src="js/vendor/bootstrap-popover.js"></script>
        <script src="js/vendor/bootstrap-button.js"></script>
        <script src="js/vendor/bootstrap-collapse.js"></script>
        <script src="js/vendor/bootstrap-carousel.js"></script>
        <script src="js/vendor/bootstrap-typeahead.js"></script>    

        <script src="js/util.js" charset="UTF-8"></script>
        <script src="js/main.js" charset="UTF-8"></script>

        <script src="js/control/alumno.js" charset="UTF-8"></script>
        <script src="js/control/usuario.js" charset="UTF-8"></script>
        <script src="js/control/lenguaje.js" charset="UTF-8"></script>
        <script src="js/control/documento.js" charset="UTF-8"></script>
        <script src="js/control/entrada.js" charset="UTF-8"></script>
        <script src="js/control/actividad.js" charset="UTF-8"></script>
        <script src="js/control/empresa.js" charset="UTF-8"></script>
        <script src="js/control/entrada.js" charset="UTF-8"></script>
        <script src="js/control/hilo.js" charset="UTF-8"></script>
        <script src="js/control/tipodocumento.js" charset="UTF-8"></script>
        <script src="js/control/votodocumento.js" charset="UTF-8"></script>
        <script src="js/control/actividadoffline.js" charset="UTF-8"></script>
        <script src="js/control/entrega.js" charset="UTF-8"></script>     

        <script>

            $(document).ready(function() {
                inicializacion();
                $('#lnkLenguaje').unbind('click');
                $('#lnkLenguaje').click(function() {
                    var lenguaje = objeto('lenguaje', '<%=request.getContextPath()%>');
                    var lenguajeView = vista(lenguaje, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(lenguajeView.getEmptyList());

                    var lenguajeControl = control_lenguaje_list('<%=request.getContextPath()%>');
                    lenguajeControl.inicia(lenguajeView, 1, null, null, 10, null, null, null, null);
                    return false;
                });
                $('#lnkDocumento').unbind('click');
                $('#lnkDocumento').click(function() {
                    var documento = objeto('documento', '<%=request.getContextPath()%>');
                    var documentoView = vista(documento, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(documentoView.getEmptyList());

                    var documentoControl = control_documento_list('<%=request.getContextPath()%>');
                    documentoControl.inicia(documentoView, 1, null, null, 10, null, null, null, null);
                    return false;
                });
                $('#lnkAlumno').unbind('click');
                $('#lnkAlumno').click(function() {
                    var alumno = objeto('alumno', '<%=request.getContextPath()%>');
                    var alumnoView = vista(alumno, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(alumnoView.getEmptyList());

                    var alumnoControl = control_alumno_list('<%=request.getContextPath()%>');
                    alumnoControl.inicia(alumnoView, 1, null, null, 10, null, null, null, null);
                    return false;
                });
                $('#lnkEntrada').unbind('click');
                $('#lnkEntrada').click(function() {
                    var entrada = objeto('entrada', '<%=request.getContextPath()%>');
                    var entradaView = vista(entrada, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(entradaView.getEmptyList());

                    var entradaControl = control_entrada_list('<%=request.getContextPath()%>');
                    entradaControl.inicia(entradaView, 1, null, null, 10, null, null, null, null);
                    return false;
                });

                $('#lnkUsuario').unbind('click');
                $('#lnkUsuario').click(function() {
                    var usuario = objeto('usuario', '<%=request.getContextPath()%>');
                    var usuarioView = vista(usuario, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(usuarioView.getEmptyList());

                    var usuarioControl = control_usuario_list('<%=request.getContextPath()%>');
                    usuarioControl.inicia(usuarioView, 1, null, null, 10, null, null, null, null);
                    return false;
                });

                $('#lnkHilo').unbind('click');
                $('#lnkHilo').click(function() {
                    var hilo = objeto('hilo', '<%=request.getContextPath()%>');
                    var hiloView = vista(hilo, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(hiloView.getEmptyList());

                    var hiloControl = control_hilo_list('<%=request.getContextPath()%>');
                    hiloControl.inicia(hiloView, 1, null, null, 10, null, null, null, null);
                    return false;
                });
                $('#lnkTipodocumento').unbind('click');
                $('#lnkTipodocumento').click(function() {
                    var tipodocumento = objeto('tipodocumento', '<%=request.getContextPath()%>');
                    var tipodocumentoView = vista(tipodocumento, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(tipodocumentoView.getEmptyList());

                    var tipodocumentoControl = control_tipodocumento_list('<%=request.getContextPath()%>');
                    tipodocumentoControl.inicia(tipodocumentoView, 1, null, null, 10, null, null, null, null);
                    return false;
                });

                $('#lnkActividad').unbind('click');
                $('#lnkActividad').click(function() {
                    var actividad = objeto('actividad', '<%=request.getContextPath()%>');
                    var actividadView = vista(actividad, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(actividadView.getEmptyList());

                    var actividadControl = control_actividad_list('<%=request.getContextPath()%>');
                    actividadControl.inicia(actividadView, 1, null, null, 10, null, null, null, null);
                    return false;
                });

                $('#lnkVotodocumento').unbind('click');
                $('#lnkVotodocumento').click(function() {
                    var votodocumento = objeto('votodocumento', '<%=request.getContextPath()%>');
                    var votodocumentoView = vista(votodocumento, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(votodocumentoView.getEmptyList());

                    var votodocumentoControl = control_votodocumento_list('<%=request.getContextPath()%>');
                    votodocumentoControl.inicia(votodocumentoView, 1, null, null, 10, null, null, null, null);
                    return false;
                });

                $('#lnkEmpresa').unbind('click');
                $('#lnkEmpresa').click(function() {
                    var empresa = objeto('empresa', '<%=request.getContextPath()%>');
                    var empresaView = vista(empresa, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(empresaView.getEmptyList());

                    var empresaControl = control_empresa_list('<%=request.getContextPath()%>');
                    empresaControl.inicia(empresaView, 1, null, null, 10, null, null, null, null);
                    return false;
                });

                $('#lnkVotodocumento').unbind('click');
                $('#lnkVotodocumento').click(function() {
                    var votodocumento = objeto('votodocumento', '<%=request.getContextPath()%>');
                    var votodocumentoView = vista(votodocumento, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(votodocumentoView.getEmptyList());

                    var votodocumentoControl = control_votodocumento_list('<%=request.getContextPath()%>');
                    votodocumentoControl.inicia(votodocumentoView, 1, null, null, 10, null, null, null, null);
                    return false;
                });
                
                $('#lnkActividadoffline').unbind('click');
                $('#lnkActividadoffline').click(function() {
                    var actividadoffline = objeto('actividadoffline', '<%=request.getContextPath()%>');
                    var actividadofflineView = vista(actividadoffline, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(actividadofflineView.getEmptyList());

                    var actividadofflineControl = control_actividadoffline_list('<%=request.getContextPath()%>');
                    actividadofflineControl.inicia(actividadofflineView, 1, null, null, 10, null, null, null, null);
                    return false;
                });
                
                $('#lnkEntrega').unbind('click');
                $('#lnkEntrega').click(function() {
                    var entrega = objeto('entrega', '<%=request.getContextPath()%>');
                    var entregaView = vista(entrega, '<%=request.getContextPath()%>');

                    $('#indexContenidoJsp').empty();
                    $('#indexContenido').empty().append(entregaView.getEmptyList());

                    var entregaControl = control_entrega_list('<%=request.getContextPath()%>');
                    entregaControl.inicia(entregaView, 1, null, null, 10, null, null, null, null);
                    return false;
                });

            });

        </script>
    </body>
</html>
