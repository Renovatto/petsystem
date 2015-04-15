<!--//Inicio menu superior-->
<div class="header navbar navbar-inverse navbar-fixed-top">

    <div class="header-inner">
        <?php
        //LOGO
        echo $this->Html->link(
                $this->Html->image("logo.png", array("alt" => "logo", "id" => "logo", "class" => "img-responsive")), '/', array('escape' => false, 'class' => 'navbar-brand')
        );
        //FIM LOGO
        //BEGIN RESPONSIVE MENU TOGGLER
        echo $this->Html->link($this->Html->image("menu-toggler.png"), 'javascript:;', array('escape' => false,
            'class' => 'navbar-toggle',
            'data-toggle' => 'collapse',
            'data-target' => '.navbar-collapse')
        );

        //FIM RESPONSIVE MENU TOGGLER
        ?>

        <ul class="nav navbar-nav pull-right">
            <!-- //Lista de Notificacoes-->
            <li class="dropdown" id="header_notification_bar">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                   data-close-others="true">
                    <i class="icon-warning-sign"></i>
                    <span class="badge">6</span>
                </a>
                <ul class="dropdown-menu extended notification">
                    <li>
                        <p>Você possui 14 novos eventos</p>
                    </li>
                    <li>
                        <ul class="dropdown-menu-list scroller" style="height: 250px;">
                            <li>
                                <a href="#">
                                    <span class="label label-sm label-icon label-success"><i class="icon-plus"></i></span>
                                    Novo usuário cadastrado.
                                    <span class="time">Verifique Agora</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-sm label-icon label-danger"><i class="icon-bolt"></i></span>
                                    Server #12 overloaded.
                                    <span class="time">15 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-sm label-icon label-warning"><i class="icon-bell"></i></span>
                                    Server #2 not responding.
                                    <span class="time">22 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-sm label-icon label-info"><i class="icon-bullhorn"></i></span>
                                    Application error.
                                    <span class="time">40 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-sm label-icon label-danger"><i class="icon-bolt"></i></span>
                                    Database overloaded 68%.
                                    <span class="time">2 hrs</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-sm label-icon label-danger"><i class="icon-bolt"></i></span>
                                    2 user IP blocked.
                                    <span class="time">5 hrs</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-sm label-icon label-warning"><i class="icon-bell"></i></span>
                                    Storage Server #4 not responding.
                                    <span class="time">45 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-sm label-icon label-info"><i class="icon-bullhorn"></i></span>
                                    System Error.
                                    <span class="time">55 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-sm label-icon label-danger"><i class="icon-bolt"></i></span>
                                    Database overloaded 68%.
                                    <span class="time">2 hrs</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="external">
                        <a href="#">See all notifications <i class="m-icon-swapright"></i></a>
                    </li>
                </ul>
            </li>
            <!-- Fim Lista de Notificacoes -->

            <!-- //Lista de novas mensagens-->
            <li class="dropdown" id="header_inbox_bar">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                   data-close-others="true">
                    <i class="icon-envelope"></i>
                    <span class="badge">5</span>
                </a>
                <ul class="dropdown-menu extended inbox">
                    <li>
                        <p>Você possui 12 novas mensagens</p>
                    </li>
                    <li>
                        <ul class="dropdown-menu-list scroller" style="height: 250px;">
                            <li>
                                <a href="inbox.html?a=view">
                                    <span class="photo"><?php echo $this->Html->image("avatar2.jpg") ?></span>
                                    <span class="subject">
                                        <span class="from">Lisa Wong</span>
                                        <span class="time">Just Now</span>
                                    </span>
                                    <span class="message">
                                        Vivamus sed auctor nibh congue nibh. auctor nibh
                                        auctor nibh...
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="inbox.html?a=view">
                                    <span class="photo"><?php echo $this->Html->image("avatar3.jpg") ?></span>
                                    <span class="subject">
                                        <span class="from">Richard Doe</span>
                                        <span class="time">16 mins</span>
                                    </span>
                                    <span class="message">
                                        Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh
                                        auctor nibh...
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="inbox.html?a=view">
                                    <span class="photo"><?php echo $this->Html->image("avatar1.jpg") ?></span>
                                    <span class="subject">
                                        <span class="from">Bob Nilson</span>
                                        <span class="time">2 hrs</span>
                                    </span>
                                    <span class="message">
                                        Vivamus sed nibh auctor nibh congue nibh. auctor nibh
                                        auctor nibh...
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="inbox.html?a=view">
                                    <span class="photo"><?php echo $this->Html->image("avatar2.jpg") ?></span>
                                    <span class="subject">
                                        <span class="from">Lisa Wong</span>
                                        <span class="time">40 mins</span>
                                    </span>
                                    <span class="message">
                                        Vivamus sed auctor 40% nibh congue nibh...
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="inbox.html?a=view">
                                    <span class="photo"><?php echo $this->Html->image("avatar3.jpg") ?></span>
                                    <span class="subject">
                                        <span class="from">Richard Doe</span>
                                        <span class="time">46 mins</span>
                                    </span>
                                    <span class="message">
                                        Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh
                                        auctor nibh...
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="external">
                        <a href="inbox.html">See all messages <i class="m-icon-swapright"></i></a>
                    </li>
                </ul>
            </li>
            <!-- //Fim lista de novas mensagens-->

            <!--//Menu Dados do Usuarios-->
            <li class="dropdown user">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                    <?php echo $this->Html->image("avatar1_small.jpg") ?>
                    <span class="username">Andre Renovatto</span>
                    <i class="icon-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="extra_profile.html"><i class="icon-user"></i> My Profile</a>
                    </li>
                    <li><a href="page_calendar.html"><i class="icon-calendar"></i> My Calendar</a>
                    </li>
                    <li><a href="inbox.html"><i class="icon-envelope"></i> My Inbox <span class="badge badge-danger">3</span></a>
                    </li>
                    <li><a href="#"><i class="icon-tasks"></i> My Tasks <span class="badge badge-success">7</span></a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="javascript:;" id="trigger_fullscreen"><i class="icon-move"></i> Full Screen</a>
                    </li>
                    <li><a href="extra_lock.html"><i class="icon-lock"></i> Lock Screen</a>
                    </li>

                    <li><a href='<?php echo $this->Html->url(array("controller" => "users", "action" => "logout")); ?>'><i class="icon-key"></i> Log Out</a>

                </ul>
            </li>
            <!--//Fim Menu Dados do Usuarios-->
        </ul>

    </div>
    <!-- END TOP NAVIGATION BAR -->
