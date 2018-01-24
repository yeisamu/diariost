
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>S.A.R.T</title>

    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

    <!-- BEGIN CORE CSS -->
    <link rel="stylesheet" href="<?php echo base_url() ?>css/admin1.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>css/elements.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>css/styles_login.css">
    <!-- END CORE CSS -->

    <!-- BEGIN PLUGINS CSS -->
    <link rel="stylesheet" href="<?php echo base_url() ?>plugins/bootstrap-social/bootstrap-social.css">
    <!-- END PLUGINS CSS -->

    <!-- FIX PLUGINS -->
    <link rel="stylesheet" href="<?php echo base_url() ?>css/plugins.css">
    <!-- END FIX PLUGINS -->

    <!-- BEGIN SHORTCUT AND TOUCH ICONS -->
    <link rel="shortcut icon" href="<?php echo base_url() ?>img/icons/favicon.ico">
    <link rel="apple-touch-icon" href="<?php echo base_url() ?>img/icons/apple-touch-icon.png">
    <!-- END SHORTCUT AND TOUCH ICONS -->
</head>
<body>
    <div class="container">
        <div style="text-align:center;margin-bottom: 10px;">
            <i class="fa fa-taxi" style="font-size:115px;color: #fff;"></i>
        </div>
        <div style="text-align:center;margin-bottom: 20px;">
            <span class="tittle_nav" href="javascript:void(0);"><strong></strong> S.A.R.T</span>
        </div>
        <input type="hidden" value="<?php echo base_url() ?>" name="base_url" id="base_url" >
        <form class="form-signin" id="login_form">

            <input type="text" class="form-control" placeholder="Usuario" required="" autofocus="" autocorrect="off" autocomplete="off" name="username" spellcheck="false" autocapitalize="off">
            <input type="password" class="form-control" placeholder="Password" name="password" required="" autocorrect="off" spellcheck="false" autocapitalize="off">
            <?php 
              $datagrupo=$grupo->row();

            ?>
            <input type="hidden" name="grupo" value="<?php echo $datagrupo->grupo ?>">
            <!-- <div class="form-group has-success">
                <div class="inputer">
                    <div class="input-wrapper">
                        <select class="selectpicker" name="grupo" data-style="btn-success" data-width="100%">
                          <option selected="selected" value="">Empresa</option>
                      <?php 
                        //foreach ($grupo->result() as $datagrupo) {
                      ?>
                          <option value=" <?php //echo $datagrupo->grupo ?>"> <?php //echo $datagrupo->grupo ?></option>
                     <?php
                       //}  
                     ?>
                        </select>
                    </div>
                </div>
            </div> --><!--.form-group has-success-->
            <div id="label_login_error" class="" style="margin-top: 20px;">
            </div> 
            <button id="login_button" class="btn btn_login btn-lg btn btn-success btn-block" style="margin-top:10px;">
                Ingresar
            </button>
            <button id="" type="reset" class="btn btn-lg btn btn-warning btn-block" style="margin-top:10px;">
                Cancelar
            </button>
            
        </form>
    </div> 
    <script src="<?php echo base_url() ?>js/global-vendors.js"></script>
    <!-- END GLOBAL AND THEME VENDORS -->

    <!-- BEGIN PLUGINS AREA -->
    <!-- END PLUGINS AREA -->

    <!-- PLUGINS INITIALIZATION AND SETTINGS -->
    <script src="<?php echo base_url() ?>scripts/user-pages.js"></script>
    <!-- END PLUGINS INITIALIZATION AND SETTINGS -->

    <!-- PLEASURE Initializer -->
    <script src="<?php echo base_url() ?>js/pleasure.js"></script>
    <!-- ADMIN 1 Layout Functions -->
    <script src="<?php echo base_url() ?>js/layout.js"></script>
    <script src="<?php echo base_url() ?>js/funciones.js"></script>
</body>
</html>