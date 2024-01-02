@php
 $contactContent = getSiteData('contact_us.content', true);
 $user           = auth()->user();
@endphp
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-7">
                <div class="section-title position-relative pb-3 mb-5">
                    <h5 class="fw-bold text-primary text-uppercase">{{ __(@$contactContent->data_info->short_title) }}</h5>
                    <h1 class="mb-0">{{ __(@$contactContent->data_info->title) }}</h1>
                </div>
                <div class="row gx-3">
                    <div class="col-sm-6 wow zoomIn" data-wow-delay="0.2s">
                        <h5 class="mb-4"><i class="fa fa-reply text-primary me-3"></i>{{ __(@$contactContent->data_info->reply) }}</h5>
                    </div>
                    <div class="col-sm-6 wow zoomIn" data-wow-delay="0.4s">
                        <h5 class="mb-4"><i class="fa fa-phone-alt text-primary me-3"></i>{{ __(@$contactContent->data_info->support) }}</h5>
                    </div>
                </div>
                <p class="mb-4">{{ __(@$contactContent->data_info->short_details) }}</p>
                <div class="d-flex align-items-center mt-2 wow zoomIn" data-wow-delay="0.6s">
                    <div class="bg-primary d-flex align-items-center justify-content-center rounded" style="width: 60px; height: 60px;">
                        @php echo @$contactContent->data_info->contact_icon; @endphp
                    </div>
                    <div class="ps-4">
                        <h5 class="mb-2">@lang('Call to ask any question')</h5>
                        <h4 class="text-primary mb-0">{{ @$contactContent->data_info->contact_number }}</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="bg-primary rounded h-100 d-flex align-items-center p-5 wow zoomIn" data-wow-delay="0.9s">
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
            </div>
        </div>
    </div>
</div>
