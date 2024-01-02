<nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
    <a href="{{ route('home') }}" class="navbar-brand p-0">
        <img src="{{ getImage(getFilePath('logoFavicon').'/logo.png') }}" width="180" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="fa fa-bars"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto py-0">
            <a href="{{ route('home') }}" class="nav-item nav-link {{ request()->routeIs('home') ? 'active': '' }}">@lang('Home')</a>
            <a href="{{ route('about') }}" class="nav-item nav-link {{ request()->routeIs('about') ? 'active' : '' }}">@lang('About')</a>
            <a href="{{ route('service') }}" class="nav-item nav-link {{ request()->routeIs('service') ? 'active' : '' }}">@lang('Services')</a>
            <a href="{{ route('blog') }}" class="nav-item nav-link {{ request()->routeIs('blog') ? 'active' : '' }}">@lang('Blog')</a>
            <a href="{{ route('contact.us') }}" class="nav-item nav-link {{ request()->routeIs('contact.us') ? 'active' : '' }}">@lang('Contact')</a>
        </div>
        <button type="button" class="btn text-primary ms-3" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fa fa-search"></i></button>
    </div>
</nav>

@if (!request()->routeIs('home'))
    <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
        <div class="row py-5">
            <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                <h1 class="display-4 text-white animated zoomIn">{{ __($pageTitle) }}</h1>
                <a href="{{ route('home') }}" class="h5 text-white">@lang('Home')</a>
            </div>
        </div>
    </div>
@endif
