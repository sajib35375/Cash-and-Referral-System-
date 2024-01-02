@extends('admin.layouts.master')

@section('master')
    <div class="row">
        <div class="col-xxl">
            <div class="card mb-4">
                <h5 class="card-header">@lang('Site Preferences')</h5>
                <hr class="mt-0">
                <form class="card-body" action="" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label required">@lang('Site Name')</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="site_name" value="{{ $setting->site_name }}" placeholder="@lang('Phinix Admin Template')" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label required">@lang('Platform Currency')</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="site_cur" value="{{ $setting->site_cur }}" placeholder="@lang('USD')" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label required">@lang('Currency Symbol')</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="cur_sym" value="{{ $setting->cur_sym }}" placeholder="$" required>
                        </div>
                    </div>
                    <hr class="my-4 mx-n4" />
                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label required">@lang('Time Region')</label>
                        <div class="col-sm-9 select2-design">
                            <select class="select2 form-select" name="timeRegion" data-allow-clear="true" required>
                                @foreach($timeRegions as $timeRegion)
                                    <option value="'{{ @$timeRegion}}'">{{ __($timeRegion) }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label required">@lang('Primary Color')</label>
                        <div class="col-sm-9">
                            <div class="input-group">
                                <span class="input-group-text p-0 border-0">
                                    <input type="text" value="{{ $setting->first_color }}" class="form-control colorPicker">
                                </span>
                                <input type="text" class="form-control colorCode" name="first_color" value="{{ $setting->first_color }}" placeholder="@lang('Primary color')" required>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label required">@lang('Secondary Color')</label>
                        <div class="col-sm-9">
                            <div class="input-group">
                                <span class="input-group-text p-0 border-0">
                                    <input type="text" value="{{ $setting->second_color }}" class="form-control colorPicker">
                                </span>
                                <input type="text" class="form-control colorCode" name="second_color" value="{{ $setting->second_color }}" placeholder="@lang('Secondary color')" required>
                            </div>
                        </div>
                    </div>
                    <div class="divider mt-5 mb-4">
                        <div class="divider-text"><h5 class="text-primary">@lang('Logo & Favicon')</h5></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <div class="image-upload">
                                <div class="thumb">
                                    <div class="avatar-preview">
                                        <div class="profilePicPreview" style="background-image: url({{ getImage(getFilePath('logoFavicon').'/logo.png') }})">
                                            <button type="button" class="remove-image"><i class="las la-trash"></i></button>
                                        </div>
                                    </div>
                                    <div class="avatar-edit">
                                        <input type="file" class="profilePicUpload" name="logo" id="profilePicUpload1" accept=".png, .jpg, .jpeg">
                                        <label for="profilePicUpload1" class="btn btn-primary">@lang('Logo')</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="image-upload">
                                <div class="thumb">
                                    <div class="avatar-preview">
                                        <div class="profilePicPreview" style="background-image: url({{ getImage(getFilePath('logoFavicon').'/favicon.png', getFileSize('favicon')) }})">
                                            <button type="button" class="remove-image"><i class="las la-trash"></i></button>
                                        </div>
                                    </div>
                                    <div class="avatar-edit">
                                        <input type="file" class="profilePicUpload" name="favicon" id="profilePicUpload2" accept=".png, .jpg, .jpeg">
                                        <label for="profilePicUpload2" class="btn btn-primary">@lang('Favicon')</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-4">
                        <div class="col-12 text-center">
                            <button type="submit" class="btn btn-primary me-sm-2 me-1">@lang('Submit')</button>
                            <button type="reset" class="btn btn-label-secondary">@lang('Cancel')</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-xxl">
            <div class="card mb-4">
                <h5 class="card-header">@lang('System Preferences')</h5>
                <hr class="mt-0">
                <div class="card-body">
                    <form action="{{ route('admin.basic.system.setting') }}" method="POST">
                        @csrf
                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/signup.png') }}" alt="signup" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('User Signup')</h6>
                                    <small class="text-muted">@lang('Enable or disable user registration with this toggle for your website. If deactivated, the option to create new accounts will be disabled')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="signup" @if($setting->signup) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/password.png') }}" alt="signup" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('Enforce Strong Password')</h6>
                                    <small class="text-muted">@lang('Enhance account security by enforcing the use of strong passwords with this toggle, ensuring robust user authentication.')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="strong_pass" @if($setting->strong_pass) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/policy.png') }}" alt="policy" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('Accept Policy')</h6>
                                    <small class="text-muted">@lang('Control user access by enabling this toggle, which mandates users to agree to your terms before accessing the website.')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="agree_policy" @if($setting->agree_policy) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/kyc.png') }}" alt="kyc" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('Know Your Customer Check')</h6>
                                    <small class="text-muted">@lang('Implement this toggle to require user identity verification, enhancing trust and compliance with regulatory standards on your website.')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="kc" @if($setting->kc) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/mailverify.png') }}" alt="mail" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('Email Confirmation')</h6>
                                    <small class="text-muted">@lang('Ensure user authenticity by enabling this toggle, requiring users to verify their email addresses during the registration process.')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="ec" @if($setting->ec) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/mailalert.png') }}" alt="mail" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('Email Alert')</h6>
                                    <small class="text-muted">@lang('Activate this toggle to notify users via email about important updates, events, and announcements on your website.')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="ea" @if($setting->ea) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/smsverify.png') }}" alt="Mobile" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('Mobile Confirmation')</h6>
                                    <small class="text-muted">@lang('Enhance user verification by enabling this toggle, which mandates users to confirm their identity via their mobiles during registration.')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="sc" @if($setting->sc) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/smsalert.png') }}" alt="phone" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('SMS Alert')</h6>
                                    <small class="text-muted">@lang('Activate this toggle to notify users via SMS about important updates, events, and announcements on your website.')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="sa" @if($setting->sa) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/sslcertificate.png') }}" alt="ssl" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('Enforce SSL')</h6>
                                    <small class="text-muted">@lang('Ensure data security by requiring all connections to your website to be encrypted using this toggle feature.')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="enforce_ssl"  @if($setting->enforce_ssl) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <div class="flex-shrink-0">
                                <img src="{{ getImage(getFilePath('setting').'/language.png') }}" alt="language" class="me-3" height="40">
                            </div>
                            <div class="flex-grow-1 row">
                                <div class="col-9 mb-sm-0 mb-2">
                                    <h6 class="mb-0">@lang('Language Preference')</h6>
                                    <small class="text-muted">@lang('Control user experience by activating this toggle, allowing visitors to select their preferred language for seamless interaction.')</small>
                                </div>
                                <div class="col-3 text-end">
                                    <label class="switch me-0">
                                        <input type="checkbox" class="switch-input" name="language" @if($setting->language) checked @endif>
                                        @include('admin.partials.switcher')
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row pt-4">
                            <div class="col-12 text-center">
                                <button type="submit" class="btn btn-primary">@lang('Submit')</button>
                                <button type="reset" class="btn btn-label-secondary">@lang('Cancel')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('page-style-lib')
    <link rel="stylesheet" href="{{asset('assets/admin/css/page/select2.css')}}">
    <link rel="stylesheet" href="{{asset('assets/admin/css/page/spectrum.css')}}">
@endpush

@push('page-script-lib')
    <script src="{{asset('assets/admin/js/page/select2.js')}}"></script>
    <script src="{{asset('assets/admin/js/page/spectrum.js')}}"></script>
@endpush

@push('page-style')
    <style>
        .sp-replacer {
            padding: 0;
            border: none;
            border-radius: 5px 0 0 5px;
        }

        .sp-preview {
            width: 70px;
            height: 39px;
            border: 0;
        }

        .sp-preview-inner {
            width: 110px;
        }

        .sp-dd {
            display: none;
        }
    </style>
@endpush

@push('page-script')
  <script>
    (function ($) {
        "use strict";

        $('.colorPicker').spectrum({
            color: $(this).data('color'),
            change: function (color) {
                $(this).parent().siblings('.colorCode').val(color.toHexString().replace(/^#?/, ''));
            }
        });

        $('.colorCode').on('input', function () {
            var clr = $(this).val();
            $(this).parents('.input-group').find('.colorPicker').spectrum({
                color: clr,
            });
        });

        $('[name=timeRegion]').val("'{{ config('app.timezone') }}'").select2();

        $('.select2').select2({
            placeholder: "@lang('Select value')",
            dropdownParent: '.select2-design'
        });
    })(jQuery);
  </script>
@endpush
