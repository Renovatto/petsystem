<div class="page-content">
   <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->               
   <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
               <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
               Widget settings form goes here
               Aqui esta escrito alguma coisa
            </div>
            <div class="modal-footer">
               <button type="button" class="btn blue">Save changes</button>
               <button type="button" class="btn default" data-dismiss="modal">Close</button>
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
   <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
   <!-- BEGIN STYLE CUSTOMIZER -->
   <div class="theme-panel hidden-xs hidden-sm">
      <div class="toggler"></div>
      <div class="toggler-close"></div>
      <div class="theme-options">
         <div class="theme-option theme-colors clearfix">
            <span>THEME COLOR</span>
            <ul>
               <li class="color-black current color-default" data-style="default"></li>
               <li class="color-blue" data-style="blue"></li>
               <li class="color-brown" data-style="brown"></li>
               <li class="color-purple" data-style="purple"></li>
               <li class="color-grey" data-style="grey"></li>
               <li class="color-white color-light" data-style="light"></li>
            </ul>
         </div>
         <div class="theme-option">
            <span>Layout</span>
            <select class="layout-option form-control input-small">
               <option value="fluid" selected="selected">Fluid</option>
               <option value="boxed">Boxed</option>
            </select>
         </div>
         <div class="theme-option">
            <span>Header</span>
            <select class="header-option form-control input-small">
               <option value="fixed" selected="selected">Fixed</option>
               <option value="default">Default</option>
            </select>
         </div>
         <div class="theme-option">
            <span>Sidebar</span>
            <select class="sidebar-option form-control input-small">
               <option value="fixed">Fixed</option>
               <option value="default" selected="selected">Default</option>
            </select>
         </div>
         <div class="theme-option">
            <span>Footer</span>
            <select class="footer-option form-control input-small">
               <option value="fixed">Fixed</option>
               <option value="default" selected="selected">Default</option>
            </select>
         </div>
      </div>
   </div>
   <!-- END BEGIN STYLE CUSTOMIZER -->  
   <!-- BEGIN PAGE HEADER-->
   <div class="row">
      <div class="col-md-12">
         <!-- BEGIN PAGE TITLE & BREADCRUMB-->
         <h3 class="page-title">
            Dashboard <small>e estatísticas</small>
         </h3>
         <ul class="page-breadcrumb breadcrumb">
            <li>
               <i class="icon-home"></i>
               <a href="index.html">Home</a> 
               <i class="icon-angle-right"></i>
            </li>
            <li><a href="#">Dashboard</a></li>
            <li class="pull-right">
               <div id="dashboard-report-range" class="dashboard-date-range tooltips" data-placement="top" data-original-title="Change dashboard date range">
                  <i class="icon-calendar"></i>
                  <span></span>
                  <i class="icon-angle-down"></i>
               </div>
            </li>
         </ul>
         <!-- END PAGE TITLE & BREADCRUMB-->
      </div>
   </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
       <div class="dashboard-stat blue">
          <div class="visual">
             <i class="icon-group"></i>
          </div>
          <div class="details">
             <div class="number">
                1349
             </div>
             <div class="desc">                           
                Clientes Ativos
             </div>
          </div>
          <a class="more" href="#">
          Lista de Clientes <i class="m-icon-swapright m-icon-white"></i>
          </a>                 
       </div>
    </div>
   
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat green">
           <div class="visual">
              <i class="icon-calendar"></i>
           </div>
           <div class="details">
              <div class="number">23</div>
              <div class="desc">Agendamentos</div>
           </div>
           <a class="more" href="#">
           Agendamentos do dia <i class="m-icon-swapright m-icon-white"></i>
           </a>                 
        </div>
     </div>
     <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat red">
           <div class="visual">
              <i class="icon-bell"></i>
           </div>
           <div class="details">
              <div class="number">6</div>
              <div class="desc">Novos Alertas</div>
           </div>
           <a class="more" href="#">
           Detalhes <i class="m-icon-swapright m-icon-white"></i>
           </a>                 
        </div>
     </div>
     <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat purple">
           <div class="visual">
              <i class="icon-medkit"></i>
           </div>
           <div class="details">
              <div class="number">458</div>
              <div class="desc">Vacinas do mês</div>
           </div>
           <a class="more" href="#">
           Lista de Vacinas <i class="m-icon-swapright m-icon-white"></i>
           </a>                 
        </div>
     </div>   
   
</div>


