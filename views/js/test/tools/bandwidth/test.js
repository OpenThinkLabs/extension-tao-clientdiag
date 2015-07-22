/**
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
 * Copyright (c) 2015 (original work) Open Assessment Technologies SA ;
 */
define(['taoClientDiagnostic/tools/bandwidth/tester'], function(bandwidthTester){
    'use strict';

    QUnit.module('API');

    QUnit.test('The tester has the right form', function(assert){
        assert.ok(typeof bandwidthTester === 'function', 'The module exposes a function');
        assert.ok(typeof bandwidthTester() === 'object', 'bandwidthTester is a factory');
        assert.ok(typeof bandwidthTester().start === 'function', 'the test has a start method');
    });


    QUnit.module('Test');

    QUnit.asyncTest('The tester runs', function(assert){

        QUnit.expect(10);

        bandwidthTester().start(function(speed, details){

            var toString = {}.toString;

            console.log(speed, details);

            assert.ok(typeof speed === 'number', 'The result is a number');
            assert.ok(speed > 0, 'The result is a positive number');
            assert.ok(typeof details === 'object', 'The details are provided inside an object');
            assert.ok(typeof details.min === 'number', 'The minimum speed is provided inside the details');
            assert.ok(typeof details.max === 'number', 'The maximum speed is provided inside the details');
            assert.ok(typeof details.average === 'number', 'The average speed is provided inside the details');
            assert.ok(typeof details.variance === 'number', 'The speed variance is provided inside the details');
            assert.ok(typeof details.duration === 'number', 'The total duration of the test is provided inside the details');
            assert.ok(typeof details.size === 'number', 'The total size of the test is provided inside the details');
            assert.ok(toString.call(details.measures) === '[object Array]', 'The detailed measures are provided inside the details');

            QUnit.start();
        });

    });

});
