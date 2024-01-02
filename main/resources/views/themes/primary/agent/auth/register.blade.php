@extends($activeTheme. 'layouts.app')
@section('content')
    @php
        $policyPages = getSiteData('policy_pages.element', false, null, true);
    @endphp
    <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
        <div class="d-flex align-items-center justify-content-center w-100">
            <div class="row justify-content-center w-100">
                <div class="col-md-8 col-lg-8 col-xxl-6">
                    <div class="card mb-0">
                        <div class="card-body">
                            <a href="{{ route('home') }}" class="text-nowrap logo-img text-center d-block py-3 w-100">
                                <img src="{{ getImage(getFilePath('logoFavicon').'/logo.png') }}" width="180" alt="">
                            </a>

                            <p class="text-center text-info">Agent Register</p>

                            <form method="POST" action="{{ route('agent.register') }}" class="verify-gcaptcha">
                                @csrf

                                @if(session()->get('reference') != null)
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="referenceBy" class="form-label">@lang('Reference by')</label>
                                            <input type="text" name="referBy" id="referenceBy" class="form-control form--control" value="{{session()->get('reference')}}" readonly>
                                        </div>
                                    </div>
                                @endif
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">@lang('First Name')</label>
                                    <input type="text" class="form-control" name="firstname" value="{{ old('firstname') }}" required>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">@lang('Last Name')</label>
                                    <input type="text" class="form-control" name="lastname" value="{{ old('lastname') }}" required>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">@lang('Username')</label>
                                    <input type="text" class="form-control" name="username" value="{{ old('username') }}" required>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">@lang('E-mail Address')</label>
                                    <input type="email" class="form-control" name="email" value="{{ old('email') }}" required>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">@lang('Country')</label>
                                    <select name="country" class="form-control form--control" required>
                                        @foreach($countries as $key => $country)
                                            <option data-mobile_code="{{ $country->dial_code }}" value="{{ $country->country }}" data-code="{{ $key }}">{{ __($country->country) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="mb-3">
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
                            <div class="col-lg-6 col-md-6">
                                <div class="mb-4">
                                    <label  class="form-label">@lang('Password')</label>
                                    <input id="password" type="password" class="form-control @if($setting->strong_pass) secure-password @endif" name="password" required>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="mb-4">
                                    <label  class="form-label">@lang('Confirm Password')</label>
                                    <input type="password" class="form-control" name="password_confirmation"  required>
                                </div>
                            </div>
                            </div>
                                <x-captcha />

                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    @if($setting->agree_policy)
                                        <div class="form-group">
                                            <input type="checkbox" id="agree" @checked(old('agree')) name="agree" required>
                                            <label for="agree">@lang('I agree with')</label>
                                            <span>
                                        @foreach($policyPages as $policy)
                                                    <a href="{{ route('policy.pages',[slug($policy->data_info->title),$policy->id]) }}" target="_blank">{{ __($policy->data_info->title) }}</a> @if(!$loop->last), @endif
                                        @endforeach
                                            </span>
                                        </div>
                                    @endif
                                </div>

                                <button type="submit" id="recaptcha" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">@lang('Sign Up')</button>

                                <div class="d-flex align-items-center justify-content-center">
                                    <p class="fs-4 mb-0 fw-bold">@lang('Don\'t have any account?')</p>
                                    <a class="text-primary fw-bold ms-2" href="{{ route('agent.login.form') }}">@lang('Already have an account')</a>
                                </div>
                            </form>
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
                var url = "{{ route('agent.check') }}";
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
