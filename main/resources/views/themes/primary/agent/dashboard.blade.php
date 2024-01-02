@extends($activeTheme. 'layouts.agent')
@section('agent')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                @if(auth()->guard('agent')->user()->kc == ManageStatus::UNVERIFIED)
                    <div class="alert alert-info" role="alert">
                        <h4 class="alert-heading">@lang('Identity verification is needed')</h4>
                        <hr>
                        <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.  <a href="{{ route('agent.kyc.form') }}">@lang('Click Here to Verify')</a></p>
                    </div>
                @elseif(auth()->guard('agent')->user()->kc == ManageStatus::PENDING)
                    <div class="alert alert-warning" role="alert">
                        <h4 class="alert-heading">@lang('Identity verification is pending')</h4>
                        <hr>
                        <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.  <a href="{{ route('agent.kyc.data') }}">@lang('See KYC Data')</a></p>
                    </div>
                @endif
                    <div class="container">
                        <div class="row d-flex justify-content-center">
                            <div class="col-sm-7 col-xl-7">
                                <div class="card overflow-hidden rounded-2 shadow bdr">
                                    <div class="position-relative">
                                        <a href="#"><img src="{{ getImage(getFilePath('userProfile').'/'.auth()->guard('agent')->user()->image, getFileSize('userProfile')) }}" class="card-img-top rounded-0" alt="..."></a>
                                        <a href="#" class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i class="ti ti-basket fs-4"></i></a>
                                    </div>
                                    <div class="card-body pt-3 p-4 text-center">
                                        <h6 class="fw-semibold fs-4"><strong>@lang('Name'):</strong>{{ __(@$agentProfile->fullname) }}</h6>
                                        <div class="">
                                            <span class="info"><strong>@lang('Email')</strong>: {{ __(@$agentProfile->email) }}</span><br>
                                            <span class="info"><strong>@lang('Mobile')</strong>: {{ __(@$agentProfile->mobile) }}</span><br>
                                            <span class="info"><strong>@lang('Balance')</strong>: {{ showAmount(@$agentProfile->balance) }} {{ __($setting->site_cur) }}</span>
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

