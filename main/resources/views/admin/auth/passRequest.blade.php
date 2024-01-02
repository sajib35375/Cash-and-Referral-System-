@extends('admin.layouts.app')
@section('content')
    <div class="authentication-wrapper authentication-cover">
        <div class="authentication-inner row m-0">
            <div class="d-none d-lg-flex col-lg-7 col-xl-8 align-items-center p-5">
                <div class="w-100 d-flex justify-content-center">
                    <img src="{{ asset('assets/admin/images/forgot.png') }}" class="img-fluid" alt="Login image" width="700">
                </div>
            </div>

            <div class="d-flex col-12 col-lg-5 col-xl-4 align-items-center authentication-bg p-sm-5 p-4">
                <div class="w-px-400 mx-auto">
                    <div class="text-center">
                        <h4 class="mb-2">
                            @lang('Forgot Password?')
                            <img src="{{ asset('assets/admin/images/forgot.gif') }}" alt="emoji" class="animated-emoji">
                        </h4>
                        <p class="mb-4">@lang('Let\'s make sure that it\'s you')</p>
                    </div>

                    <form class="mb-3 verify-gcaptcha" action="" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label class="form-label">@lang('Email')</label>
                            <input type="email" class="form-control" name="email" placeholder="@lang('Enter your email')" required autofocus>
                        </div>
                        <x-captcha />
                        <button class="btn btn-primary d-grid w-100" type="submit">@lang('Send')</button>
                    </form>

                    <div class="text-center">
                        <a href="{{ route('admin.login') }}" class="d-flex align-items-center justify-content-center">
                            <i class="las la-angle-double-left"></i> @lang('Back to login')
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('page-style-lib')
    <link rel="stylesheet" href="{{asset('assets/admin/css/page/auth.css')}}">
@endpush
