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
                            <p>@lang('Please provide either your email address or username to retrieve your account.')</p>
                        </div>
                        <form method="POST" action="" class="verify-gcaptcha">
                            @csrf
                            <div class="form-group">
                                <label class="form-label">@lang('Email or Username')</label>
                                <input type="text" class="form-control form--control" name="value" value="{{ old('value') }}" required>
                            </div>

                            <x-captcha />

                            <div class="form-group my-3">
                                <button type="submit" class="btn btn--base btn-info w-100">@lang('Submit')</button>
                            </div>
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
