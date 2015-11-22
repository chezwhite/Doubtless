<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Mobile first -->
        <meta name="author" content="Borxa Mendez Candeias &amp; Andrea Sanchez Blanco">

        <title>FAQ.life</title> <!-- Titulo de la pestaña -->
        <?php echo $this->Html->meta('icon');?> <!-- Icono de la pestaña -->

        <!-- Bootstrap CSS-->
        <?php echo $this->Html->css('bootstrap.min'); ?>

        <!-- Custom CSS -->
        <?php echo $this->Html->css('main');
         echo $this->Html->css('fonts'); ?>
    </head>

    <div id="content">
        <?php echo $this->Flash->render(); ?>

        <?php echo $this->fetch('content'); ?>
    </div>

    <!-- Footer -->
    <footer class="col-xs-12 col-sm-12 col-md-12">
        <hr class="small">
        <p class="footer-autores">Copyright &copy; FAQ.life 2015 - Borxa Mendez Candeias &amp; Andrea Sanchez Blanco</p>
    </footer>
    
    <!-- Login Modal Page -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <a href="../usuarios/index" class="btn btn-register"> Registrarse </a>
                    <h4 class="modal-title osSansFont" id="myModalLabel">Log in</h4>
                </div>

                <!-- Contenido de la página login modal -->
                <div class="modal-body">
                    <form name="sentMessage" id="loginForm" novalidate>
                        <?php echo $this->Flash->render('auth'); ?>
                        <?php echo $this->Form->create('Usuario'); ?>
                            <fieldset>
                                <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <?php echo $this->Form->input('username', array('class' => 'form-control'));?>
                                    </div>
                                </div>
                                <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <?php echo $this->Form->input('password', array('class' => 'form-control'));?>
                                    </div>
                                </div>
                            </fieldset>
                        <?php echo $this->Form->end(); ?>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn-login">Iniciar sesion</button>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <?php echo $this->Html->script('jquery.min'); ?>
    <!-- Bootstrap JavaScript -->
    <?php echo $this->Html->script('bootstrap.min'); ?>

</html>