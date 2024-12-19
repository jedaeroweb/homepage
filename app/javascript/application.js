// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import Rails from '@rails/ujs';
window.Rails = Rails;

import "trix"
import * as bootstrap from 'bootstrap';
window.Modal = bootstrap.Modal;

import './add_jquery'
import 'jquery-ui-dist/jquery-ui.min'
import './jquery.pagination';
import './common'
import './index'


