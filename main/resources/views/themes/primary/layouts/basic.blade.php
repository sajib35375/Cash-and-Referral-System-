<!DOCTYPE html>
<html lang="{{ config('app.locale') }}" itemscope itemtype="http://schema.org/WebPage">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title> {{ $setting->siteName(__($pageTitle)) }}</title>

        @include('partials.seo')

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="{{ asset('assets/universal/css/font-awesome.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/universal/css/line-awesome.css') }}">
        <link rel="stylesheet" href="{{ asset($activeThemeTrue. 'css/owl.carousel.min.css') }}">
        <link rel="stylesheet" href="{{ asset($activeThemeTrue. 'css/animate.min.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/universal/css/bootstrap.css') }}">
        <link rel="stylesheet" href="{{ asset($activeThemeTrue. 'css/style.css') }}">
        <link rel="stylesheet" href="{{ asset($activeThemeTrue. 'css/custom.css') }}">

        @stack('page-style-lib')
        @stack('page-style')
    </head>
    <body>
    @php
        $headerContent = getSiteData('header.content',true,null,false);
    @endphp
        <!-- Topbar Start -->
        <div class="container-fluid bg-dark px-5 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <small class="me-3 text-light"><i class="fa fa-map-marker-alt me-2"></i>{{ __(@$headerContent->data_info->address) }}</small>
                        <small class="me-3 text-light"><i class="fa fa-phone-alt me-2"></i>{{ @$headerContent->data_info->phone }}</small>
                        <small class="text-light"><i class="fa fa-envelope-open me-2"></i>{{ @$headerContent->data_info->email }}</small>
                    </div>
                </div>
                <div class="col-lg-4 text-center text-lg-end">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href="{{ @$headerContent->data_info->twitter }}"><i class="fab fa-twitter fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href="{{ @$headerContent->data_info->facebook }}"><i class="fab fa-facebook-f fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href="{{ @$headerContent->data_info->linkedin }}"><i class="fab fa-linkedin-in fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href="{{ @$headerContent->data_info->instagram }}"><i class="fab fa-instagram fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle" href="{{ @$headerContent->data_info->youtube }}"><i class="fab fa-youtube fw-normal"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->
        <!-- Full Screen Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                    <div class="modal-header border-0">
                        <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <div class="input-group" style="max-width: 600px;">
                            <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="@lang('Type search keyword')">
                            <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @yield('basic')
    @php
        $footer = getSiteData('footer.content',true,null,false);
    @endphp
        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gx-5">
                    <div class="col-lg-4 col-md-6 footer-about">
                        <div class="d-flex flex-column align-items-center justify-content-center text-center h-100 bg-primary p-4">
                            <a href="{{ route('home') }}" class="navbar-brand">
                                <img src="{{ getImage(getFilePath('logoFavicon').'/logo.png') }}" width="180" alt="">
                            </a>
                            <p class="mt-3 mb-4">{{ __(@$headerContent->data_info->short_text) }}</p>
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control border-white p-3" placeholder="@lang('Your Email')">
                                    <button class="btn btn-dark">@lang('Sign Up')</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-6">
                        <div class="row gx-5">
                            <div class="col-lg-4 col-md-12 pt-5 mb-5">
                                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                    <h3 class="text-light mb-0">@lang('Get In Touch')</h3>
                                </div>
                                <div class="d-flex mb-2">
                                    <i class="bi bi-geo-alt text-primary me-2"></i>
                                    <p class="mb-0">{{ @$headerContent->data_info->short_text }}</p>
                                </div>
                                <div class="d-flex mb-2">
                                    <i class="bi bi-envelope-open text-primary me-2"></i>
                                    <p class="mb-0">{{ @$headerContent->data_info->email }}</p>
                                </div>
                                <div class="d-flex mb-2">
                                    <i class="bi bi-telephone text-primary me-2"></i>
                                    <p class="mb-0">{{ @$headerContent->data_info->phone }}</p>
                                </div>
                                <div class="d-flex mt-4">
                                    <a class="btn btn-primary btn-square me-2" href="{{ @$headerContent->data_info->twitter }}"><i class="fab fa-twitter fw-normal"></i></a>
                                    <a class="btn btn-primary btn-square me-2" href="{{ @$headerContent->data_info->facebook }}"><i class="fab fa-facebook-f fw-normal"></i></a>
                                    <a class="btn btn-primary btn-square me-2" href="{{ @$headerContent->data_info->linkedin }}"><i class="fab fa-linkedin-in fw-normal"></i></a>
                                    <a class="btn btn-primary btn-square" href="{{ @$headerContent->data_info->instagram }}"><i class="fab fa-instagram fw-normal"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                    <h3 class="text-light mb-0">@lang('Quick Links')</h3>
                                </div>
                                <div class="link-animated d-flex flex-column justify-content-start">
                                    <a class="text-light mb-2" href="{{ route('home') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('Home')</a>
                                    <a class="text-light mb-2" href="{{ route('about') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('About Us')</a>
                                    <a class="text-light mb-2" href="{{ route('service') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('Our Services')</a>
                                    <a class="text-light mb-2" href="{{ route('blog') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('Latest Blog')</a>
                                    <a class="text-light" href="{{ route('contact.us') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('Contact Us')</a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                    <h3 class="text-light mb-0">Popular Links</h3>
                                </div>
                                <div class="link-animated d-flex flex-column justify-content-start">
                                    <a class="text-light mb-2" href="{{ route('home') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('Home')</a>
                                    <a class="text-light mb-2" href="{{ route('about') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('About Us')</a>
                                    <a class="text-light mb-2" href="{{ route('service') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('Our Services')</a>
                                    <a class="text-light mb-2" href="{{ route('blog') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('Latest Blog')</a>
                                    <a class="text-light" href="{{ route('contact.us') }}"><i class="bi bi-arrow-right text-primary me-2"></i>@lang('Contact Us')</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid text-white" style="background: #061429;">
            <div class="container text-center">
                <div class="row justify-content-end">
                    <div class="col-lg-8 col-md-6">
                        <div class="d-flex align-items-center justify-content-center" style="height: 75px;">
                            <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">@lang('Softphinix')</a>. @lang('All Rights Reserved.')
                            @lang('Developed by')<a class="text-white border-bottom" href="https://htmlcodex.com">@lang('@Sajib')</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>
        @php
            $cookie = App\Models\SiteData::where('data_key','cookie.data')->first();
        @endphp
        @if(($cookie->data_info->status == ManageStatus::ACTIVE) && !\Cookie::get('gdpr_cookie'))
            <!-- cookies dark version start -->
            <div class="cookies-card text-center hide">
                <div class="cookies-card__icon bg--base">
                    <i class="las la-cookie-bite"></i>
                </div>

                <p class="mt-4 cookies-card__content">{{ $cookie->data_info->short_details }} <a href="{{ route('cookie.policy') }}" target="_blank">@lang('learn more')</a></p>

                <div class="cookies-card__btn mt-4">
                    <button type="button" class="btn btn--base w-100 policy">@lang('Allow')</button>
                </div>
            </div>
            <!-- cookies dark version end -->
        @endif

        <script src="{{ asset('assets/universal/js/jquery-3.7.0.min.js') }}"></script>
        <script src="{{ asset('assets/universal/js/bootstrap.js') }}"></script>
        <script src="{{ asset($activeThemeTrue. 'js/wow.min.js') }}"></script>
        <script src="{{ asset($activeThemeTrue. 'js/easing.min.js') }}"></script>
        <script src="{{ asset($activeThemeTrue. 'js/waypoints.min.js') }}"></script>
        <script src="{{ asset($activeThemeTrue. 'js/counterup.min.js') }}"></script>
        <script src="{{ asset($activeThemeTrue. 'js/owl.carousel.min.js') }}"></script>
        <script src="{{ asset($activeThemeTrue. 'js/main.js') }}"></script>

        @include('partials.plugins')
        @include('partials.toasts')

        @stack('page-script-lib')
        @stack('page-script')
    </body>
</html>
