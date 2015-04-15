<li class="start active">
    <a href="<?php echo $this->Html->url('/', false) ?>">
        <i class="icon-home"></i>
        <span class="title">Dashboard</span>
        <span class="selected"></span>
    </a>
</li>
<li class="">
    <a href="javascript:;">
        <i class="icon-group"></i>
        <span class="title">Cadastros</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub-menu">
        <li >
            <a href="<?php echo $this->Html->url(array('controller' => 'clientes', 'action' => 'listar')) ?>">
                <i class="icon-user"></i>
                Clientes
                <span class="badge badge-roundless badge-important">new</span>
            </a>
        </li>
        <li >
            <a href="<?php echo $this->Html->url(array('controller' => 'pets', 'action' => 'listar')) ?>">
                <i class="icon-linux"></i>
                Pet's
                <span class="badge badge-warning badge-roundless">new</span>
            </a>
        </li>
        <li >
            <a href="<?php echo $this->Html->url(array('controller' => 'produtos', 'action' => 'listar')) ?>">
                <i class="icon-truck"></i>
                Produtos
                <span class="badge badge-info">4</span>
            </a>
        </li>

    </ul>
</li>
<li class="">
    <a href="javascript:;">
        <i class="icon-cogs"></i>
        <span class="title">Configurações</span>
        <span class="arrow "></span>
    </a>
    <ul class="sub-menu">
        <li >
            <a href="">
                Usuários
                <span class="badge badge-roundless badge-important">new</span>
            </a>
        </li>
        <li >
            <a href="">
                <i class="icon-home"></i>
                Banco de Dados
            </a>
        </li>
        <li >
            <a href="">
                <i class=""></i>
                Configurador de Etiquetas
            </a>
        </li>
        <li class="">
            <a href="javascript:;">
                <i class="icon-user"></i>
                <span class="title">Login Options</span>
                <span class="arrow "></span>
            </a>
            <ul class="sub-menu">
                <li >
                    <a href="login.html">
                        Login Form 1</a>
                </li>
                <li >
                    <a href="login_soft.html">
                        Login Form 2</a>
                </li>
            </ul>
        </li>
    </ul>
</li>
</ul>