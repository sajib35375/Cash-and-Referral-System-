<nav class="layout-navbar container-fluid navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0   d-xl-none ">
        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
            <i class="fas fa-bars"></i>
        </a>
    </div>

    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
        <div class="navbar-nav align-items-center">
            <a role="button" class="navbar-search-btn d-sm-none nav-item nav-link px-0 me-xl-4 lh-1"><i class="las la-search fs-4 lh-0"></i></a>
            <div class="nav-item d-flex align-items-center navbar-search">
              <i class="las la-search fs-4 lh-0"></i>
              <input type="text" class="form-control border-0 shadow-none w-100 navbar-search-field" id="searchInput" placeholder="Search..." autocomplete="off">
              <ul class="search-list d-none"></ul>
            </div>
        </div>

        <ul class="navbar-nav flex-row align-items-center ms-auto">
            <!-- Quick links  -->
            <li class="nav-item dropdown-shortcuts navbar-dropdown dropdown me-2 me-xl-0">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                    <i class="fas fa-th-large"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-end py-0">
                    <div class="dropdown-menu-header border-bottom">
                        <div class="dropdown-header d-flex align-items-center py-3">
                            <h5 class="text-body mb-0 me-auto">@lang('Shortcuts')</h5>
                            <a href="javascript:void(0)" class="dropdown-shortcuts-add text-body" data-bs-toggle="tooltip" data-bs-placement="top" title="Add shortcuts"><i class="bx bx-sm bx-plus-circle"></i></a>
                        </div>
                    </div>
                    <div class="dropdown-shortcuts-list scrollable-container">
                        <div class="row row-bordered overflow-visible g-0">
                            <div class="dropdown-shortcuts-item col">
                                <span class="dropdown-shortcuts-icon rounded-circle mb-2 bg-label-warning">
                                    <i class="las la-coins fs-4"></i>
                                </span>
                                <a href="{{ route('admin.deposit.pending') }}" class="stretched-link">@lang('Deposits')</a>
                                <small class="text-muted mb-0">@lang('Pending')</small>
                            </div>
                            <div class="dropdown-shortcuts-item col">
                                <span class="dropdown-shortcuts-icon rounded-circle mb-2 bg-label-warning">
                                    <i class="las la-university fs-4"></i>
                                </span>
                                <a href="{{ route('admin.withdraw.pending') }}" class="stretched-link">@lang('Withdrawals')</a>
                                <small class="text-muted mb-0">@lang('Pending')</small>
                            </div>
                        </div>
                        <div class="row row-bordered overflow-visible g-0">
                            <div class="dropdown-shortcuts-item col">
                                <span class="dropdown-shortcuts-icon rounded-circle mb-2 bg-label-danger">
                                    <i class="las la-user-check fs-4"></i>
                                </span>
                                <a href="{{ route('admin.user.kyc.pending') }}" class="stretched-link">KYC</a>
                                <small class="text-muted mb-0">Pending</small>
                            </div>
                            <div class="dropdown-shortcuts-item col">
                                <span class="dropdown-shortcuts-icon rounded-circle mb-2 bg-label-success">
                                    <i class="las la-cog fs-4"></i>
                                </span>
                                <a href="{{ route('admin.basic.setting') }}" class="stretched-link">@lang('Settings')</a>
                                <small class="text-muted mb-0">@lang('Basic'), @lang('System'), @lang('Logo')</small>
                            </div>
                        </div>
                        <div class="row row-bordered overflow-visible g-0">
                            <div class="dropdown-shortcuts-item col">
                                <span class="dropdown-shortcuts-icon rounded-circle mb-2 bg-label-info">
                                    <i class="las la-credit-card fs-4"></i>
                                </span>
                                <a href="{{ route('admin.gateway.automated.index') }}" class="stretched-link">@lang('Automated')</a>
                                <small class="text-muted mb-0">@lang('Paymeny Gateway')</small>
                            </div>
                            <div class="dropdown-shortcuts-item col">
                                <span class="dropdown-shortcuts-icon rounded-circle mb-2 bg-label-primary">
                                    <i class="las la-credit-card fs-4"></i>
                                </span>
                                <a href="{{ route('admin.gateway.manual.index') }}" class="stretched-link">@lang('Manual')</a>
                                <small class="text-muted mb-0">@lang('Paymeny Gateway')</small>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <!-- Quick links -->

            <!-- Notification -->
            <li class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-1">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                    <i class="fas fa-bell"></i>
                    <span class="badge bg-danger rounded-pill badge-notifications">{{ $adminNotificationCount }}</span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end py-0">
                    <li class="dropdown-menu-header border-bottom">
                        <div class="dropdown-header d-flex align-items-center py-3">
                            <h5 class="text-body mb-0 me-auto">@lang('Notification')</h5>
                            <a href="{{ route('admin.notification.read.all') }}" class="dropdown-notifications-all text-body" data-bs-toggle="tooltip" data-bs-placement="top" title="@lang('Mark all as read')"><i class="las la-envelope-open-text fs-4"></i></a>
                        </div>
                    </li>
                    <li class="dropdown-notifications-list scrollable-container">
                        <ul class="list-group list-group-flush">
                            @forelse ($adminNotifications as $notification)
                                <li class="list-group-item list-group-item-action dropdown-notifications-item">
                                    <div class="d-flex">
                                        <a href="{{ route('admin.notification.read', $notification->id) }}" class="flex-grow-1">
                                            <h6 class="mb-1">{{ __($notification->title) }}</h6>
                                            <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                        </a>
                                        <div class="flex-shrink-0 dropdown-notifications-actions">
                                            <div class="dropdown-notifications-read"><span class="badge badge-dot"></span></div>
                                        </div>
                                    </div>
                                </li>
                            @empty
                                <li class="list-group-item list-group-item-action dropdown-notifications-item">
                                    <div class="d-flex">
                                        <div class="flex-grow-1">
                                            <b>@lang('No notifications left to read')</b>
                                        </div>
                                    </div>
                                </li>
                            @endforelse
                        </ul>
                    </li>
                    <li class="dropdown-menu-footer border-top p-3">
                        <a href="{{ route('admin.notification.all') }}" class="btn btn-primary w-100">@lang('View all notifications')</a>
                    </li>
                </ul>
            </li>
            <!--/ Notification -->

            <!-- Admin -->
            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                        <img src="{{ getImage(getFilePath('adminProfile').'/'.auth('admin')->user()->image, getFileSize('adminProfile')) }}" alt class="w-px-40 h-auto rounded-circle">
                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item d-flex" href="{{ route('admin.profile') }}">
                            <i class="las la-user-tie fs-4 me-2"></i>
                            <span class="align-middle">@lang('Profile')</span>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item d-flex" href="{{ route('admin.password') }}">
                            <i class="las la-key fs-4 me-2"></i>
                            <span class="align-middle">@lang('Password')</span>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item d-flex" href="{{ route('admin.basic.setting') }}">
                            <i class="las la-cog fs-4 me-2"></i>
                            <span class="align-middle">@lang('Settings')</span>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item d-flex" href="{{ route('admin.logout') }}">
                            <i class="las la-power-off fs-4 me-2"></i>
                            <span class="align-middle">@lang('Log Out')</span>
                        </a>
                    </li>
                </ul>
            </li>
          <!--/ Admin -->
        </ul>
    </div>
</nav>
