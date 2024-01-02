@extends($activeTheme. 'layouts.app')
@section('content')
    @php
        $policyPages = getSiteData('policy_pages.element', false, null, true);
    @endphp

    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
         data-sidebar-position="fixed" data-header-position="fixed">
        <div
            class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <div class="d-flex align-items-center justify-content-center w-100">
                <div class="row justify-content-center w-100">
                    <div class="col-md-8 col-lg-7 col-xxl-4">
                        <div class="card mb-0">
                            <div class="card-body">
                                <a href="{{ route('home') }}" class="text-nowrap logo-img text-center d-block py-3 w-100">
                                    <img src="{{ getImage(getFilePath('logoFavicon').'/logo.png') }}" width="180" alt="">
                                </a>
                                <p class="text-center">@lang('User Register')</p>
                                <form action="{{ route('user.register') }}" method="POST" class="verify-gcaptcha">
                                    @csrf
                                    <div class="row">
                                        @if(session()->get('reference') != null)
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="referenceBy" class="form-label">@lang('Reference by')</label>
                                                    <input type="text" name="referBy" id="referenceBy" class="form-control form--control" value="{{session()->get('reference')}}" readonly>
                                                </div>
                                            </div>
                                        @endif

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('First Name')</label>
                                                <input type="text" class="form-control form--control" name="firstname" value="{{ old('firstname') }}" required>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('Last Name')</label>
                                                <input type="text" class="form-control form--control" name="lastname" value="{{ old('lastname') }}" required>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('Username')</label>
                                                <input type="text" class="form-control form--control checkUser" name="username" value="{{ old('username') }}" required>
                                                <small class="text-danger usernameExist"></small>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('E-Mail Address')</label>
                                                <input type="email" class="form-control form--control checkUser" name="email" value="{{ old('email') }}" required>
                                                <small class="text-danger emailExist"></small>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('Country')</label>
                                                <select name="country" class="form-control form--control" required>
                                                    @foreach($countries as $key => $country)
                                                        <option data-mobile_code="{{ $country->dial_code }}" value="{{ $country->country }}" data-code="{{ $key }}">{{ __($country->country) }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('Mobile')</label>
                                                <div class="input-group ">
                                            <span class="input-group-text mobile-code">

                                            </span>
                                                    <input type="hidden" name="mobile_code">
                                                    <input type="hidden" name="country_code">
                                                    <input type="number" name="mobile" value="{{ old('mobile') }}" class="form-control form--control checkUser" required>
                                                </div>
                                                <small class="text-danger mobileExist"></small>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('Password')</label>
                                                <input type="password" class="form-control form--control @if($setting->strong_pass) secure-password @endif" name="password" required>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('Confirm Password')</label>
                                                <input type="password" class="form-control form--control" name="password_confirmation" required>
                                            </div>
                                        </div>

                                        <x-captcha />

                                    </div>

                                    @if($setting->agree_policy)
                                        <div class="form-group my-2">
                                            <input type="checkbox" id="agree" @checked(old('agree')) name="agree" required>
                                            <label for="agree">@lang('I agree with')</label>
                                            <span>
                                        @foreach($policyPages as $policy)
                                                    <a href="{{ route('policy.pages',[slug($policy->data_info->title),$policy->id]) }}" target="_blank">{{ __($policy->data_info->title) }}</a> @if(!$loop->last), @endif
                                                @endforeach
                                    </span>
                                        </div>
                                    @endif

                                    <div class="form-group my-3">
                                        <button type="submit" id="recaptcha" class="btn btn--base w-100 btn-primary"> @lang('Register')</button>
                                    </div>
                                    <p class="mb-0">@lang('Already have an account?') <a href="{{ route('user.login') }}">@lang('Login')</a></p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('page-style')
    <style>
        .country-code .input-group-text{
            background: #fff !important;
        }
        .country-code select{
            border: none;
        }
        .country-code select:focus{
            border: none;
            outline: none;
        }

    </style>
@endpush

@if ($setting->strong_pass)
    @push('page-script-lib')
        <script src="{{asset('assets/universal/js/strong_password.js')}}"></script>
    @endpush
@endif

@push('page-script')
    <script>
        "use strict";

        (function ($) {
            @if($mobileCode)
                $(`option[data-code={{ $mobileCode }}]`).attr('selected','');
            @endif

            $('select[name=country]').change(function() {
                $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
                $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
                $('.mobile-code').text('+'+$('select[name=country] :selected').data('mobile_code'));
            });

            $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
            $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
            $('.mobile-code').text('+'+$('select[name=country] :selected').data('mobile_code'));

            $('.checkUser').on('focusout',function(e) {
                var url = '{{ route('user.check.user') }}';
                var value = $(this).val();
                var token = '{{ csrf_token() }}';

                if ($(this).attr('name') == 'mobile') {
                    var mobile = `${$('.mobile-code').text().substr(1)}${value}`;
                    var data = {mobile:mobile,_token:token}
                }

                if ($(this).attr('name') == 'email') {
                    var data = {email:value,_token:token}
                }

                if ($(this).attr('name') == 'username') {
                    var data = {username:value,_token:token}
                }

                $.post(url, data, function(response) {
                  if (response.data != false && (response.type == 'email' || response.type == 'username' || response.type == 'mobile')) {
                    $(`.${response.type}Exist`).text(`${response.type} already exist`);
                  }else{
                    $(`.${response.type}Exist`).text('');
                  }
                });
            });
        })(jQuery);
  </script>
@endpush
