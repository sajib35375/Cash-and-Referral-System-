<!DOCTYPE html>
<html lang="{{ config('app.locale') }}" itemscope itemtype="http://schema.org/WebPage">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title> {{ $setting->siteName(__($pageTitle)) }}</title>

        @include('partials.seo')
        <link rel="stylesheet" href="{{ asset($activeThemeTrue. 'css/styles.min.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/universal/css/font-awesome.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/universal/css/line-awesome.css') }}">
        <link rel="stylesheet" href="{{ asset($activeThemeTrue. 'css/custom.css') }}">

        @stack('page-style-lib')
        @stack('page-style')
    </head>

    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
            @yield('content')
        </div>

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

        @include('partials.plugins')
        @include('partials.toasts')

        @stack('page-script-lib')
        @stack('page-script')

        <script>
            (function ($) {
                "use strict";

                $(".langSel").on("change", function() {
                    window.location.href = "{{route('home')}}/change/"+$(this).val();
                });

                $('.policy').on('click',function() {
                    $.get('{{route('cookie.accept')}}', function(response) {
                        $('.cookies-card').addClass('d-none');
                    });
                });

                setTimeout(function() {
                    $('.cookies-card').removeClass('hide');
                },2000);

                Array.from(document.querySelectorAll('table')).forEach(table => {
                    let heading = table.querySelectorAll('thead tr th');
                    Array.from(table.querySelectorAll('tbody tr')).forEach((row) => {
                        Array.from(row.querySelectorAll('td')).forEach((colum, i) => {
                            colum.setAttribute('data-label', heading[i].innerText)
                        });
                    });
                });
            })(jQuery);
        </script>
    </body>
</html>
