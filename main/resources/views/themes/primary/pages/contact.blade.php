@extends($activeTheme. 'layouts.basic')
@section('basic')

    <div class="container-fluid position-relative p-0">
        @include($activeTheme. 'partials.header')
        <div class="container py-5">
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                <h5 class="fw-bold text-primary text-uppercase">{{ __(@$contactContent->data_info->sub_title) }}</h5>
                <h1 class="mb-0">{{ __(@$contactContent->data_info->title) }}</h1>
            </div>
            <div class="row g-5 mb-5">
                <div class="col-lg-4">
                    <div class="d-flex align-items-center wow fadeIn" data-wow-delay="0.1s">
                        <div class="bg-primary d-flex align-items-center justify-content-center rounded" style="width: 60px; height: 60px;">
                            <i class="fa fa-phone-alt text-white"></i>
                        </div>
                        <div class="ps-4">
                            <h5 class="mb-2">@lang('Call to ask any question')</h5>
                            <h4 class="text-primary mb-0">{{ @$contactContent->data_info->phone }}</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="d-flex align-items-center wow fadeIn" data-wow-delay="0.4s">
                        <div class="bg-primary d-flex align-items-center justify-content-center rounded" style="width: 60px; height: 60px;">
                            <i class="fa fa-envelope-open text-white"></i>
                        </div>
                        <div class="ps-4">
                            <h5 class="mb-2">@lang('Email to get free quote')</h5>
                            <h4 class="text-primary mb-0">{{ @$contactContent->data_info->email }}</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="d-flex align-items-center wow fadeIn" data-wow-delay="0.8s">
                        <div class="bg-primary d-flex align-items-center justify-content-center rounded" style="width: 60px; height: 60px;">
                            <i class="fa fa-map-marker-alt text-white"></i>
                        </div>
                        <div class="ps-4">
                            <h5 class="mb-2">@lang('Visit our office')</h5>
                            <h4 class="text-primary mb-0">{{ @$contactContent->data_info->address }}</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-5">
                <div class="col-lg-6 wow slideInUp" data-wow-delay="0.3s">
                    <form method="POST" action="{{ route('contact.store') }}" class="verify-gcaptcha">
                        @csrf
                        <div class="row g-3">
                            <div class="col-xl-12">
                                <input name="name" type="text" class="form-control bg-light border-0" placeholder="@lang('Your Name')" style="height: 55px;" value="{{ old('name',@$user->fullname) }}" @if($user) readonly @endif required>
                            </div>
                            <div class="col-12">
                                <input name="email" type="email" class="form-control bg-light border-0" placeholder="@lang('Your Email')" style="height: 55px;" value="{{  old('email',@$user->email) }}" @if($user) readonly @endif required>
                            </div>

                            <div class="col-12">
                                <input name="subject" type="text" class="form-control bg-light border-0" placeholder="@lang('Subject')" style="height: 55px;" value="{{old('subject')}}" required>
                            </div>

                            <div class="col-12">
                                <textarea name="message" class="form-control bg-light border-0" rows="3" placeholder="@lang('Message')" required>{{old('message')}}</textarea>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-dark w-100 py-3" type="submit">@lang('Request A Quote')</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-6 wow slideInUp" data-wow-delay="0.6s">
                    <iframe class="position-relative rounded w-100 h-100" src="{{ @$contactContent->data_info->map }}" frameborder="0" style="min-height: 350px; border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
            </div>
        </div>
        @include($activeTheme.'sections.vendor')
    </div>

@endsection
