<div class="page-content">
    <div class="col-md-12">
        <h2><?php echo __('Login'); ?></h2>
        <p><?php echo $this->Session->flash('auth'); ?></p>
        <?php echo $this->Form->create('User', array('url' => array('controller' => 'users', 'action' => 'login'))); ?>
        <fieldset>
            <?php
            echo $this->Form->input('username');
            echo $this->Form->input('password');
            ?>
        </fieldset>
        <?php echo $this->Form->end('Submit'); ?>

    </div>
</div>