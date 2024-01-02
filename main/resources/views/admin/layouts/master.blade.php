@extends('admin.layouts.app')
@section('content')
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            @include('admin.partials.sidebar')
            @include('admin.partials.topbar')

            <div class="layout-page">
                <div class="content-wrapper">
                    <div class="container-fluid flex-grow-1 container-p-y">
                        <div class="row">
                            <div class="col-xxl">
                                <div class="card mb-4">
                                    <div class="card-header d-flex flex-wrap gap-3 justify-content-between align-items-center">
                                        <h5 class="mb-0">{{ __($pageTitle) }}</h5>
                                        <div class="d-flex flex-wrap justify-content-md-end gap-2 align-items-center">
                                            @stack('breadcrumb')
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        @yield('master')
                    </div>

                    <footer class="content-footer footer bg-footer-theme border-top">
                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                          <div class="mb-2 mb-md-0">
                            <b class="text-primary">{{ __(systemDetails()['name']) }}</b>
                            , @lang('Version') <b class="text-primary">{{ systemDetails()['version'] }}</b> ,
                            © <script>
                                document.write(new Date().getFullYear())
                            </script>
                          </div>
                        </div>
                    </footer>
                </div>
            </div>
        </div>


        <div class="layout-overlay layout-menu-toggle"></div>
        <div class="drag-target"></div>
    </div>
@endsection

@push('page-script-lib')
    <script src="{{asset('assets/admin/js/page/menu.js')}}"></script>
@endpush
