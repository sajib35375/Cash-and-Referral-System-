@extends($activeTheme. 'layouts.app')
@section('content')
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-8 col-lg-7 col-xl-5">
                <div class="text-end">
                    <a href="{{ route('home') }}" class="fw-bold home-link"> <i class="las la-long-arrow-alt-left"></i> @lang('Go to Home')</a>
                </div>
                <div class="card custom--card shadow bdr">
                    <div class="card-header head">
                        <h5 class="card-title">{{ __($pageTitle) }}</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-4">
                            <p>@lang('A six-digit verification code has been emailed to you') :  {{ showEmailAddress(auth()->user()->email) }}</p>
                        </div>
                        <form method="POST" action="{{ route('user.verify.email') }}" class="verification-code-form">
                            @csrf

                            @include('partials.verificationCode')

                            <div class="form-group">
                                <button type="submit" class="btn btn--base btn-info w-100">@lang('Submit')</button>
                            </div>

                            <div class="form-group">
                                @lang('If you don\'t receive any code you can') <a href="{{ route('user.send.verify.code', 'email') }}">@lang('Send again')</a>
                            </div>

                            @if($errors->has('resend'))
                                <small class="text-danger d-block">{{ $errors->first('resend') }}</small>
                            @endif
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('page-style')
    <style>
        .bdr {
            border: 1px solid #e9e9e9;
        }
        .head {
            background-color: #000;
        }
        .head h5 {
            color: #fff;
        }
    </style>
@endpush
