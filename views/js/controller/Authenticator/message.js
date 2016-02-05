/*
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; under version 2
 * of the License (non-upgradable).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * Copyright (c) 2015 (original work) Open Assessment Technologies SA;
 *
 */

/**
 *
 * @author dieter <camille@taotesting.com>
 */
define([
    'jquery',
    'lodash',
    'i18n',
    'async',
    'helpers',
    'ui/feedback'
], function ($, _, __, async, helpers, feedback) {
    'use strict';

    var init = function init(){
        var $feedbackBox = $('#feedback-box');

        if(!!$feedbackBox.data('error')){
            feedback().error($feedbackBox.data('error'));
        }
        if($feedbackBox.data('message')){
            feedback().error($feedbackBox.data('message'));
        }
    };

    /**
     * @exports
     */
    return init();
});