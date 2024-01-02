@extends('admin.layouts.master')
@section('master')
    <div class="row">
        @if(request()->routeIs('admin.deposit.index') || request()->routeIs('admin.deposit.method') || request()->routeIs('admin.user.deposit') || request()->routeIs('admin.users.deposit.method'))
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-widget-separator-wrapper">
                        <div class="card-body card-widget-separator">
                            <div class="row gy-4 gy-sm-1">
                                <a href="{{ route('admin.deposit.done') }}" class="col-sm-6 col-lg-4">
                                    <div class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
                                        <div>
                                            <h3 class="mb-1">{{ showAmount($done) }} {{ __($setting->site_cur) }}</h3>
                                            <p class="mb-0">@lang('Done Deposits')</p>
                                        </div>
                                        <span class="badge bg-label-success rounded p-2 me-sm-4">
                                            <i class="las la-check-circle fs-3"></i>
                                        </span>
                                    </div>
                                    <hr class="d-none d-sm-block d-lg-none me-4">
                                </a>
                                <a href="{{ route('admin.deposit.pending') }}" class="col-sm-6 col-lg-4">
                                    <div class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
                                        <div>
                                            <h3 class="mb-1">{{ showAmount($pending) }} {{ __($setting->site_cur) }}</h3>
                                            <p class="mb-0">@lang('Pending Deposits')</p>
                                        </div>
                                        <span class="badge bg-label-warning rounded p-2 me-sm-4">
                                            <i class="las la-spinner fs-3"></i>
                                        </span>
                                    </div>
                                    <hr class="d-none d-sm-block d-lg-none me-4">
                                </a>
                                <a href="{{ route('admin.deposit.canceled') }}" class="col-sm-6 col-lg-4">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <h3 class="mb-1">{{ showAmount($canceled) }} {{ __($setting->site_cur) }}</h3>
                                            <p class="mb-0">@lang('Canceled Deposits')</p>
                                        </div>
                                        <span class="badge bg-label-danger rounded p-2">
                                            <i class="lar la-times-circle fs-3"></i>
                                        </span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endif

        <div class="col-xxl">
            <div class="card">
                <div class="card-body table-responsive text-nowrap">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>@lang('Gateway | Transaction')</th>
                                <th>@lang('Launched')</th>
                                <th>@lang('User')</th>
                                <th>@lang('Amount')</th>
                                <th>@lang('Conversion')</th>
                                <th>@lang('Type')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                            @forelse ($deposits as $deposit)
                                <tr>
                                    <td>
                                        <span class="fw-bold"> <a href="{{ appendQuery('method', @$deposit->gateway->alias) }}">{{ __(@$deposit->gateway->name) }}</a> </span>
                                        <br>
                                        <small> {{ $deposit->trx }} </small>
                                    </td>
                                    <td>
                                        {{ showDateTime($deposit->created_at) }}<br>
                                        {{ diffForHumans($deposit->created_at) }}
                                    </td>
                                    <td>

                                        @if($deposit->user_id)
                                        <span class="fw-bold">{{ $deposit->user->fullname }}</span>
                                        <br>
                                        <span class="small">
                                        <a href="{{ appendQuery('search', @$deposit->user->username) }}"><span>@</span>{{ $deposit->user->username }}</a>
                                        </span>
                                        @endif

                                        @if($deposit->agent_id)
                                        <span class="fw-bold">{{ $deposit->agent->fullname }}</span>
                                        <br>
                                        <span class="small">
                                        <a href="{{ appendQuery('search', @$deposit->agent->username) }}"><span>@</span>{{ $deposit->agent->username }}</a>
                                        </span>
                                       @endif

                                    </td>
                                    <td>
                                        {{ __($setting->cur_sym) }}{{ showAmount($deposit->amount ) }} + <span class="text-danger" data-bs-toggle="tooltip" data-bs-offset="0,8" data-bs-placement="top" data-bs-custom-class="tooltip-danger" title="@lang('Charge')">{{ showAmount($deposit->charge)}} </span>
                                        <br>
                                        <strong data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="bottom" data-bs-html="true" title="@lang('Amount with charge')">
                                        {{ showAmount($deposit->final_amo) }} {{ __($setting->site_cur) }}
                                        </strong>
                                    </td>
                                    <td>
                                        1 {{ __($setting->site_cur) }} =  {{ showAmount($deposit->rate) }} {{__($deposit->method_currency)}}
                                        <br>
                                        <strong>{{ showAmount($deposit->final_amo) }} {{__($deposit->method_currency)}}</strong>
                                    </td>
                                    <td>
                                        @if ($deposit->user_id)
                                            <span class="badge bg-label-primary">@lang('User')</span>
                                        @elseif ($deposit->agent_id)
                                            <span class="badge bg-label-success">@lang('Agent')</span>
                                        @endif
                                    </td>
                                    <td>
                                        @if ($deposit->status == ManageStatus::PAYMENT_PENDING)
                                            <span class="badge bg-label-warning">@lang('Pending')</span>
                                        @elseif ($deposit->status == ManageStatus::PAYMENT_SUCCESS)
                                            <span class="badge bg-label-success">@lang('Done')</span>
                                        @elseif ($deposit->status == ManageStatus::PAYMENT_REJECT)
                                            <span class="badge bg-label-danger">@lang('Canceled')</span>
                                        @endif
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-sm rounded-pill btn-label-info detailBtn"
                                            data-bs-toggle      = "offcanvas"
                                            data-bs-target      = "#offcanvasBoth"
                                            aria-controls       = "offcanvasBoth"
                                            data-date           = "{{ showDateTime($deposit->created_at) }}"
                                            data-trx            = "{{ $deposit->trx }}"
                                            data-username       = "{{ @$deposit->user_id ? @$deposit->user->username : @$deposit->agent->username }}"
                                            data-method         = "{{ __(@$deposit->gateway->name) }}"
                                            data-amount         = "{{ $deposit->amount }} {{ __($setting->site_cur) }}"
                                            data-charge         = "{{ showAmount($deposit->charge ) }} {{ __($setting->site_cur) }}"
                                            data-after_charge   = "{{ showAmount($deposit->amount + $deposit->charge ) }} {{ __($setting->site_cur) }}"
                                            data-rate           = "1 {{ __($setting->site_cur) }} = {{ showAmount($deposit->rate) }} {{__($deposit->baseCurrency()) }}"
                                            data-payable        = "{{ showAmount($deposit->final_amo) }} {{ __($deposit->method_currency) }}"
                                            data-status         = "{{ $deposit->status }}"
                                            data-user_data      = "{{ json_encode($deposit->detail) }}"
                                            data-admin_feedback = "{{ $deposit->admin_feedback }}">

                                            <span class="tf-icons las la-info-circle me-1"></span> @lang('Details')
                                        </button>

                                        @if ($deposit->status == ManageStatus::PAYMENT_PENDING)
                                            <div class="btn-group">
                                                <button class="btn btn-sm rounded-pill btn-label-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">@lang('Action')</button>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <button type="button" class="dropdown-item decisionBtn" data-question="@lang('Do you confirm the approval of this transaction?')" data-action="{{ route('admin.deposit.approve', $deposit->id) }}">
                                                            <i class="las la-check-circle fs-6 link-success"></i> @lang('Approve')
                                                        </button>
                                                    </li>

                                                    <li>
                                                        <button type="button" class="dropdown-item cancelBtn" data-id="{{ $deposit->id }}">
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

                @if ($deposits->hasPages())
                    <div class="card-footer pagination justify-content-center">
                        {{ paginateLinks($deposits) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasBoth" aria-labelledby="offcanvasBothLabel">
        <div class="offcanvas-header">
            <h5 id="offcanvasBothLabel" class="offcanvas-title">@lang('Deposit Details')</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body my-auto mx-0 flex-grow-0">
            <div class="basicData"></div>
            <div class="userData"></div>
            <button type="button" class="btn btn-secondary d-grid w-100 mt-4" data-bs-dismiss="offcanvas">@lang('Cancel')</button>
        </div>
    </div>

    <div class="modal-onboarding modal fade animate__animated" id="cancelModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content text-center">
                <div class="modal-header border-0">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <form action="{{ route('admin.deposit.cancel') }}" method="POST">
                    @csrf
                    <input type="hidden" name="id">

                    <div class="modal-body p-0 text-center">
                        <div class="onboarding-media">
                            <div class="mx-2">
                                <img src="{{ asset('assets/admin/images/light.png') }}" alt="light" width="100" class="img-fluid">
                            </div>
                        </div>
                        <div class="onboarding-content mb-0">
                            <h4 class="onboarding-title text-body">@lang('Cancel Deposit Confirmation')</h4>
                            <div class="onboarding-info question">@lang('Reason')</div>

                            <div class="row">
                                <div class="col-sm-12">
                                  <div class="mb-3">
                                    <textarea class="form-control" name="admin_feedback" rows="3" required></textarea>
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer border-0 justify-content-center">
                        <button type="submit" class="btn btn-primary">@lang('Yes')</button>
                        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">@lang('No')</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <x-decisionModal />
@endsection

@push('breadcrumb')
    <x-searchForm placeholder="TRX / Username" dateSearch="yes" />
@endpush

@push('page-script')
    <script>
        (function ($) {
            "use strict";

            $('.detailBtn').on('click', function () {
                let userData   = $(this).data('user_data');
                let statusHtml =  ``;

                if ($(this).data('status') == 1) {
                    statusHtml += `<span class="badge bg-label-success">@lang('Done')</span>`;
                } else if ($(this).data('status') == 2) {
                    statusHtml += `<span class="badge bg-label-warning">@lang('Pending')</span>`;
                } else {
                    statusHtml += `<span class="badge bg-label-danger">@lang('Canceled')</span>`
                }

                let basicHtml  = `<div class="demo-inline-spacing mb-4">
                                    <h5>@lang('Basic Information')</h5>
                                    <ul class="list-group">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('Date')</b>
                                            <span>${$(this).data('date')}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('Trx Number')</b>
                                            <span>${$(this).data('trx')}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('Username')</b>
                                            <span>${$(this).data('username')}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('Method')</b>
                                            <span>${$(this).data('method')}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('Amount')</b>
                                            <span>${$(this).data('amount')}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('Charge')</b>
                                            <span>${$(this).data('charge')}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('After Charge')</b>
                                            <span>${$(this).data('after_charge')}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('Rate')</b>
                                            <span>${$(this).data('rate')}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('Payable')</b>
                                            <span>${$(this).data('payable')}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <b>@lang('Status')</b>
                                            ${statusHtml}
                                        </li>`;

                if ($(this).data('admin_feedback')) {
                    basicHtml += `<li class="list-group-item align-items-center">
                                    <b class="text-primary">@lang('Admin Feedback')</b>
                                    <p class="mt-2 d-none d-sm-block">${$(this).data('admin_feedback')}</p>
                                </li>`;
                }

                basicHtml += `</ul>
                    </div>`;

                $('.basicData').html(basicHtml);

                if (userData) {
                    let fileDownloadUrl = '{{ route("admin.file.download",["filePath" => "verify"]) }}';
                    let infoHtml        = `<div class="demo-inline-spacing mt-3">
                                                <h5>@lang('Deposit User Data')</h5>
                                                <ul class="list-group">`;

                    userData.forEach(element => {
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

                    $('.userData').html(infoHtml);
                }
            });

            $('.cancelBtn').on('click', function () {
                let modal = $('#cancelModal');
                modal.find('[name=id]').val($(this).data('id'));
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush
