@extends($activeTheme. 'layouts.basic')
@section('basic')

    <div class="container-fluid position-relative p-0">
        @include($activeTheme. 'partials.header')
        @include($activeTheme.'sections.service')
        @include($activeTheme.'sections.testimonial')
        @include($activeTheme.'sections.vendor')
    </div>

@endsection
