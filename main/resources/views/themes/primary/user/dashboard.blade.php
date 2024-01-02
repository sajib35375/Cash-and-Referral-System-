@extends($activeTheme. 'layouts.auth')
@section('auth')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                @if(auth()->user()->kc == ManageStatus::UNVERIFIED)
                    <div class="alert alert-info" role="alert">
                        <h4 class="alert-heading">@lang('Identity verification is needed')</h4>
                        <hr>
                        <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.  <a href="{{ route('user.kyc.form') }}">@lang('Click Here to Verify')</a></p>
                    </div>
                @elseif(auth()->user()->kc == ManageStatus::PENDING)
                    <div class="alert alert-warning" role="alert">
                        <h4 class="alert-heading">@lang('Identity verification is pending')</h4>
                        <hr>
                        <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.  <a href="{{ route('user.kyc.data') }}">@lang('See KYC Data')</a></p>
                    </div>
                @endif
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-sm-8 col-xl-8">
                        <div class="card overflow-hidden rounded-2 shadow bdr">
                            <div class="position-relative">
                                <a href="#"><img src="{{ getImage(getFilePath('userProfile').'/'.auth()->user()->image, getFileSize('userProfile')) }}" class="card-img-top rounded-0" alt="..."></a>
                                <a href="#" class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i class="ti ti-basket fs-4"></i></a>                      </div>
                            <div class="card-body pt-3 p-4 text-center">
                                <h6 class="fw-semibold fs-4"><strong>@lang('Name'):</strong>{{ __(@$userProfile->fullname) }}</h6>
                                <div class="">
                                    <span class="info"><strong>@lang('Email')</strong>: {{ __(@$userProfile->email) }}</span><br>
                                    <span class="info"><strong>@lang('Mobile')</strong>: {{ __(@$userProfile->mobile) }}</span><br>
                                    <span class="info"><strong>@lang('Balance')</strong>: {{ showAmount(@$userProfile->balance) }} {{ __($setting->site_cur) }}</span>
                                </div>
                            </div>
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
        .head h2 {
            color: #fff;
        }
        .info{
            display: block;
            line-height: 3px;
        }
        .bdr {
            border : 1px solid #e9e9e9
        }
    </style>
@endpush
