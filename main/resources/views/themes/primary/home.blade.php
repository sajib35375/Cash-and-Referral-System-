@extends($activeTheme. 'layouts.basic')
@section('basic')
    @php
        $bannerElements = getSiteData('banner.element', false);
    @endphp
    <!-- Navbar & Carousel Start -->
    <div class="container-fluid position-relative p-0">
        @include($activeTheme. 'partials.header')
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                @foreach ($bannerElements as $banner)
                    <div class="carousel-item @if($loop->first) active @endif">
                        <img class="w-100" src="{{ getImage('assets/images/site/banner/'.@$banner->data_info->background_image, '1920x1080') }}" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px;">
                                <h5 class="text-white text-uppercase mb-3 animated slideInDown">{{ __(@$banner->data_info->title) }}</h5>
                                <h1 class="display-1 text-white mb-md-4 animated zoomIn">{{ __(@$banner->data_info->heading) }}</h1>
                                <a href="{{ @$banner->data_info->button_one_url }}" target="_blank" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">{{ __(@$banner->data_info->button_one_text) }}</a>
                                <a href="{{ @$banner->data_info->button_two_url }}" target="_blank" class="btn btn-outline-light py-md-3 px-md-5 animated slideInRight">{{ __(@$banner->data_info->button_two_text) }}</a>
                            </div>
                        </div>
                    </div>
                  @endforeach
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">@lang('Previous')</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">@lang('Next')</span>
            </button>
        </div>
    </div>
    <!-- Navbar & Carousel End -->

    @include($activeTheme.'sections.counter')
    @include($activeTheme.'sections.about')
    @include($activeTheme.'sections.choose')
    @include($activeTheme.'sections.service')
    @include($activeTheme.'sections.pricingPlan')
    @include($activeTheme.'sections.contact')
    @include($activeTheme.'sections.testimonial')
    @include($activeTheme.'sections.team')
    @include($activeTheme.'sections.blog')
    @include($activeTheme.'sections.vendor')
@endsection
