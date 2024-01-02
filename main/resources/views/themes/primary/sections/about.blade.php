@php
    $aboutContent  = getSiteData('about.content', true, null, true);
    $aboutElements = getSiteData('about.element', false, null, true);
@endphp

<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-7">
                <div class="section-title position-relative pb-3 mb-5">
                    <h5 class="fw-bold text-primary text-uppercase">{{ __(@$aboutContent->data_info->heading) }}</h5>
                    <h1 class="mb-0">{{ __(@$aboutContent->data_info->subheading) }}</h1>
                </div>
                <p class="mb-4">{{ __(@$aboutContent->data_info->description) }}</p>
                <div class="row g-0 mb-3">
                    <div class="col-sm-6 wow zoomIn" data-wow-delay="0.2s">
                        @foreach($aboutElements as $about)
                            @if ($loop->odd)
                                <h5 class="mb-3">
                                    @php echo @$about->data_info->icon; @endphp {{ __($about->data_info->title) }}
                                </h5>
                            @endif
                        @endforeach
                    </div>
                    <div class="col-sm-6 wow zoomIn" data-wow-delay="0.4s">
                        @foreach($aboutElements as $about)
                            @if ($loop->even)
                                <h5 class="mb-3">
                                    @php echo @$about->data_info->icon; @endphp {{ __($about->data_info->title) }}
                                </h5>
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="d-flex align-items-center mb-4 wow fadeIn" data-wow-delay="0.6s">
                    <div class="bg-primary d-flex align-items-center justify-content-center rounded" style="width: 60px; height: 60px;">
                        @php echo @$aboutContent->data_info->icon; @endphp
                    </div>
                    <div class="ps-4">
                        <h5 class="mb-2">@lang('Call to ask any question')</h5>
                        <h4 class="text-primary mb-0">{{ @$aboutContent->data_info->mobile }}</h4>
                    </div>
                </div>
                <a href="{{ route('about') }}" class="btn btn-primary py-3 px-5 mt-3 wow zoomIn" data-wow-delay="0.9s">Button</a>
            </div>
            <div class="col-lg-5" style="min-height: 500px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.9s" src="{{ getImage('assets/images/site/about/'.@$aboutContent->data_info->image, '500x500') }}" style="object-fit: cover;">
                </div>
            </div>
        </div>
    </div>
</div>

