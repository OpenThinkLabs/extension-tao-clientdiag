<?php
use oat\tao\helpers\Template;
use oat\tao\helpers\Layout;
use oat\tao\model\theme\Theme;
$config = get_data('clientDiagConfig');
?>

<!doctype html>
<html class="no-js no-version-warning">
<head>
    <script src="<?= Template::js('lib/modernizr-2.8/modernizr.js', 'tao') ?>"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= Layout::getTitle() ?></title>
    <link rel="shortcut icon" href="<?= Template::img('img/favicon.ico') ?>"/>

    <script
        id="amd-loader"
        src="<?= Template::js('lib/require.js', 'tao') ?>"
        data-controller="<?= Template::js('controller/CompatibilityChecker/') ?>"
        data-main="<?= Template::js('index.js') ?>"
        data-config="<?= get_data('clientConfigUrl') ?>">
    </script>
    <link rel='stylesheet' type='text/css' href="<?= Template::css('diagnostics.css') ?>"/>
    <?= tao_helpers_Scriptloader::render() ?>
    <link rel="stylesheet" href="<?= Layout::getThemeStylesheet(Theme::CONTEXT_FRONTOFFICE) ?>"/>

</head>

<body>
<div id="requirement-check" class="feedback-error js-hide">
    <span class="icon-error"></span>
    <span id="requirement-msg-area"><?=
        __('You must activate JavaScript in your browser to run this application.') ?></span>
</div>
<script src="<?= Template::js('layout/requirement-check.js', 'tao')?>"></script>

<div class="content-wrap">

    <?php Template::inc('blocks/header.tpl', 'tao'); ?>

    <div class="diagnostics-main-area">

        <h1><?= __('Diagnostic Tool') ?></h1>

        <div class="intro">
            <p><?= __($config['diagHeader']) ?></p>
            <p><?= __('Be aware that these tests will take up to several minutes.') ?></p>
        </div>
        <div class="clearfix">
            <button data-action="test-launcher" class="btn-info small rgt"><?= __('Begin diagnostics') ?></button>
        </div>

        <ul class="plain">
            <li data-result="browser">
                <h2><?= __('Operating system and web browser') ?></h2>
                <div class="small feedback">
                    <span class="icon"></span>
                    <span class="msg"></span>
                </div>
            </li>
            <li data-result="performance" data-config="<?= isset($config['performances']) ? _dh(json_encode($config['performances'])) : ''; ?>">
                <h2><?= __('Workstation performance') ?></h2>
                <div>
                    <div class="small feedback">
                        <span class="icon"></span>
                        <span class="msg"></span>
                    </div>
                    <div class="quality-bar">
                        <div class="quality-indicator"></div>
                    </div>
                </div>
            </li>
            <li data-result="bandwidth-0" data-config="<?= isset($config['bandwidth']) ? _dh(json_encode($config['bandwidth'])) : ''; ?>">
                <h2><?= __('Bandwidth'); ?></h2>
                <div>
                    <div class="legend"><?= __('Number of simultaneous test takers the connection can handle'); ?></div>
                    <div class="small feedback">
                        <span class="icon"></span>
                        <span class="msg"></span>
                    </div>
                    <div class="quality-bar">
                        <div class="quality-indicator"></div>
                    </div>
                </div>
            </li>
            <li data-result="total">
                <h2><?= __('Total') ?></h2>
                <div>
                    <div class="small feedback">
                        <span class="icon"></span>
                        <span class="msg"></span>
                    </div>
                    <div class="quality-bar" data-result="total">
                        <div class="quality-indicator"></div>
                    </div>
                </div>
                <div class="clearfix">
                    <button data-action="display-details" class="rgt btn-info small"><?=
                        __('Show Details') ?></button>
                </div>
            </li>
            <li data-result="details">
                <h2><?= __('Details') ?></h2>
                <div>
                    <table class="matrix" id="details">
                        <tbody>
                        </tbody>
                    </table>
                </div>

            </li>
        </ul>

    </div>

</div>

<?= Layout::renderThemeTemplate(Theme::CONTEXT_FRONTOFFICE, 'footer') ?>

<div class="loading-bar"></div>
</body>
</html>
