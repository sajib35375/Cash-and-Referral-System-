@extends('admin.layouts.master')

@section('master')
    <div class="row">
        <div class="col-xxl">
            <div class="card">
                <div class="card-body table-responsive text-nowrap">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>@lang('User')</th>
                                <th>@lang('Email-Phone')</th>
                                <th>@lang('Country')</th>
                                <th>@lang('Joined')</th>
                                <th>@lang('Balance')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                            @forelse ($users as $user)
                                <tr>
                                    <td>
                                        <div>
                                            <span class="fw-bold">{{$user->fullname}}</span>
                                            <br>
                                            <span class="small">
                                                <a href="{{ route('admin.user.details', $user->id) }}"><span>@</span>{{ $user->username }}</a>
                                            </span>
                                        </div>
                                    </td>
                                    <td>{{ $user->email }}<br>{{ $user->mobile }}</td>
                                    <td>
                                        <span class="fw-bold" data-bs-toggle="tooltip" data-bs-offset="0,8" data-bs-placement="top" title="{{ @$user->country_name }}">{{ $user->country_code }}</span>
                                    </td>
                                    <td>
                                        {{ showDateTime($user->created_at) }} <br> {{ diffForHumans($user->created_at) }}
                                    </td>
                                    <td>
                                        <span class="fw-bold">
                                            {{ $setting->cur_sym }}{{ showAmount($user->balance) }}
                                        </span>
                                    </td>
                                    <td>
                                        <a href="{{ route('admin.user.details', $user->id) }}" class="btn btn-sm rounded-pill btn-label-info">
                                            <span class="tf-icons las la-info-circle me-1"></span> @lang('Details')
                                        </a>

                                        @if (request()->routeIs('admin.user.kyc.pending'))
                                            <div class="btn-group">
                                                <button class="btn btn-sm rounded-pill btn-label-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">@lang('KYC Action')</button>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <button type="button" class="dropdown-item detailBtn"
                                                            data-bs-toggle      = "offcanvas"
                                                            data-bs-target      = "#offcanvasBoth"
                                                            aria-controls       = "offcanvasBoth"
                                                            data-kyc_data = "{{ json_encode($user->kyc_data) }}">
                                                            <i class="las la-info-circle fs-6 link-info"></i> @lang('KYC Details')
                                                        </button>
                                                    </li>

                                                    <li>
                                                        <button type="button" class="dropdown-item decisionBtn" data-question="@lang('Do you confirm the approval of these documents?')" data-action="{{ route('admin.user.kyc.approve', $user->id) }}">
                                                            <i class="las la-check-circle fs-6 link-success"></i> @lang('Approve')
                                                        </button>
                                                    </li>

                                                    <li>
                                                        <button type="button" class="dropdown-item decisionBtn" data-question="@lang('Do you confirm the cancelation of these documents?')" data-action="{{ route('admin.user.kyc.cancel', $user->id) }}">
                                                            <i class="lar la-times-circle fs-6 link-warning"></i> @lang('Cancel')
                                                        </button>
                                                    </li>
                                                </ul>
                                            </div>
                                        @endif
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="100%" class="text-center">{{ __($emptyMessage) }}</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>

                @if ($users->hasPages())
                    <div class="card-footer pagination justify-content-center">
                        {{ paginateLinks($users) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasBoth" aria-labelledby="offcanvasBothLabel">
        <div class="offcanvas-header">
            <h5 id="offcanvasBothLabel" class="offcanvas-title">@lang('KYC Details')</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body my-auto mx-0 flex-grow-0">
            <div class="kycData"></div>
            <button type="button" class="btn btn-secondary d-grid w-100 mt-4" data-bs-dismiss="offcanvas">@lang('Cancel')</button>
        </div>
    </div>

    <x-decisionModal />
@endsection

@push('breadcrumb')
        <x-searchForm placeholder="Username / Email" dateSearch="yes" />
@endpush

@push('page-script')
    <script>
        (function ($) {
            "use strict";

            $('.detailBtn').on('click', function () {
                let kycData   = $(this).data('kyc_data');

                if (kycData) {                    
                    let fileDownloadUrl = '{{ route("admin.file.download",["filePath" => "verify"]) }}';
                    let infoHtml        = `<div class="demo-inline-spacing mt-3">
                                                <ul class="list-group">`;
    
                    kycData.forEach(element => {
                        if (!element.value) { return; }
                        if(element.type != 'file') {
                            infoHtml += `<li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>${element.name}</b>
                                            <span>${element.value}</span>
                                        </li>`;
                        } else {
                            infoHtml += `<li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>${element.name}</b>
                                            <span>
                                                <a href="${fileDownloadUrl}&fileName=${element.value}">
                                                    <i class="las la-arrow-circle-down"></i> @lang('Attachment')
                                                </a>
                                            </span>
                                        </li>`;
                        }
                    });

                    infoHtml += `</ul>
                    </div>`;

                    $('.kycData').html(infoHtml);
                }
            });
        })(jQuery);
    </script>
@endpush