</div>
<!--//Fim menu superior-->

<div class="clearfix"></div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <ul class="page-sidebar-menu">
            <li>
                <!-- Botao para minimizar o menu lateral -->
                <div class="sidebar-toggler hidden-phone"></div>
                <!-- Fim Botao para minimizar o menu lateral -->
            </li>

            <br/><br/>
            <!-- MONTA MENU DINAMICAMENTE -->
            <?php
            $xmenu = $this->requestaction('/menu/getMenu');

            foreach ($xmenu as $menu => $dadosmenu) {
                //echo strtoupper($menu) . '<br>';
                //$boxmenu .= "<li class='start active'>"; //mostra menu selecionado
                $boxmenu .= "<li class=''>";
                $boxmenu .= "<a href ='" . $this->html->url($dadosmenu['menulink'], false) . "' >";
                $boxmenu .= "<i class ='" . $dadosmenu['menuimageclass'] . "'></i>";
                $boxmenu .= "<span class = 'title'>{$dadosmenu['menuname']}</span>";
                isset($dadosmenu['SubMenu']) ? $boxmenu .= "<span class='arrow'></span>" : '';
                //$boxmenu .= "<span class = 'selected'></span>"; // Icon lateral marcando o item selecionado
                $boxmenu .= "</a>";

                if (isset($dadosmenu['SubMenu'])) {
                    $boxmenu .= "<ul class='sub-menu'>";
                    foreach ($dadosmenu['SubMenu'] as $submenu => $dadossubmenu) {
                        //echo "> > > $submenu <br>";
                        $boxmenu .= "<li >";
                        $boxmenu .= "<a href ='" . $this->html->url($dadossubmenu['menulink'], false) . "' >";
                        $boxmenu .= "<i class ='" . $dadossubmenu['menuimageclass'] . "'></i>";
                        $boxmenu .= $submenu;
                        isset($dadossubmenu['SubSubMenu']) ? $boxmenu .= "<span class='arrow'></span>" : '';
                        //$boxmenu .= "<span class='badge badge-roundless badge-important'>new</span>";
                        $boxmenu .= "</a>";

                        //Andre Renovato - 16/04/2014 22:22
                        //o subsubMenu ainda não esta legal, apresenta apenas o ultimo item, nao esta listando todos
                        if (isset($dadossubmenu['SubSubMenu'])) {
                            //Debugger::log($dadossubmenu['SubSubMenu'], 1);
                            $boxmenu .= "<ul class='sub-menu'>";
                            foreach ($dadossubmenu['SubSubMenu'] as $sub_submenu => $dados_subsubmenu) {
                                //echo "> > > > > >$sub_submenu <br>";
                                $boxmenu .= "<li >";
                                $boxmenu .= "<a href ='" . $this->html->url($dados_subsubmenu['menulink'], false) . "' >";
                                $boxmenu .= "<i class ='" . $dados_subsubmenu['menuimageclass'] . "'></i>";
                                $boxmenu .= $dados_subsubmenu['menuname'];
                                //$boxmenu .= "<span class='badge badge-roundless badge-important'>new</span>";
                                $boxmenu .= "</a>";
                                $boxmenu .= "</li>";
                            }
                            $boxmenu .= "</ul>";
                        }
                        $boxmenu .= "</li>";
                    }
                    $boxmenu .= "</ul>";
                }
                $boxmenu .= "</li>";
            }

            echo $boxmenu;
            ?>

        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->