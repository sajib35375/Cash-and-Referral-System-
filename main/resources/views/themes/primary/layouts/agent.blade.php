@extends($activeTheme. 'layouts.app')
@section('content')
    <aside class="left-sidebar">
        <div>
            <div class="brand-logo d-flex align-items-center justify-content-between">
                <a href="{{ route('home') }}" class="text-nowrap logo-img">
                <img src="{{ getImage(getFilePath('logoFavicon').'/logo.png') }}" width="180" alt="image" />
                </a>
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-8"></i>
            </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav">
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('agent.dashboard') }}" aria-expanded="false">
                    <span>
                        <i class="fas fa-home text-dark"></i>
                    </span>
                    <span class="hide-menu">@lang('Dashboard')</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">@lang('Cash Area')</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('agent.cash.view') }}" aria-expanded="false">
                    <span>
                        <i class="fas fa-money-bill text-dark"></i>
                    </span>
                    <span class="hide-menu">@lang('Cash In')</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('agent.cash.in.log') }}" aria-expanded="false"><span><i class="fas fa-asterisk text-dark"></i></span>
                        <span class="hide-menu">@lang('Cash In Log')</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('agent.cash.out.log') }}" aria-expanded="false"><span><i class="fas fa-asterisk text-dark"></i></span>
                        <span class="hide-menu">@lang('Cash Out Log')</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">@lang('Deposit Area')</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('agent.deposit.index') }}" aria-expanded="false">
                        <span>
                            <i class="fas fa-money-bill text-dark"></i>
                        </span>
                        <span class="hide-menu">@lang('Deposit')</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('agent.deposit.history') }}" aria-expanded="false">
                        <span>
                            <i class="fas fa-money-bill-wave-alt text-dark"></i>
                        </span>
                        <span class="hide-menu">@lang('Deposit Log')</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">@lang('Withdraw Area')</span>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('agent.withdraw.index') }}" aria-expanded="false">
                        <span>
                            <i class="fas fa-wallet text-dark"></i>
                        </span>
                        <span class="hide-menu">@lang('Withdraw')</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('agent.withdraw.history') }}" aria-expanded="false">
                        <span>
                            <i class="fas fa-money-check text-dark"></i>
                        </span>
                        <span class="hide-menu">@lang('Withdraw Log')</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('agent.transactions') }}" aria-expanded="false">
                        <span>
                            <i class="far fa-money-bill-alt text-dark"></i>
                        </span>
                        <span class="hide-menu">@lang('Transaction')</span>
                    </a>
                </li>

            </ul>
        </nav>
        <!-- End Sidebar navigation -->
        </div>
    </aside>

    <div class="body-wrapper">
        <!--  Header Start -->
        <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
            <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
                <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
                </a>
            </li>
            </ul>
            <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="#" id="drop2" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <img src="{{ getImage(getFilePath('userProfile').'/'.auth()->guard('agent')->user()->image, getFileSize('userProfile')) }}" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                    <div class="message-body">
                    <a href="{{ route('agent.profile') }}" class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="fas fa-user"></i>
                        <p class="mb-0 fs-3">@lang('My Profile')</p>
                    </a>
                    <a href="{{ route('agent.change.password') }}" class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="far fa-user-circle"></i>
                        <p class="mb-0 fs-3">@lang('Change Password')</p>
                    </a>
                    <a href="{{ route('agent.twofactor.form') }}" class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="fas fa-tasks"></i>
                        <p class="mb-0 fs-3">@lang('2FA Security')</p>
                    </a>
                    <a href="{{ route('agent.logout') }}" class="btn btn-outline-primary mx-3 mt-2 d-block">@lang('Logout')</a>
                    </div>
                </div>
                </li>
            </ul>
            </div>
        </nav>
        </header>
        <div class="container-fluid">
            @yield('agent')
        </div>
    </div>
@endsection
@push('page-script-lib')
    <script src="{{ asset($activeThemeTrue. 'js/sidebarmenu.js') }}"></script>
    <script src="{{ asset($activeThemeTrue. 'js/app.min.js') }}"></script>
    <script src="{{ asset($activeThemeTrue. 'js/simplebar.js') }}"></script>
@endpush
